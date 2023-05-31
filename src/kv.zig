const std = @import("std");
const c = @import("nats_api.zig");
var kvStore: ?*c.kvStore = null;
var s: c.natsStatus = c.NATS_OK;

pub fn init(js: ?*c.jsCtx, bucket: [*:0]const u8) void {
    s = c.js_KeyValue(&kvStore, js, bucket);
    if (s == c.NATS_NOT_FOUND) {
        var kvConfig: c.kvConfig = undefined;
        s = c.kvConfig_Init(&kvConfig);
        if (s != c.NATS_OK) {
            std.debug.panic("Error init kv config: {s}\n", .{c.natsStatus_GetText(s)});
        }
        kvConfig.Bucket = bucket;
        kvConfig.Description = "bucket description";
        kvConfig.History = 1;
        kvConfig.StorageType = c.js_FileStorage;
        s = c.js_CreateKeyValue(&kvStore, js, &kvConfig);
        if (s != c.NATS_OK) {
            std.debug.panic("Error create kv store: {s}\n", .{c.natsStatus_GetText(s)});
        }
    } else if (s != c.NATS_OK) {
        std.debug.panic("Error getting kv store: {s}\n", .{c.natsStatus_GetText(s)});
    }
}

pub fn destroyKvStore() void {
    if (kvStore) |kv| {
        c.kvStore_Destroy(kv);
    }
}

pub fn putString(key: [*:0]const u8, value: [*:0]const u8) void {
    s = c.kvStore_PutString(null, kvStore, key, value);
    if (s != c.NATS_OK) {
        std.debug.panic("Error kvStore_PutString: {s}\n", .{c.natsStatus_GetText(s)});
    }
}

pub fn getString(key: [*:0]const u8) ?[]const u8 {
    var entry: ?*c.kvEntry = null;
    s = c.kvStore_Get(&entry, kvStore, key);
    defer c.kvEntry_Destroy(entry);
    if (s != c.NATS_OK) {
        std.debug.panic("Error kvStore_Get: {s}\n", .{c.natsStatus_GetText(s)});
    }
    var data = c.kvEntry_ValueString(entry);
    var len = @intCast(usize, c.kvEntry_ValueLen(entry));
    return data[0..len+1];
}
