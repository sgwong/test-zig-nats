const std = @import("std");
const c = @import("nats_api.zig");
const nats = @import("nats.zig");
const jsapi = @import("js.zig");
const kv = @import("kv.zig");
const json = std.json;
const ctime = @cImport(@cInclude("time.h"));

const msgPackWriter = @import("msgpack/writer.zig").msgPackWriter;
const msgPackReader = @import("msgpack/reader.zig").msgPackReader;

const STATS_IN = 0x1;
const STATS_OUT = 0x2;
const STATS_COUNT = 0x4;

const is_async = false;
const delStream = true;
const total: u32 = 100;

const payload =
    \\{
    \\    "vals": {
    \\        "testing": 1,
    \\        "production": 42
    \\    }
    \\}
;
const payload2 =
    \\{
    \\    "vals": {
    \\        "testing": 1,
    \\        "production": 42
    \\    }
    \\    //"uptime": 9999
    \\}
;

const Config = struct {
    const Self = @This();
    vals: struct { testing: u8, production: u8 },
    uptime: u64,
};

fn pubMessages(conn: ?*c.natsConnection, stream: [*:0]const u8) !void {
    var s: c.natsStatus = c.NATS_OK;

    var count: u32 = 0;
    std.debug.print("\nSending {} messages to subject '{s}'\n", .{ total, stream });
    var start = c.nats_Now();
    const cfg = Config{
        .vals = .{
            .testing = 1,
            .production = 2,
        },
        .uptime = 5,
    };

    var arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    defer arena.deinit();
    const allocator = arena.allocator();
    while ((s == c.NATS_OK and count < total)) : (count += 1) {
        var list = try std.ArrayList(u8).initCapacity(allocator, @sizeOf(Config));
        defer list.deinit();
        var writer = msgPackWriter(list.writer(), .{});
        try writer.writeAny(cfg);
        var toWrite = try list.toOwnedSlice();
        s = jsapi.publish("test-stream.test", toWrite);
        //s = jsapi.publish("test-stream.test", payload[0..]);
    }

    if (s == c.NATS_OK and is_async) {
        jsapi.asyncPublishAck();
    }

    var elapsed = c.nats_Now() - start;

    printPerf("Sent", start, &elapsed, count);
    jsapi.showStat(STATS_OUT, conn.?);

    jsapi.showStreamInfo(stream);
}

fn jsFetchMessage(conn: ?*c.natsConnection, stream: [*:0]const u8, sub: ?*c.natsSubscription) !void {
    var s: c.natsStatus = c.NATS_OK;
    var list: c.natsMsgList = undefined;
    var count: i32 = 0;
    var arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    defer arena.deinit();
    var allocator = arena.allocator();

    var start = c.nats_Now();

    while (s == c.NATS_OK and count < total) {
        s = jsapi.fetch(&list, sub, 1023, 5000);
        if (s != c.NATS_OK) break;
        count += list.Count;
        var i: usize = 0;
        while (s == c.NATS_OK and i < list.Count) : (i += 1) {
            var data = jsapi.getListMessageData(list, i);
            //try parseJson(allocator, data);
            var readStream = std.io.fixedBufferStream(data);
            var reader = msgPackReader(readStream.reader());
            var value = try reader.readValue(&arena);
            var arrlist = try std.ArrayList(u8).initCapacity(allocator, data.len);
            defer arrlist.deinit();
            try value.root.stringify(.{}, arrlist.writer());
            _ = try arrlist.toOwnedSlice();
            //var valuestr = try arrlist.toOwnedSlice();
            //std.debug.print("{s}\n", .{valuestr});
            jsapi.ackReceivedMessage(list, i);
        }
        c.natsMsgList_Destroy(&list);
    }
    var elapsed = c.nats_Now() - start;
    jsapi.showStat(STATS_IN | STATS_OUT, conn.?);
    printPerf("Received", start, &elapsed, count);

    jsapi.showStreamInfo(stream);
}

pub fn parseJson(allocator: std.mem.Allocator, data: []const u8) !void {
    //std.debug.print("received msg: {s}\n", .{data});
    var res = json.parseFromSlice(Config, allocator, data, .{});
    _ = try res;

    // if (res) |v| {
    //     std.debug.print("parse json : {} {} {?}\n", .{ v.vals.testing, v.vals.production, v.uptime });
    // } else |err| {
    //     std.debug.print("parse json error: {}\n", .{err});
    // }
}

pub fn main() !void {
    var opts: ?*c.natsOptions = null;
    var conn: ?*c.natsConnection = null;
    var js: ?*c.jsCtx = null;
    var errors: c_int = 0;
    var stream = "test-stream"; //var stream: [*:0]const u8 = "test-stream";
    //var durable = "test-durable"; //[*:0]const u8 = "test-durable";
    var durable: ?[*:0]const u8 = null; //[*:0]const u8 = "test-durable";
    var subject = "test-stream.*";

    var sub: ?*c.natsSubscription = null;

    const stdin = std.io.getStdIn();
    const reader = stdin.reader();

    opts = nats.createNatsOptions();
    defer nats.destroyNatsOptions();

    conn = nats.connect();
    defer nats.destroyNatsConnection();

    js = jsapi.initJetStream(conn, stream, subject);
    defer jsapi.destroyJs();

    try pubMessages(conn, stream);

    if (errors != 0)
        std.debug.print("There were {} asynchronous errors\n", .{errors});

    jsapi.initJsSubOptions(stream, durable);
    jsapi.jsSubscribe(&sub, subject, durable);

    try jsFetchMessage(conn, stream, sub);

    if (delStream) {
        jsapi.deleteStream(stream);
    }

    kv.init(js, "bucket1");
    defer kv.destroyKvStore();
    kv.putString("key1", "value2");
    var value = kv.getString("key1");
    if (std.mem.eql(u8, value.?, "value2")) {
        std.debug.panic("Error value not equal: expect value2 get {s}\n", .{value.?});
    }

    showTime();

    std.debug.print("Wait key press ENTER end\n", .{});
    _ = try reader.readByte();
}

fn printPerf(perfTxt: [*:0]const u8, start: i64, elapsed: *i64, count: i64) void {
    if ((start > 0) and (elapsed.* == 0))
        elapsed.* = c.nats_Now() - start;

    if (elapsed.* <= 0) {
        std.debug.print("\nNot enough messages or too fast to report performance!\n", .{});
    } else {
        std.debug.print("\n{s} {} messages in {} milliseconds ({d:.3} msgs/sec)\n", .{ perfTxt, count, elapsed.*, ((@intToFloat(f64, count) * 1000.0) / @intToFloat(f64, elapsed.*)) });
    }
}

fn showTime() void {
    var dt_str_buf: [40]u8 = undefined;
    const t = ctime.time(null);
    const lt = ctime.localtime(&t);
    const format = "%a %d %b %Y %I:%M:%S %p %Z";
    const dt_str_len = ctime.strftime(&dt_str_buf, dt_str_buf.len, format, lt);
    std.debug.print("{}-{}-{}\n", .{ lt.*.tm_year + 1900, lt.*.tm_mon + 1, lt.*.tm_mday });
    std.debug.print("current time: {} {s} {any} {any}\n", .{ dt_str_len, dt_str_buf[0..], t, lt.* });
}

test "simple test" {
    var list = std.ArrayList(i32).init(std.testing.allocator);
    defer list.deinit(); // try commenting this out and see if zig detects the memory leak!
    try list.append(42);
    try std.testing.expectEqual(@as(i32, 42), list.pop());
}
