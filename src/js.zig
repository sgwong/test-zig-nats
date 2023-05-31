const std = @import("std");
const c = @import("nats_api.zig");

var s: c.natsStatus = c.NATS_OK;
var js: ?*c.jsCtx = null;
var jsOpts: c.jsOptions = undefined;
var errors: c_int = 0;
var jerr: c.jsErrCode = undefined;
var so: c.jsSubOptions = undefined;

const STATS_IN = 0x1;
const STATS_OUT = 0x2;
const STATS_COUNT = 0x4;
const is_async = true;

pub fn initJetStream(conn: ?*c.natsConnection, stream: [*:0]const u8, subject: [*:0]const u8) ?*c.jsCtx {
    s = c.jsOptions_Init(&jsOpts);
    if (s != c.NATS_OK) {
        std.debug.panic("fail init jsoptions: {s}", .{c.natsStatus_GetText(s)});
    }

    if (is_async) {
        jsOpts.PublishAsync.ErrHandler = &_jsPubErr;
        jsOpts.PublishAsync.ErrHandlerClosure = &errors;
    }
    s = c.natsConnection_JetStream(&js, conn, &jsOpts);

    if (s != c.NATS_OK) {
        std.debug.panic("fail to connect to jetstream: {s}", .{c.natsStatus_GetText(s)});
    }
    std.debug.print("Connected to nats jetstream\n", .{});

    var si: ?*c.jsStreamInfo = null;
    s = c.js_GetStreamInfo(&si, js, stream, null, &jerr);
    defer c.jsStreamInfo_Destroy(si);

    if (s == c.NATS_NOT_FOUND) {
        std.debug.print("Stream not found, creating it\n", .{});
        var cfg: c.jsStreamConfig = undefined;
        s = c.jsStreamConfig_Init(&cfg);
        cfg.Name = stream;
        cfg.Subjects = @constCast(&[_]?[*:0]const u8{subject}); //cfg.Subjects = @constCast(&[_][*c]const u8{subject});
        cfg.SubjectsLen = 1;
        //make it memory storage
        cfg.Storage = c.js_FileStorage; //cfg.Storage = c.js_MemoryStorage;
        s = c.js_AddStream(&si, js, &cfg, null, &jerr);
        if (s != c.NATS_OK) {
            std.debug.panic("Error creating stream: {s} {}\n", .{ c.natsStatus_GetText(s), jerr });
        }
    }

    std.debug.print("Stream {s} has {} messages {} bytes\n", .{ si.?.*.Config.*.Name, si.?.*.State.Msgs, si.?.*.State.Bytes });

    return js;
}

pub fn showStreamInfo(stream: [*:0]const u8) void {
    var si: ?*c.jsStreamInfo = null;
    s = c.js_GetStreamInfo(&si, js, stream, null, jerr);
    defer c.jsStreamInfo_Destroy(si);
    if (s != c.NATS_OK) {
        std.debug.panic("Error getting stream info: {s} \n", .{c.natsStatus_GetText(s)});
    }
    std.debug.print("\nStream {s} has {} messages {} bytes\n", .{ si.?.*.Config.*.Name, si.?.*.State.Msgs, si.?.*.State.Bytes });
}

pub fn showStat(mode: c_int, conn: *c.natsConnection) void {
    var stats: ?*c.natsStatistics = null;

    s = c.natsStatistics_Create(&stats);
    defer c.natsStatistics_Destroy(stats);
    if (s != c.NATS_OK) {
        std.debug.panic("Error get nats statistic: {s} \n", .{c.natsStatus_GetText(s)});
    }
    s = printStats(mode, conn, null, stats.?);
    if (s != c.NATS_OK) {
        std.debug.panic("Error print stats: {s}\n", .{c.natsStatus_GetText(s)});
    }
}

fn printStats(mode: c_int, conn: *c.natsConnection, sub: ?*c.natsSubscription, stats: *c.natsStatistics) c.natsStatus {
    var inMsgs: u64 = 0;
    var inBytes: u64 = 0;
    var outMsgs: u64 = 0;
    var outBytes: u64 = 0;
    var reconnected: u64 = 0;
    var pending: i32 = 0;
    var delivered: i64 = 0;
    var sdropped: i64 = 0;

    s = c.natsConnection_GetStats(conn, stats);
    if (s == c.NATS_OK)
        s = c.natsStatistics_GetCounts(stats, &inMsgs, &inBytes, &outMsgs, &outBytes, &reconnected);
    if ((s == c.NATS_OK) and (sub != null)) {
        s = c.natsSubscription_GetStats(sub, &pending, null, null, null, &delivered, &sdropped);

        // Since we use AutoUnsubscribe(), when the max has been reached,
        // the subscription is automatically closed, so this call would
        // return "Invalid Subscription". Ignore this error.
        if (s == c.NATS_INVALID_SUBSCRIPTION) {
            s = c.NATS_OK;
            pending = 0;
        }
    }

    if (s == c.NATS_OK) {
        if ((mode & STATS_IN) != 0) {
            std.debug.print("In Msgs: {} - In Bytes: {} - ", .{ inMsgs, inBytes });
        }
        if ((mode & STATS_OUT) != 0) {
            std.debug.print("Out Msgs: {} - Out Bytes: {} - ", .{ outMsgs, outBytes });
        }
        if ((mode & STATS_COUNT) != 0) {
            std.debug.print("Delivered: {} - ", .{delivered});
            std.debug.print("Pending: {} - ", .{pending});
            std.debug.print("Dropped: {} - ", .{sdropped});
        }
        std.debug.print("Reconnected: {}\n", .{reconnected});
    }

    return s;
}

pub fn deleteStream(stream: [*:0]const u8) void {
    std.debug.print("Deleting stream {s}\n", .{stream});
    s = c.js_DeleteStream(js, stream, null, &jerr);
    if (s != c.NATS_OK) {
        std.debug.panic("Error deleting stream: {s}\n", .{c.natsStatus_GetText(s)});
    }
}

pub fn destroyJs() void {
    if (js) |j| {
        defer c.jsCtx_Destroy(j);
    }
}

pub fn publish(subject: [*:0]const u8, payload: []const u8) c.natsStatus {
    if (is_async) {
        s = c.js_PublishAsync(js, subject, payload.ptr, @intCast(c_int, payload.len), null);
    } else {
        var pa: ?*c.jsPubAck = null;
        s = c.js_Publish(&pa, js, subject, payload.ptr, @as(c_int, payload.len), null, jerr);
        if (s == c.NATS_OK) {
            if (pa.?.*.Duplicate)
                std.debug.print("Received duplicate message! sequence={}\n", .{pa.?.*.Sequence});
            c.jsPubAck_Destroy(pa);
        }
    }
    return s;
}

pub fn asyncPublishAck() void {
    var jsPubOpts: c.jsPubOptions = undefined;
    s = c.jsPubOptions_Init(&jsPubOpts);
    if (s != c.NATS_OK) {
        std.debug.panic("fail to init js pub options: {s}", .{c.natsStatus_GetText(s)});
    }
    jsPubOpts.MaxWait = 3000;
    s = c.js_PublishAsyncComplete(js, &jsPubOpts);
    if (s == c.NATS_TIMEOUT) {
        var list: c.natsMsgList = undefined;
        s = c.js_PublishAsyncGetPendingList(&list, js);
        c.natsMsgList_Destroy(&list);
    }
}

pub fn initJsSubOptions(stream: []const u8, durable: ?[*:0]const u8) void {
    s = c.jsSubOptions_Init(&so);
    if (s != c.NATS_OK) {
        std.debug.panic("fail to init js sub options: {s}", .{c.natsStatus_GetText(s)});
    }

    so.Stream = stream.ptr;
    so.Consumer = durable;
}

pub fn jsSubscribe(subptr: *?*c.natsSubscription, subject: [*:0]const u8, durable: ?[*:0]const u8) void {
    s = c.js_PullSubscribe(subptr, js, subject, durable, &jsOpts, &so, &jerr);
    if (s != c.NATS_OK) {
        std.debug.panic("Error js_PullSubscribe: {s}, jsErr: {} \n", .{ c.natsStatus_GetText(s), jerr });
    }
    s = c.natsSubscription_SetPendingLimits(subptr.*, -1, -1);
    if (s != c.NATS_OK) {
        std.debug.panic("Error natsSubscription_SetPendingLimits: {s} \n", .{c.natsStatus_GetText(s)});
    }
}

pub fn fetch(list: *c.natsMsgList, sub: ?*c.natsSubscription, batch: i32, timeout: i64) c.natsStatus {
    s = c.natsSubscription_Fetch(list, sub, batch, timeout, jerr);
    return s;
}

pub fn getListMessageData(list: c.natsMsgList, i: usize) []const u8 {
    var natsMsg = list.Msgs[i];
    var data = c.natsMsg_GetData(natsMsg);
    var data_len = @intCast(usize, c.natsMsg_GetDataLength(natsMsg));
    return data[0..data_len];
}

pub fn ackReceivedMessage(list: c.natsMsgList, i: usize) void {
    s = c.natsMsg_Ack(list.Msgs[i], &jsOpts);
    if (s != c.NATS_OK) {
        std.debug.print("fail to ack msg", .{});
    }
}

fn _jsPubErr(js1: ?*c.jsCtx, puback: ?*c.jsPubAckErr, closuer: ?*anyopaque) callconv(.C) void {
    _ = js1;
    _ = closuer;
    _ = puback;
}
