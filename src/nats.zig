const std = @import("std");
const c = @import("nats_api.zig");

var conn: ?*c.natsConnection = null;
var opts: ?*c.natsOptions = null;
var s: c.natsStatus = c.NATS_OK;

fn isFail(r: c_uint) bool {
    return r != c.NATS_OK;
}

pub fn createNatsOptions() *c.natsOptions {
    if (isFail(c.natsOptions_Create(&opts))) {
        std.debug.panic("nats no memory: {s}", .{c.natsStatus_GetText(s)});
    }
    if (isFail(c.natsOptions_SetMaxReconnect(opts, 5))) {
        std.debug.panic("fail to set max reconnect: {s}", .{c.natsStatus_GetText(s)});
    }
    if (isFail(c.natsOptions_SetReconnectWait(opts, 100))) {
        std.debug.panic("fail to set reconnect wait: {s}", .{c.natsStatus_GetText(s)});
    }
    if (isFail(c.natsOptions_SetRetryOnFailedConnect(opts, true, null, null))) {
        std.debug.panic("fail to set retry on failed connect: {s}", .{c.natsStatus_GetText(s)});
    }
    return opts.?;
}

pub fn destroyNatsOptions() void {
    if (opts) |o| {
        c.natsOptions_Destroy(o);
    }
}

pub fn connect() ?*c.natsConnection {
    s = c.natsConnection_Connect(&conn, opts);
    std.debug.print("natsConnection_Connect call took returned: {s}\n", .{c.natsStatus_GetText(s)});
    if (s != c.NATS_OK) {
        std.debug.panic("fail to connect to nats server: {s}", .{c.natsStatus_GetText(s)});
    }
    return conn;
}

pub fn destroyNatsConnection() void {
    if (conn) |con| {
        c.natsConnection_Destroy(con);
    }
}
