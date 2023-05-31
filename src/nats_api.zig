pub const HANDLE = ?*anyopaque;
pub const PHANDLE = [*c]HANDLE;
pub const DWORD = c_ulong;
pub const PVOID = ?*anyopaque;
pub const ULONG_PTR = c_ulonglong;
pub const CHAR = u8;
pub const SHORT = c_short;
pub const LONG = c_long;

pub const DWORD64 = c_ulonglong;
pub const WORD = c_ushort;
pub const BYTE = u8;
pub const ULONGLONG = c_ulonglong;
pub const LONGLONG = c_longlong;

pub const struct___natsThread = extern struct {
    t: HANDLE,
    id: DWORD,
};

pub const struct__LIST_ENTRY = extern struct {
    Flink: [*c]struct__LIST_ENTRY,
    Blink: [*c]struct__LIST_ENTRY,
};
pub const LIST_ENTRY = struct__LIST_ENTRY;

pub const struct__RTL_CRITICAL_SECTION_DEBUG = extern struct {
    Type: WORD,
    CreatorBackTraceIndex: WORD,
    CriticalSection: [*c]struct__RTL_CRITICAL_SECTION,
    ProcessLocksList: LIST_ENTRY,
    EntryCount: DWORD,
    ContentionCount: DWORD,
    Flags: DWORD,
    CreatorBackTraceIndexHigh: WORD,
    SpareWORD: WORD,
};

pub const CRITICAL_SECTION = RTL_CRITICAL_SECTION;
pub const RTL_CRITICAL_SECTION = struct__RTL_CRITICAL_SECTION;
pub const PRTL_CRITICAL_SECTION_DEBUG = [*c]struct__RTL_CRITICAL_SECTION_DEBUG;
pub const struct__RTL_CRITICAL_SECTION = extern struct {
    DebugInfo: PRTL_CRITICAL_SECTION_DEBUG,
    LockCount: LONG,
    RecursionCount: LONG,
    OwningThread: HANDLE,
    LockSemaphore: HANDLE,
    SpinCount: ULONG_PTR,
};

pub const struct__RTL_CONDITION_VARIABLE = extern struct {
    Ptr: PVOID,
};
pub const RTL_CONDITION_VARIABLE = struct__RTL_CONDITION_VARIABLE;
pub const PRTL_CONDITION_VARIABLE = [*c]struct__RTL_CONDITION_VARIABLE;

pub const CONDITION_VARIABLE = RTL_CONDITION_VARIABLE;
pub const PCONDITION_VARIABLE = [*c]RTL_CONDITION_VARIABLE;

pub const struct__RTL_RUN_ONCE = extern struct {
    Ptr: PVOID,
};
pub const RTL_RUN_ONCE = struct__RTL_RUN_ONCE;

pub const INIT_ONCE = RTL_RUN_ONCE;

pub const natsThread = struct___natsThread;
pub const natsThreadLocal = DWORD;
pub const natsMutex = CRITICAL_SECTION;
pub const natsCondition = CONDITION_VARIABLE;
pub const natsInitOnceType = INIT_ONCE;
pub const natsSockLen = c_int;
pub const natsRecvLen = c_int;
pub extern fn nats_asprintf(newStr: [*c][*c]u8, fmt: [*c]const u8, ...) c_int;
pub extern fn nats_strcasestr(haystack: [*c]const u8, needle: [*c]const u8) [*c]u8;
pub extern fn nats_snprintf(buffer: [*c]u8, countszt: usize, format: [*c]u8, ...) c_int;
pub const NATS_CONN_STATUS_DISCONNECTED: c_int = 0;
pub const NATS_CONN_STATUS_CONNECTING: c_int = 1;
pub const NATS_CONN_STATUS_CONNECTED: c_int = 2;
pub const NATS_CONN_STATUS_CLOSED: c_int = 3;
pub const NATS_CONN_STATUS_RECONNECTING: c_int = 4;
pub const NATS_CONN_STATUS_DRAINING_SUBS: c_int = 5;
pub const NATS_CONN_STATUS_DRAINING_PUBS: c_int = 6;
pub const natsConnStatus = c_uint;
pub const NATS_OK: c_int = 0;
pub const NATS_ERR: c_int = 1;
pub const NATS_PROTOCOL_ERROR: c_int = 2;
pub const NATS_IO_ERROR: c_int = 3;
pub const NATS_LINE_TOO_LONG: c_int = 4;
pub const NATS_CONNECTION_CLOSED: c_int = 5;
pub const NATS_NO_SERVER: c_int = 6;
pub const NATS_STALE_CONNECTION: c_int = 7;
pub const NATS_SECURE_CONNECTION_WANTED: c_int = 8;
pub const NATS_SECURE_CONNECTION_REQUIRED: c_int = 9;
pub const NATS_CONNECTION_DISCONNECTED: c_int = 10;
pub const NATS_CONNECTION_AUTH_FAILED: c_int = 11;
pub const NATS_NOT_PERMITTED: c_int = 12;
pub const NATS_NOT_FOUND: c_int = 13;
pub const NATS_ADDRESS_MISSING: c_int = 14;
pub const NATS_INVALID_SUBJECT: c_int = 15;
pub const NATS_INVALID_ARG: c_int = 16;
pub const NATS_INVALID_SUBSCRIPTION: c_int = 17;
pub const NATS_INVALID_TIMEOUT: c_int = 18;
pub const NATS_ILLEGAL_STATE: c_int = 19;
pub const NATS_SLOW_CONSUMER: c_int = 20;
pub const NATS_MAX_PAYLOAD: c_int = 21;
pub const NATS_MAX_DELIVERED_MSGS: c_int = 22;
pub const NATS_INSUFFICIENT_BUFFER: c_int = 23;
pub const NATS_NO_MEMORY: c_int = 24;
pub const NATS_SYS_ERROR: c_int = 25;
pub const NATS_TIMEOUT: c_int = 26;
pub const NATS_FAILED_TO_INITIALIZE: c_int = 27;
pub const NATS_NOT_INITIALIZED: c_int = 28;
pub const NATS_SSL_ERROR: c_int = 29;
pub const NATS_NO_SERVER_SUPPORT: c_int = 30;
pub const NATS_NOT_YET_CONNECTED: c_int = 31;
pub const NATS_DRAINING: c_int = 32;
pub const NATS_INVALID_QUEUE_NAME: c_int = 33;
pub const NATS_NO_RESPONDERS: c_int = 34;
pub const NATS_MISMATCH: c_int = 35;
pub const NATS_MISSED_HEARTBEAT: c_int = 36;
pub const natsStatus = c_uint;
pub const JSAccountResourcesExceededErr: c_int = 10002;
pub const JSBadRequestErr: c_int = 10003;
pub const JSClusterIncompleteErr: c_int = 10004;
pub const JSClusterNoPeersErr: c_int = 10005;
pub const JSClusterNotActiveErr: c_int = 10006;
pub const JSClusterNotAssignedErr: c_int = 10007;
pub const JSClusterNotAvailErr: c_int = 10008;
pub const JSClusterNotLeaderErr: c_int = 10009;
pub const JSClusterRequiredErr: c_int = 10010;
pub const JSClusterTagsErr: c_int = 10011;
pub const JSConsumerCreateErr: c_int = 10012;
pub const JSConsumerNameExistErr: c_int = 10013;
pub const JSConsumerNotFoundErr: c_int = 10014;
pub const JSSnapshotDeliverSubjectInvalidErr: c_int = 10015;
pub const JSConsumerDurableNameNotInSubjectErr: c_int = 10016;
pub const JSConsumerDurableNameNotMatchSubjectErr: c_int = 10017;
pub const JSConsumerDurableNameNotSetErr: c_int = 10018;
pub const JSConsumerEphemeralWithDurableInSubjectErr: c_int = 10019;
pub const JSConsumerEphemeralWithDurableNameErr: c_int = 10020;
pub const JSStreamExternalApiOverlapErr: c_int = 10021;
pub const JSStreamExternalDelPrefixOverlapsErr: c_int = 10022;
pub const JSInsufficientResourcesErr: c_int = 10023;
pub const JSStreamInvalidExternalDeliverySubjErr: c_int = 10024;
pub const JSInvalidJSONErr: c_int = 10025;
pub const JSMaximumConsumersLimitErr: c_int = 10026;
pub const JSMaximumStreamsLimitErr: c_int = 10027;
pub const JSMemoryResourcesExceededErr: c_int = 10028;
pub const JSMirrorConsumerSetupFailedErr: c_int = 10029;
pub const JSMirrorMaxMessageSizeTooBigErr: c_int = 10030;
pub const JSMirrorWithSourcesErr: c_int = 10031;
pub const JSMirrorWithStartSeqAndTimeErr: c_int = 10032;
pub const JSMirrorWithSubjectFiltersErr: c_int = 10033;
pub const JSMirrorWithSubjectsErr: c_int = 10034;
pub const JSNoAccountErr: c_int = 10035;
pub const JSClusterUnSupportFeatureErr: c_int = 10036;
pub const JSNoMessageFoundErr: c_int = 10037;
pub const JSNotEmptyRequestErr: c_int = 10038;
pub const JSNotEnabledForAccountErr: c_int = 10039;
pub const JSClusterPeerNotMemberErr: c_int = 10040;
pub const JSRaftGeneralErr: c_int = 10041;
pub const JSRestoreSubscribeFailedErr: c_int = 10042;
pub const JSSequenceNotFoundErr: c_int = 10043;
pub const JSClusterServerNotMemberErr: c_int = 10044;
pub const JSSourceConsumerSetupFailedErr: c_int = 10045;
pub const JSSourceMaxMessageSizeTooBigErr: c_int = 10046;
pub const JSStorageResourcesExceededErr: c_int = 10047;
pub const JSStreamAssignmentErr: c_int = 10048;
pub const JSStreamCreateErr: c_int = 10049;
pub const JSStreamDeleteErr: c_int = 10050;
pub const JSStreamGeneralError: c_int = 10051;
pub const JSStreamInvalidConfig: c_int = 10052;
pub const JSStreamLimitsErr: c_int = 10053;
pub const JSStreamMessageExceedsMaximumErr: c_int = 10054;
pub const JSStreamMirrorNotUpdatableErr: c_int = 10055;
pub const JSStreamMismatchErr: c_int = 10056;
pub const JSStreamMsgDeleteFailed: c_int = 10057;
pub const JSStreamNameExistErr: c_int = 10058;
pub const JSStreamNotFoundErr: c_int = 10059;
pub const JSStreamNotMatchErr: c_int = 10060;
pub const JSStreamReplicasNotUpdatableErr: c_int = 10061;
pub const JSStreamRestoreErr: c_int = 10062;
pub const JSStreamSequenceNotMatchErr: c_int = 10063;
pub const JSStreamSnapshotErr: c_int = 10064;
pub const JSStreamSubjectOverlapErr: c_int = 10065;
pub const JSStreamTemplateCreateErr: c_int = 10066;
pub const JSStreamTemplateDeleteErr: c_int = 10067;
pub const JSStreamTemplateNotFoundErr: c_int = 10068;
pub const JSStreamUpdateErr: c_int = 10069;
pub const JSStreamWrongLastMsgIDErr: c_int = 10070;
pub const JSStreamWrongLastSequenceErr: c_int = 10071;
pub const JSTempStorageFailedErr: c_int = 10072;
pub const JSTemplateNameNotMatchSubjectErr: c_int = 10073;
pub const JSStreamReplicasNotSupportedErr: c_int = 10074;
pub const JSPeerRemapErr: c_int = 10075;
pub const JSNotEnabledErr: c_int = 10076;
pub const JSStreamStoreFailedErr: c_int = 10077;
pub const JSConsumerConfigRequiredErr: c_int = 10078;
pub const JSConsumerDeliverToWildcardsErr: c_int = 10079;
pub const JSConsumerPushMaxWaitingErr: c_int = 10080;
pub const JSConsumerDeliverCycleErr: c_int = 10081;
pub const JSConsumerMaxPendingAckPolicyRequiredErr: c_int = 10082;
pub const JSConsumerSmallHeartbeatErr: c_int = 10083;
pub const JSConsumerPullRequiresAckErr: c_int = 10084;
pub const JSConsumerPullNotDurableErr: c_int = 10085;
pub const JSConsumerPullWithRateLimitErr: c_int = 10086;
pub const JSConsumerMaxWaitingNegativeErr: c_int = 10087;
pub const JSConsumerHBRequiresPushErr: c_int = 10088;
pub const JSConsumerFCRequiresPushErr: c_int = 10089;
pub const JSConsumerDirectRequiresPushErr: c_int = 10090;
pub const JSConsumerDirectRequiresEphemeralErr: c_int = 10091;
pub const JSConsumerOnMappedErr: c_int = 10092;
pub const JSConsumerFilterNotSubsetErr: c_int = 10093;
pub const JSConsumerInvalidPolicyErr: c_int = 10094;
pub const JSConsumerInvalidSamplingErr: c_int = 10095;
pub const JSStreamInvalidErr: c_int = 10096;
pub const JSConsumerWQRequiresExplicitAckErr: c_int = 10098;
pub const JSConsumerWQMultipleUnfilteredErr: c_int = 10099;
pub const JSConsumerWQConsumerNotUniqueErr: c_int = 10100;
pub const JSConsumerWQConsumerNotDeliverAllErr: c_int = 10101;
pub const JSConsumerNameTooLongErr: c_int = 10102;
pub const JSConsumerBadDurableNameErr: c_int = 10103;
pub const JSConsumerStoreFailedErr: c_int = 10104;
pub const JSConsumerExistingActiveErr: c_int = 10105;
pub const JSConsumerReplacementWithDifferentNameErr: c_int = 10106;
pub const JSConsumerDescriptionTooLongErr: c_int = 10107;
pub const JSConsumerWithFlowControlNeedsHeartbeatsErr: c_int = 10108;
pub const JSStreamSealedErr: c_int = 10109;
pub const JSStreamPurgeFailedErr: c_int = 10110;
pub const JSStreamRollupFailedErr: c_int = 10111;
pub const JSConsumerInvalidDeliverSubjectErr: c_int = 10112;
pub const JSStreamMaxBytesRequiredErr: c_int = 10113;
pub const JSConsumerMaxRequestBatchNegativeErr: c_int = 10114;
pub const JSConsumerMaxRequestExpiresToSmallErr: c_int = 10115;
pub const JSConsumerMaxDeliverBackoffErr: c_int = 10116;
pub const JSStreamInfoMaxSubjectsErr: c_int = 10117;
pub const JSStreamOfflineErr: c_int = 10118;
pub const JSConsumerOfflineErr: c_int = 10119;
pub const JSNoLimitsErr: c_int = 10120;
pub const JSConsumerMaxPendingAckExcessErr: c_int = 10121;
pub const JSStreamMaxStreamBytesExceededErr: c_int = 10122;
pub const JSStreamMoveAndScaleErr: c_int = 10123;
pub const JSStreamMoveInProgressErr: c_int = 10124;
pub const JSConsumerMaxRequestBatchExceededErr: c_int = 10125;
pub const JSConsumerReplicasExceedsStreamErr: c_int = 10126;
pub const JSConsumerNameContainsPathSeparatorsErr: c_int = 10127;
pub const JSStreamNameContainsPathSeparatorsErr: c_int = 10128;
pub const JSStreamMoveNotInProgressErr: c_int = 10129;
pub const JSStreamNameExistRestoreFailedErr: c_int = 10130;
pub const JSConsumerCreateFilterSubjectMismatchErr: c_int = 10131;
pub const JSConsumerCreateDurableAndNameMismatchErr: c_int = 10132;
pub const JSReplicasCountCannotBeNegativeErr: c_int = 10133;
pub const jsErrCode = c_uint;

pub const struct__iobuf = extern struct {
    _ptr: [*c]u8,
    _cnt: c_int,
    _base: [*c]u8,
    _flag: c_int,
    _file: c_int,
    _charbuf: c_int,
    _bufsiz: c_int,
    _tmpfname: [*c]u8,
};
pub const FILE = struct__iobuf;

pub const __natsThread = struct___natsThread;
pub const _iobuf = struct__iobuf;
pub const __natsGCItem = struct___natsGCItem;
pub const __natsStrHashEntry = struct___natsStrHashEntry;
pub const __natsStrHash = struct___natsStrHash;
pub const __natsMsg = struct___natsMsg;
pub const __nats_MsgList = struct___nats_MsgList;
pub const __natsMsgDlvWorker = struct___natsMsgDlvWorker;
pub const __natsTimer = struct___natsTimer;
pub const jsOptionsPublishAsync = struct_jsOptionsPublishAsync;
pub const jsOptionsStreamPurge = struct_jsOptionsStreamPurge;
pub const jsOptionsStreamInfo = struct_jsOptionsStreamInfo;
pub const jsOptionsStream = struct_jsOptionsStream;
pub const __pmInfo = struct___pmInfo;
pub const __jsCtx = struct___jsCtx;
pub const mismatch = struct_mismatch;
pub const __jsSub = struct___jsSub;
pub const __natsSubscription = struct___natsSubscription;
pub const __natsSSLCtx = struct___natsSSLCtx;
pub const __userCreds = struct___userCreds;
pub const __natsOptions = struct___natsOptions;
pub const __natsUrl = struct___natsUrl;
pub const __natsSrv = struct___natsSrv;
pub const __natsDeadline = struct___natsDeadline;
pub const __natsSockCtx = struct___natsSockCtx;
pub const __natsSrvPool = struct___natsSrvPool;
pub const __natsBuffer = struct___natsBuffer;
pub const __natsServerInfo = struct___natsServerInfo;
pub const __natsHashEntry = struct___natsHashEntry;
pub const __natsHash = struct___natsHash;
pub const __natsMsgArg = struct___natsMsgArg;
pub const __natsParser = struct___natsParser;
pub const __natsPong = struct___natsPong;
pub const __natsPongList = struct___natsPongList;
pub const __natsStatistics = struct___natsStatistics;
pub const __respInfo = struct___respInfo;
pub const __natsConnection = struct___natsConnection;
pub const __kvStore = struct___kvStore;
pub const __kvEntry = struct___kvEntry;
pub const __kvStatus = struct___kvStatus;
pub const __kvWatcher = struct___kvWatcher;

pub const struct___natsHashIter = extern struct {
    hash: [*c]natsHash,
    current: [*c]natsHashEntry,
    next: [*c]natsHashEntry,
    currBkt: c_int,
    started: bool,
};
pub const natsHashIter = struct___natsHashIter;
pub const struct___natsStrHashIter = extern struct {
    hash: [*c]natsStrHash,
    current: [*c]natsStrHashEntry,
    next: [*c]natsStrHashEntry,
    currBkt: c_int,
    started: bool,
};

pub const natsStrHashIter = struct___natsStrHashIter;
pub extern fn natsHash_Create(newHash: [*c][*c]natsHash, initialSize: c_int) natsStatus;
pub extern fn natsHash_Set(hash: [*c]natsHash, key: i64, data: ?*anyopaque, oldData: [*c]?*anyopaque) natsStatus;
pub extern fn natsHash_Get(hash: [*c]natsHash, key: i64) ?*anyopaque;
pub extern fn natsHash_Remove(hash: [*c]natsHash, key: i64) ?*anyopaque;
pub extern fn natsHash_RemoveSingle(hash: [*c]natsHash, key: [*c]i64, data: [*c]?*anyopaque) natsStatus;
pub extern fn natsHash_Destroy(hash: [*c]natsHash) void;
pub extern fn natsHashIter_Init(iter: [*c]natsHashIter, hash: [*c]natsHash) void;
pub extern fn natsHashIter_Next(iter: [*c]natsHashIter, key: [*c]i64, value: [*c]?*anyopaque) bool;
pub extern fn natsHashIter_RemoveCurrent(iter: [*c]natsHashIter) natsStatus;
pub extern fn natsHashIter_Done(iter: [*c]natsHashIter) void;
pub extern fn natsStrHash_Create(newHash: [*c][*c]natsStrHash, initialSize: c_int) natsStatus;
pub extern fn natsStrHash_Hash(data: [*c]const u8, dataLen: c_int) u32;
pub extern fn natsStrHash_SetEx(hash: [*c]natsStrHash, key: [*c]u8, copyKey: bool, freeKey: bool, data: ?*anyopaque, oldData: [*c]?*anyopaque) natsStatus;
pub extern fn natsStrHash_GetEx(hash: [*c]natsStrHash, key: [*c]u8, keyLen: c_int) ?*anyopaque;
pub extern fn natsStrHash_Remove(hash: [*c]natsStrHash, key: [*c]u8) ?*anyopaque;
pub extern fn natsStrHash_RemoveSingle(hash: [*c]natsStrHash, key: [*c][*c]u8, data: [*c]?*anyopaque) natsStatus;
pub extern fn natsStrHash_Destroy(hash: [*c]natsStrHash) void;
pub extern fn natsStrHashIter_Init(iter: [*c]natsStrHashIter, hash: [*c]natsStrHash) void;
pub extern fn natsStrHashIter_Next(iter: [*c]natsStrHashIter, key: [*c][*c]u8, value: [*c]?*anyopaque) bool;
pub extern fn natsStrHashIter_RemoveCurrent(iter: [*c]natsStrHashIter) natsStatus;
pub extern fn natsStrHashIter_Done(iter: [*c]natsStrHashIter) void;
pub extern fn natsSrvPool_Create(newPool: [*c][*c]natsSrvPool, opts: [*c]struct___natsOptions) natsStatus;
pub extern fn natsSrvPool_GetCurrentServer(pool: [*c]natsSrvPool, cur: [*c]const natsSrv, index: [*c]c_int) [*c]natsSrv;
pub extern fn natsSrvPool_GetNextServer(pool: [*c]natsSrvPool, opts: [*c]struct___natsOptions, cur: [*c]const natsSrv) [*c]natsSrv;
pub extern fn natsSrvPool_addNewURLs(pool: [*c]natsSrvPool, curUrl: [*c]const natsUrl, urls: [*c][*c]u8, urlCount: c_int, tlsName: [*c]const u8, added: [*c]bool) natsStatus;
pub extern fn natsSrvPool_GetServers(pool: [*c]natsSrvPool, implicitOnly: bool, servers: [*c][*c][*c]u8, count: [*c]c_int) natsStatus;
pub extern fn natsSrvPool_Destroy(pool: [*c]natsSrvPool) void;
pub extern fn natsGC_collect(item: [*c]natsGCItem) bool;
pub const struct___natsHeaderValue = extern struct {
    value: [*c]u8,
    needFree: bool,
    next: [*c]struct___natsHeaderValue,
};
pub const natsHeaderValue = struct___natsHeaderValue;
pub extern fn natsMsgHeader_encodedLen(msg: [*c]natsMsg) c_int;
pub extern fn natsMsgHeader_encode(buf: [*c]natsBuffer, msg: [*c]natsMsg) natsStatus;
pub extern fn natsMsg_init(msg: [*c]natsMsg, subject: [*c]const u8, data: [*c]const u8, dataLen: c_int) void;
pub extern fn natsMsg_create(newMsg: [*c][*c]natsMsg, subject: [*c]const u8, subjLen: c_int, reply: [*c]const u8, replyLen: c_int, buf: [*c]const u8, bufLen: c_int, hdrLen: c_int) natsStatus;
pub extern fn natsMsg_createWithPadding(newMsg: [*c][*c]natsMsg, subject: [*c]const u8, subjLen: c_int, reply: [*c]const u8, replyLen: c_int, buf: [*c]const u8, bufLen: c_int, bufPaddingSize: c_int, hdrLen: c_int) natsStatus;
pub extern fn natsMsg_freeHeaders(msg: [*c]natsMsg) void;
pub extern fn natsMsg_free(object: ?*anyopaque) void;

pub const __natsHashIter = struct___natsHashIter;
pub const __natsStrHashIter = struct___natsStrHashIter;
pub const __natsHeaderValue = struct___natsHeaderValue;
pub const __natsAsyncCbInfo = struct___natsAsyncCbInfo;
pub const __natsControl = struct___natsControl;

pub const ASYNC_CLOSED: c_int = 0;
pub const ASYNC_DISCONNECTED: c_int = 1;
pub const ASYNC_RECONNECTED: c_int = 2;
pub const ASYNC_ERROR: c_int = 3;
pub const ASYNC_DISCOVERED_SERVERS: c_int = 4;
pub const ASYNC_CONNECTED: c_int = 5;
pub const ASYNC_LAME_DUCK_MODE: c_int = 6;
pub const natsAsyncCbType = c_uint;
pub const struct___natsAsyncCbInfo = extern struct {
    type: natsAsyncCbType,
    nc: [*c]struct___natsConnection,
    sub: [*c]struct___natsSubscription,
    err: natsStatus,
    errTxt: [*c]u8,
    next: [*c]struct___natsAsyncCbInfo,
};
pub const natsAsyncCbInfo = struct___natsAsyncCbInfo;
pub extern fn natsAsyncCb_PostConnHandler(nc: [*c]struct___natsConnection, @"type": natsAsyncCbType) void;
pub extern fn natsAsyncCb_PostErrHandler(nc: [*c]struct___natsConnection, sub: [*c]struct___natsSubscription, err: natsStatus, errTxt: [*c]u8) void;
pub extern fn natsAsyncCb_Destroy(info: [*c]natsAsyncCbInfo) void;
pub extern fn natsDeadline_Init(deadline: [*c]natsDeadline, timeout: i64) void;
pub extern fn natsDeadline_GetTimeout(deadline: [*c]natsDeadline) c_int;
pub extern fn natsDeadline_Clear(deadline: [*c]natsDeadline) void;
pub extern fn natsNUID_init() natsStatus;
pub extern fn natsNUID_Next(buffer: [*c]u8, bufferLen: c_int) natsStatus;
pub extern fn nats_Rand64() i64;
pub extern fn natsNUID_free() void;
pub extern var gLockSpinCount: i64;
pub const natsInitOnceCb = ?*const fn () callconv(.C) void;
pub const struct___natsControl = extern struct {
    op: [*c]u8,
    args: [*c]u8,
};
pub const natsControl = struct___natsControl;
pub const natsEvLoopCallbacks = extern struct {
    attach: natsEvLoop_Attach,
    read: natsEvLoop_ReadAddRemove,
    write: natsEvLoop_WriteAddRemove,
    detach: natsEvLoop_Detach,
};
pub const userCreds = struct___userCreds;
pub extern fn natsSys_Init() void;
pub extern fn natsLib_Retain() void;
pub extern fn natsLib_Release() void;
pub extern fn nats_setTargetTime(timeout: i64) i64;
pub extern fn nats_resetTimer(t: [*c]natsTimer, newInterval: i64) void;
pub extern fn nats_stopTimer(t: [*c]natsTimer) void;
pub extern fn nats_getTimersCount() c_int;
pub extern fn nats_getTimersCountInList() c_int;
pub extern fn nats_postAsyncCbInfo(info: [*c]natsAsyncCbInfo) natsStatus;
pub extern fn nats_sslRegisterThreadForCleanup() void;
pub extern fn nats_sslInit() natsStatus;
pub extern fn natsLib_msgDeliveryPostControlMsg(sub: [*c]natsSubscription) natsStatus;
pub extern fn natsLib_msgDeliveryAssignWorker(sub: [*c]natsSubscription) natsStatus;
pub extern fn natsLib_isLibHandlingMsgDeliveryByDefault() bool;
pub extern fn natsLib_defaultWriteDeadline() i64;
pub extern fn natsLib_getMsgDeliveryPoolInfo(maxSize: [*c]c_int, size: [*c]c_int, idx: [*c]c_int, workersArray: [*c][*c][*c]natsMsgDlvWorker) void;
pub extern fn nats_setNATSThreadKey() void;
pub const natsThreadCb = ?*const fn (?*anyopaque) callconv(.C) void;
pub extern fn natsThread_Create(t: [*c][*c]natsThread, cb: natsThreadCb, arg: ?*anyopaque) natsStatus;
pub extern fn natsThread_IsCurrent(t: [*c]natsThread) bool;
pub extern fn natsThread_Join(t: [*c]natsThread) void;
pub extern fn natsThread_Detach(t: [*c]natsThread) void;
pub extern fn natsThread_Yield() void;
pub extern fn natsThread_Destroy(t: [*c]natsThread) void;
pub extern fn natsThreadLocal_CreateKey(tl: [*c]natsThreadLocal, destructor: ?*const fn (?*anyopaque) callconv(.C) void) natsStatus;
pub extern fn natsThreadLocal_Get(tl: natsThreadLocal) ?*anyopaque;
pub extern fn natsThreadLocal_SetEx(tl: natsThreadLocal, value: ?*const anyopaque, setErr: bool) natsStatus;
pub extern fn natsThreadLocal_DestroyKey(tl: natsThreadLocal) void;
pub extern fn nats_InitOnce(control: [*c]natsInitOnceType, cb: natsInitOnceCb) bool;
pub extern fn natsCondition_Create(cond: [*c][*c]natsCondition) natsStatus;
pub extern fn natsCondition_Wait(cond: [*c]natsCondition, mutex: [*c]natsMutex) void;
pub extern fn natsCondition_TimedWait(cond: [*c]natsCondition, mutex: [*c]natsMutex, timeout: i64) natsStatus;
pub extern fn natsCondition_AbsoluteTimedWait(cond: [*c]natsCondition, mutex: [*c]natsMutex, absoluteTime: i64) natsStatus;
pub extern fn natsCondition_Signal(cond: [*c]natsCondition) void;
pub extern fn natsCondition_Broadcast(cond: [*c]natsCondition) void;
pub extern fn natsCondition_Destroy(cond: [*c]natsCondition) void;
pub extern fn natsMutex_Create(newMutex: [*c][*c]natsMutex) natsStatus;
pub extern fn natsMutex_Lock(m: [*c]natsMutex) void;
pub extern fn natsMutex_TryLock(m: [*c]natsMutex) bool;
pub extern fn natsMutex_Unlock(m: [*c]natsMutex) void;
pub extern fn natsMutex_Destroy(m: [*c]natsMutex) void;
pub extern fn jsSub_free(sub: [*c]jsSub) void;
pub extern fn jsSub_deleteConsumer(sub: [*c]natsSubscription) natsStatus;
pub extern fn jsSub_deleteConsumerAfterDrain(sub: [*c]natsSubscription) void;
pub extern fn jsSub_trackSequences(jsi: [*c]jsSub, reply: [*c]const u8) natsStatus;
pub extern fn jsSub_processSequenceMismatch(sub: [*c]natsSubscription, msg: [*c]natsMsg, sm: [*c]bool) natsStatus;
pub extern fn jsSub_checkForFlowControlResponse(sub: [*c]natsSubscription) [*c]u8;
pub extern fn jsSub_scheduleFlowControlResponse(jsi: [*c]jsSub, reply: [*c]const u8) natsStatus;
pub extern fn jsSub_checkOrderedMsg(sub: [*c]natsSubscription, msg: [*c]natsMsg, reset: [*c]bool) natsStatus;
pub extern fn jsSub_resetOrderedConsumer(sub: [*c]natsSubscription, sseq: u64) natsStatus;
pub extern fn natsMsg_isJSCtrl(msg: [*c]natsMsg, ctrlType: [*c]c_int) bool;

pub const UINT_PTR = c_ulonglong;
pub const SOCKET = UINT_PTR;
pub const natsSock = SOCKET;
pub const natsTokenHandler = ?*const fn (?*anyopaque) callconv(.C) [*c]const u8;
pub const natsConnection = struct___natsConnection;
pub const natsConnectionHandler = ?*const fn ([*c]natsConnection, ?*anyopaque) callconv(.C) void;
pub const nats_FreeObjectCb = ?*const fn (?*anyopaque) callconv(.C) void;
pub const struct___natsGCItem = extern struct {
    next: [*c]struct___natsGCItem,
    freeCb: nats_FreeObjectCb,
};
pub const natsGCItem = struct___natsGCItem;
pub const struct___natsStrHashEntry = extern struct {
    hk: u32,
    key: [*c]u8,
    freeKey: bool,
    data: ?*anyopaque,
    next: [*c]struct___natsStrHashEntry,
};
pub const natsStrHashEntry = struct___natsStrHashEntry;
pub const struct___natsStrHash = extern struct {
    bkts: [*c][*c]natsStrHashEntry,
    numBkts: c_int,
    mask: c_int,
    used: c_int,
    canResize: bool,
};
pub const natsStrHash = struct___natsStrHash;
pub const struct___natsMsg = extern struct {
    gc: natsGCItem,
    subject: [*c]const u8,
    reply: [*c]const u8,
    hdr: [*c]u8,
    headers: [*c]natsStrHash,
    data: [*c]const u8,
    dataLen: c_int,
    hdrLen: c_int,
    wsz: c_int,
    flags: c_int,
    seq: u64,
    time: i64,
    sub: [*c]struct___natsSubscription,
    next: [*c]struct___natsMsg,
};
pub const natsMsg = struct___natsMsg;
pub const struct___nats_MsgList = extern struct {
    head: [*c]natsMsg,
    tail: [*c]natsMsg,
    msgs: c_int,
    bytes: c_int,
};
pub const nats_MsgList = struct___nats_MsgList;
pub const struct___natsMsgDlvWorker = extern struct {
    lock: [*c]natsMutex,
    cond: [*c]natsCondition,
    thread: [*c]natsThread,
    shutdown: bool,
    msgList: nats_MsgList,
};
pub const natsMsgDlvWorker = struct___natsMsgDlvWorker;
pub const natsMsgHandler = ?*const fn ([*c]natsConnection, [*c]natsSubscription, [*c]natsMsg, ?*anyopaque) callconv(.C) void;
pub const natsTimerCb = ?*const fn ([*c]struct___natsTimer, ?*anyopaque) callconv(.C) void;
pub const natsTimerStopCb = ?*const fn ([*c]struct___natsTimer, ?*anyopaque) callconv(.C) void;
pub const struct___natsTimer = extern struct {
    prev: [*c]struct___natsTimer,
    next: [*c]struct___natsTimer,
    mu: [*c]natsMutex,
    refs: c_int,
    cb: natsTimerCb,
    stopCb: natsTimerStopCb,
    closure: ?*anyopaque,
    interval: i64,
    absoluteTime: i64,
    stopped: bool,
    inCallback: bool,
};
pub const natsTimer = struct___natsTimer;
pub const natsOnCompleteCB = ?*const fn (?*anyopaque) callconv(.C) void;
pub const struct_jsPubAck = extern struct {
    Stream: [*c]u8,
    Sequence: u64,
    Domain: [*c]u8,
    Duplicate: bool,
};
pub const jsPubAck = struct_jsPubAck;
pub const struct_jsPubAckErr = extern struct {
    Msg: [*c]natsMsg,
    Err: natsStatus,
    ErrCode: jsErrCode,
    ErrText: [*c]const u8,
};
pub const jsPubAckErr = struct_jsPubAckErr;
pub const jsPubAckHandler = ?*const fn ([*c]jsCtx, [*c]natsMsg, [*c]jsPubAck, [*c]jsPubAckErr, ?*anyopaque) callconv(.C) void;
pub const jsPubAckErrHandler = ?*const fn ([*c]jsCtx, [*c]jsPubAckErr, ?*anyopaque) callconv(.C) void;
pub const struct_jsOptionsPublishAsync = extern struct {
    MaxPending: i64,
    AckHandler: jsPubAckHandler,
    AckHandlerClosure: ?*anyopaque,
    ErrHandler: jsPubAckErrHandler,
    ErrHandlerClosure: ?*anyopaque,
    StallWait: i64,
};
pub const struct_jsOptionsStreamPurge = extern struct {
    Subject: [*c]const u8,
    Sequence: u64,
    Keep: u64,
};
pub const struct_jsOptionsStreamInfo = extern struct {
    DeletedDetails: bool,
    SubjectsFilter: [*c]const u8,
};
pub const struct_jsOptionsStream = extern struct {
    Purge: struct_jsOptionsStreamPurge,
    Info: struct_jsOptionsStreamInfo,
};
pub const struct_jsOptions = extern struct {
    Prefix: [*c]const u8,
    Domain: [*c]const u8,
    Wait: i64,
    PublishAsync: struct_jsOptionsPublishAsync,
    Stream: struct_jsOptionsStream,
};
pub const jsOptions = struct_jsOptions;
pub const struct___pmInfo = extern struct {
    subject: [*c]u8,
    deadline: i64,
    next: [*c]struct___pmInfo,
};
pub const pmInfo = struct___pmInfo;
pub const struct___jsCtx = extern struct {
    mu: [*c]natsMutex,
    nc: [*c]natsConnection,
    opts: jsOptions,
    refs: c_int,
    cond: [*c]natsCondition,
    pm: [*c]natsStrHash,
    pmtmr: [*c]natsTimer,
    pmHead: [*c]pmInfo,
    pmTail: [*c]pmInfo,
    rsub: [*c]natsSubscription,
    rpre: [*c]u8,
    rpreLen: c_int,
    pacw: c_int,
    pmcount: i64,
    stalled: c_int,
    closed: bool,
};
pub const jsCtx = struct___jsCtx;
pub const struct_mismatch = extern struct {
    sseq: u64,
    dseq: u64,
    ldseq: u64,
};
pub const struct_jsConsumerConfig = extern struct {
    Name: [*c]const u8,
    Durable: [*c]const u8,
    Description: [*c]const u8,
    DeliverPolicy: jsDeliverPolicy,
    OptStartSeq: u64,
    OptStartTime: i64,
    AckPolicy: jsAckPolicy,
    AckWait: i64,
    MaxDeliver: i64,
    BackOff: [*c]i64,
    BackOffLen: c_int,
    FilterSubject: [*c]const u8,
    ReplayPolicy: jsReplayPolicy,
    RateLimit: u64,
    SampleFrequency: [*c]const u8,
    MaxWaiting: i64,
    MaxAckPending: i64,
    FlowControl: bool,
    Heartbeat: i64,
    HeadersOnly: bool,
    MaxRequestBatch: i64,
    MaxRequestExpires: i64,
    MaxRequestMaxBytes: i64,
    DeliverSubject: [*c]const u8,
    DeliverGroup: [*c]const u8,
    InactiveThreshold: i64,
    Replicas: i64,
    MemoryStorage: bool,
};
pub const jsConsumerConfig = struct_jsConsumerConfig;
pub const struct___jsSub = extern struct {
    js: [*c]jsCtx,
    stream: [*c]u8,
    consumer: [*c]u8,
    psubj: [*c]u8,
    nxtMsgSubj: [*c]u8,
    pull: bool,
    inFetch: bool,
    ordered: bool,
    dc: bool,
    ackNone: bool,
    fetchID: u64,
    pending: u64,
    hbi: i64,
    active: bool,
    hbTimer: [*c]natsTimer,
    mhMsg: [*c]natsMsg,
    cmeta: [*c]u8,
    sseq: u64,
    dseq: u64,
    ssmn: bool,
    sm: bool,
    mismatch: struct_mismatch,
    usrCb: natsMsgHandler,
    usrCbClosure: ?*anyopaque,
    fcDelivered: u64,
    fciseq: u64,
    fcReply: [*c]u8,
    ocCfg: [*c]jsConsumerConfig,
};
pub const jsSub = struct___jsSub;
pub const struct___natsSubscription = extern struct {
    mu: [*c]natsMutex,
    refs: c_int,
    max: u64,
    delivered: u64,
    msgList: nats_MsgList,
    slowConsumer: bool,
    cond: [*c]natsCondition,
    closed: bool,
    draining: bool,
    drainState: u8,
    drainThread: [*c]natsThread,
    drainStatus: natsStatus,
    drainTimeout: i64,
    drainSkip: bool,
    libDlvDraining: bool,
    connClosed: bool,
    sid: i64,
    subject: [*c]u8,
    queue: [*c]u8,
    conn: [*c]struct___natsConnection,
    deliverMsgsThread: [*c]natsThread,
    libDlvWorker: [*c]natsMsgDlvWorker,
    msgCb: natsMsgHandler,
    msgCbClosure: ?*anyopaque,
    timeout: i64,
    timeoutTimer: [*c]natsTimer,
    timedOut: bool,
    timeoutSuspended: bool,
    msgsMax: c_int,
    bytesMax: c_int,
    msgsLimit: c_int,
    bytesLimit: c_int,
    dropped: i64,
    onCompleteCB: natsOnCompleteCB,
    onCompleteCBClosure: ?*anyopaque,
    jsi: [*c]jsSub,
};
pub const natsSubscription = struct___natsSubscription;
pub const natsErrHandler = ?*const fn ([*c]natsConnection, [*c]natsSubscription, natsStatus, ?*anyopaque) callconv(.C) void;
pub const struct___natsSSLCtx = extern struct {
    lock: [*c]natsMutex,
    refs: c_int,
    ctx: [*c]?*anyopaque,
    expectedHostname: [*c]u8,
    skipVerify: bool,
};
pub const natsSSLCtx = struct___natsSSLCtx;
pub const natsUserJWTHandler = ?*const fn ([*c][*c]u8, [*c][*c]u8, ?*anyopaque) callconv(.C) natsStatus;
pub const natsSignatureHandler = ?*const fn ([*c][*c]u8, [*c][*c]u8, [*c]c_int, [*c]const u8, ?*anyopaque) callconv(.C) natsStatus;
pub const struct___userCreds = extern struct {
    userOrChainedFile: [*c]u8,
    seedFile: [*c]u8,
    jwtAndSeedContent: [*c]u8,
};
pub const natsCustomReconnectDelayHandler = ?*const fn ([*c]natsConnection, c_int, ?*anyopaque) callconv(.C) i64;
pub const struct___natsOptions = extern struct {
    mu: [*c]natsMutex,
    url: [*c]u8,
    servers: [*c][*c]u8,
    serversCount: c_int,
    noRandomize: bool,
    timeout: i64,
    name: [*c]u8,
    verbose: bool,
    pedantic: bool,
    allowReconnect: bool,
    secure: bool,
    ioBufSize: c_int,
    maxReconnect: c_int,
    reconnectWait: i64,
    reconnectBufSize: c_int,
    writeDeadline: i64,
    user: [*c]u8,
    password: [*c]u8,
    token: [*c]u8,
    tokenCb: natsTokenHandler,
    tokenCbClosure: ?*anyopaque,
    closedCb: natsConnectionHandler,
    closedCbClosure: ?*anyopaque,
    disconnectedCb: natsConnectionHandler,
    disconnectedCbClosure: ?*anyopaque,
    reconnectedCb: natsConnectionHandler,
    reconnectedCbClosure: ?*anyopaque,
    discoveredServersCb: natsConnectionHandler,
    discoveredServersClosure: ?*anyopaque,
    ignoreDiscoveredServers: bool,
    connectedCb: natsConnectionHandler,
    connectedCbClosure: ?*anyopaque,
    lameDuckCb: natsConnectionHandler,
    lameDuckClosure: ?*anyopaque,
    asyncErrCb: natsErrHandler,
    asyncErrCbClosure: ?*anyopaque,
    pingInterval: i64,
    maxPingsOut: c_int,
    maxPendingMsgs: c_int,
    sslCtx: [*c]natsSSLCtx,
    evLoop: ?*anyopaque,
    evCbs: natsEvLoopCallbacks,
    libMsgDelivery: bool,
    orderIP: c_int,
    useOldRequestStyle: bool,
    sendAsap: bool,
    failRequestsOnDisconnect: bool,
    noEcho: bool,
    retryOnFailedConnect: bool,
    userJWTHandler: natsUserJWTHandler,
    userJWTClosure: ?*anyopaque,
    sigHandler: natsSignatureHandler,
    sigClosure: ?*anyopaque,
    nkey: [*c]u8,
    userCreds: [*c]struct___userCreds,
    reconnectJitter: i64,
    reconnectJitterTLS: i64,
    customReconnectDelayCB: natsCustomReconnectDelayHandler,
    customReconnectDelayCBClosure: ?*anyopaque,
    disableNoResponders: bool,
    inboxPfx: [*c]u8,
    payloadPaddingSize: c_int,
};
pub const natsOptions = struct___natsOptions;
pub const struct___natsUrl = extern struct {
    fullUrl: [*c]u8,
    host: [*c]u8,
    port: c_int,
    username: [*c]u8,
    password: [*c]u8,
};
pub const natsUrl = struct___natsUrl;
pub const struct___natsSrv = extern struct {
    url: [*c]natsUrl,
    didConnect: bool,
    isImplicit: bool,
    reconnects: c_int,
    tlsName: [*c]u8,
    lastAuthErrCode: c_int,
};
pub const natsSrv = struct___natsSrv;
pub const struct___natsDeadline = extern struct {
    absoluteTime: i64,
    active: bool,
};
pub const natsDeadline = struct___natsDeadline;
pub const struct___natsSockCtx = extern struct {
    fd: natsSock,
    fdActive: bool,
    readDeadline: natsDeadline,
    writeDeadline: natsDeadline,
    ssl: [*c]?*anyopaque,
    useEventLoop: bool,
    orderIP: c_int,
    noRandomize: bool,
};
pub const natsSockCtx = struct___natsSockCtx;
pub const struct___natsSrvPool = extern struct {
    srvrs: [*c][*c]natsSrv,
    urls: [*c]natsStrHash,
    size: c_int,
    cap: c_int,
    randomize: bool,
    user: [*c]u8,
    pwd: [*c]u8,
};
pub const natsSrvPool = struct___natsSrvPool;
pub const struct___natsBuffer = extern struct {
    data: [*c]u8,
    pos: [*c]u8,
    len: c_int,
    capacity: c_int,
    ownData: bool,
    doFree: bool,
};
pub const natsBuffer = struct___natsBuffer;
pub const struct___natsServerInfo = extern struct {
    id: [*c]u8,
    host: [*c]u8,
    port: c_int,
    version: [*c]u8,
    authRequired: bool,
    tlsRequired: bool,
    maxPayload: i64,
    connectURLs: [*c][*c]u8,
    connectURLsCount: c_int,
    proto: c_int,
    CID: u64,
    nonce: [*c]u8,
    clientIP: [*c]u8,
    lameDuckMode: bool,
    headers: bool,
};
pub const natsServerInfo = struct___natsServerInfo;
pub const struct___natsHashEntry = extern struct {
    key: i64,
    data: ?*anyopaque,
    next: [*c]struct___natsHashEntry,
};
pub const natsHashEntry = struct___natsHashEntry;
pub const struct___natsHash = extern struct {
    bkts: [*c][*c]natsHashEntry,
    numBkts: c_int,
    mask: c_int,
    used: c_int,
    canResize: bool,
};
pub const natsHash = struct___natsHash;
pub const struct___natsMsgArg = extern struct {
    subjectRec: natsBuffer,
    subject: [*c]natsBuffer,
    replyRec: natsBuffer,
    reply: [*c]natsBuffer,
    sid: i64,
    hdr: c_int,
    size: c_int,
};
pub const natsOp = c_uint;
pub const natsMsgArg = struct___natsMsgArg;
pub const struct___natsParser = extern struct {
    state: natsOp,
    afterSpace: c_int,
    drop: c_int,
    hdr: c_int,
    ma: natsMsgArg,
    argBufRec: natsBuffer,
    argBuf: [*c]natsBuffer,
    msgBufRec: natsBuffer,
    msgBuf: [*c]natsBuffer,
    scratch: [4096]u8,
};
pub const natsParser = struct___natsParser;
pub const struct___natsPong = extern struct {
    id: i64,
    prev: [*c]struct___natsPong,
    next: [*c]struct___natsPong,
};
pub const natsPong = struct___natsPong;
pub const struct___natsPongList = extern struct {
    head: [*c]natsPong,
    tail: [*c]natsPong,
    incoming: i64,
    outgoingPings: i64,
    cached: natsPong,
    cond: [*c]natsCondition,
};
pub const natsPongList = struct___natsPongList;
pub const struct___natsStatistics = extern struct {
    inMsgs: u64,
    outMsgs: u64,
    inBytes: u64,
    outBytes: u64,
    reconnects: u64,
};
pub const natsStatistics = struct___natsStatistics;
pub const struct___respInfo = extern struct {
    mu: [*c]natsMutex,
    cond: [*c]natsCondition,
    msg: [*c]natsMsg,
    closed: bool,
    closedSts: natsStatus,
    removed: bool,
    pooled: bool,
};
pub const respInfo = struct___respInfo;
const struct_unnamed_361 = extern struct {
    attached: bool,
    writeAdded: bool,
    buffer: ?*anyopaque,
    data: ?*anyopaque,
};
pub const natsMsgFilter = ?*const fn ([*c]natsConnection, [*c][*c]natsMsg, ?*anyopaque) callconv(.C) void;
const struct_unnamed_362 = extern struct {
    ma: c_int,
    mi: c_int,
    up: c_int,
};
pub const struct___natsConnection = extern struct {
    mu: [*c]natsMutex,
    opts: [*c]natsOptions,
    cur: [*c]natsSrv,
    tlsName: [*c]const u8,
    refs: c_int,
    sockCtx: natsSockCtx,
    srvPool: [*c]natsSrvPool,
    pending: [*c]natsBuffer,
    usePending: bool,
    bw: [*c]natsBuffer,
    scratch: [*c]natsBuffer,
    info: natsServerInfo,
    ssid: i64,
    subs: [*c]natsHash,
    subsMu: [*c]natsMutex,
    status: natsConnStatus,
    initc: bool,
    ar: bool,
    rle: bool,
    err: natsStatus,
    errStr: [256]u8,
    ps: [*c]natsParser,
    ptmr: [*c]natsTimer,
    pout: c_int,
    pongs: natsPongList,
    readLoopThread: [*c]natsThread,
    flusherThread: [*c]natsThread,
    flusherCond: [*c]natsCondition,
    flusherSignaled: bool,
    flusherStop: bool,
    reconnectThread: [*c]natsThread,
    inReconnect: c_int,
    reconnectCond: [*c]natsCondition,
    stats: natsStatistics,
    drainThread: [*c]natsThread,
    drainTimeout: i64,
    dontSendInPlace: bool,
    stanOwned: bool,
    respId: [20]u8,
    respIdPos: c_int,
    respIdVal: c_int,
    respSub: [*c]u8,
    respMux: [*c]natsSubscription,
    respMap: [*c]natsStrHash,
    respPool: [*c][*c]respInfo,
    respPoolSize: c_int,
    respPoolIdx: c_int,
    inboxPfx: [*c]const u8,
    inboxPfxLen: c_int,
    reqIdOffset: c_int,
    el: struct_unnamed_361,
    filter: natsMsgFilter,
    filterClosure: ?*anyopaque,
    srvVersion: struct_unnamed_362,
};
pub const natsInbox = u8;
pub const struct_natsMsgList = extern struct {
    Msgs: [*c][*c]natsMsg,
    Count: c_int,
};
pub const natsMsgList = struct_natsMsgList;
pub const struct_jsPubOptions = extern struct {
    MaxWait: i64,
    MsgId: [*c]const u8,
    ExpectStream: [*c]const u8,
    ExpectLastMsgId: [*c]const u8,
    ExpectLastSeq: u64,
    ExpectLastSubjectSeq: u64,
    ExpectNoMessage: bool,
};
pub const jsPubOptions = struct_jsPubOptions;
pub const js_LimitsPolicy: c_int = 0;
pub const js_InterestPolicy: c_int = 1;
pub const js_WorkQueuePolicy: c_int = 2;
pub const jsRetentionPolicy = c_uint;
pub const js_DiscardOld: c_int = 0;
pub const js_DiscardNew: c_int = 1;
pub const jsDiscardPolicy = c_uint;
pub const js_FileStorage: c_int = 0;
pub const js_MemoryStorage: c_int = 1;
pub const jsStorageType = c_uint;
pub const js_DeliverAll: c_int = 0;
pub const js_DeliverLast: c_int = 1;
pub const js_DeliverNew: c_int = 2;
pub const js_DeliverByStartSequence: c_int = 3;
pub const js_DeliverByStartTime: c_int = 4;
pub const js_DeliverLastPerSubject: c_int = 5;
pub const jsDeliverPolicy = c_uint;
pub const js_AckExplicit: c_int = 0;
pub const js_AckNone: c_int = 1;
pub const js_AckAll: c_int = 2;
pub const jsAckPolicy = c_uint;
pub const js_ReplayInstant: c_int = 0;
pub const js_ReplayOriginal: c_int = 1;
pub const jsReplayPolicy = c_uint;
pub const struct_jsPlacement = extern struct {
    Cluster: [*c]const u8,
    Tags: [*c][*c]const u8,
    TagsLen: c_int,
};
pub const jsPlacement = struct_jsPlacement;
pub const struct_jsExternalStream = extern struct {
    APIPrefix: [*c]const u8,
    DeliverPrefix: [*c]const u8,
};
pub const jsExternalStream = struct_jsExternalStream;
pub const struct_jsStreamSource = extern struct {
    Name: [*c]const u8,
    OptStartSeq: u64,
    OptStartTime: i64,
    FilterSubject: [*c]const u8,
    External: [*c]jsExternalStream,
    Domain: [*c]const u8,
};
pub const jsStreamSource = struct_jsStreamSource;
pub const struct_jsRePublish = extern struct {
    Source: [*c]const u8,
    Destination: [*c]const u8,
    HeadersOnly: bool,
};
pub const jsRePublish = struct_jsRePublish;
pub const struct_jsStreamConfig = extern struct {
    Name: [*c]const u8,
    Description: [*c]const u8,
    Subjects: [*c][*c]const u8,
    SubjectsLen: c_int,
    Retention: jsRetentionPolicy,
    MaxConsumers: i64,
    MaxMsgs: i64,
    MaxBytes: i64,
    MaxAge: i64,
    MaxMsgsPerSubject: i64,
    MaxMsgSize: i32,
    Discard: jsDiscardPolicy,
    Storage: jsStorageType,
    Replicas: i64,
    NoAck: bool,
    Template: [*c]const u8,
    Duplicates: i64,
    Placement: [*c]jsPlacement,
    Mirror: [*c]jsStreamSource,
    Sources: [*c][*c]jsStreamSource,
    SourcesLen: c_int,
    Sealed: bool,
    DenyDelete: bool,
    DenyPurge: bool,
    AllowRollup: bool,
    RePublish: [*c]jsRePublish,
    AllowDirect: bool,
    MirrorDirect: bool,
    DiscardNewPerSubject: bool,
};
pub const jsStreamConfig = struct_jsStreamConfig;
pub const struct_jsLostStreamData = extern struct {
    Msgs: [*c]u64,
    MsgsLen: c_int,
    Bytes: u64,
};
pub const jsLostStreamData = struct_jsLostStreamData;
pub const struct_jsStreamStateSubject = extern struct {
    Subject: [*c]const u8,
    Msgs: u64,
};
pub const jsStreamStateSubject = struct_jsStreamStateSubject;
pub const struct_jsStreamStateSubjects = extern struct {
    List: [*c]jsStreamStateSubject,
    Count: c_int,
};
pub const jsStreamStateSubjects = struct_jsStreamStateSubjects;
pub const struct_jsStreamState = extern struct {
    Msgs: u64,
    Bytes: u64,
    FirstSeq: u64,
    FirstTime: i64,
    LastSeq: u64,
    LastTime: i64,
    NumSubjects: i64,
    Subjects: [*c]jsStreamStateSubjects,
    NumDeleted: u64,
    Deleted: [*c]u64,
    DeletedLen: c_int,
    Lost: [*c]jsLostStreamData,
    Consumers: i64,
};
pub const jsStreamState = struct_jsStreamState;
pub const struct_jsPeerInfo = extern struct {
    Name: [*c]u8,
    Current: bool,
    Offline: bool,
    Active: i64,
    Lag: u64,
};
pub const jsPeerInfo = struct_jsPeerInfo;
pub const struct_jsClusterInfo = extern struct {
    Name: [*c]u8,
    Leader: [*c]u8,
    Replicas: [*c][*c]jsPeerInfo,
    ReplicasLen: c_int,
};
pub const jsClusterInfo = struct_jsClusterInfo;
pub const struct_jsStreamSourceInfo = extern struct {
    Name: [*c]u8,
    External: [*c]jsExternalStream,
    Lag: u64,
    Active: i64,
};
pub const jsStreamSourceInfo = struct_jsStreamSourceInfo;
pub const struct_jsStreamAlternate = extern struct {
    Name: [*c]const u8,
    Domain: [*c]const u8,
    Cluster: [*c]const u8,
};
pub const jsStreamAlternate = struct_jsStreamAlternate;
pub const struct_jsStreamInfo = extern struct {
    Config: [*c]jsStreamConfig,
    Created: i64,
    State: jsStreamState,
    Cluster: [*c]jsClusterInfo,
    Mirror: [*c]jsStreamSourceInfo,
    Sources: [*c][*c]jsStreamSourceInfo,
    SourcesLen: c_int,
    Alternates: [*c][*c]jsStreamAlternate,
    AlternatesLen: c_int,
};
pub const jsStreamInfo = struct_jsStreamInfo;
pub const struct_jsStreamInfoList = extern struct {
    List: [*c][*c]jsStreamInfo,
    Count: c_int,
};
pub const jsStreamInfoList = struct_jsStreamInfoList;
pub const struct_jsStreamNamesList = extern struct {
    List: [*c][*c]u8,
    Count: c_int,
};
pub const jsStreamNamesList = struct_jsStreamNamesList;
pub const struct_jsConsumerSequenceMismatch = extern struct {
    Stream: u64,
    ConsumerClient: u64,
    ConsumerServer: u64,
};
pub const jsConsumerSequenceMismatch = struct_jsConsumerSequenceMismatch;
pub const struct_jsSubOptions = extern struct {
    Stream: [*c]const u8,
    Consumer: [*c]const u8,
    Queue: [*c]const u8,
    ManualAck: bool,
    Config: jsConsumerConfig,
    Ordered: bool,
};
pub const jsSubOptions = struct_jsSubOptions;
pub const struct_jsSequencePair = extern struct {
    Consumer: u64,
    Stream: u64,
};
pub const jsSequencePair = struct_jsSequencePair;
pub const struct_jsSequenceInfo = extern struct {
    Consumer: u64,
    Stream: u64,
    Last: i64,
};
pub const jsSequenceInfo = struct_jsSequenceInfo;
pub const struct_jsConsumerInfo = extern struct {
    Stream: [*c]u8,
    Name: [*c]u8,
    Created: i64,
    Config: [*c]jsConsumerConfig,
    Delivered: jsSequenceInfo,
    AckFloor: jsSequenceInfo,
    NumAckPending: i64,
    NumRedelivered: i64,
    NumWaiting: i64,
    NumPending: u64,
    Cluster: [*c]jsClusterInfo,
    PushBound: bool,
};
pub const jsConsumerInfo = struct_jsConsumerInfo;
pub const struct_jsConsumerInfoList = extern struct {
    List: [*c][*c]jsConsumerInfo,
    Count: c_int,
};
pub const jsConsumerInfoList = struct_jsConsumerInfoList;
pub const struct_jsConsumerNamesList = extern struct {
    List: [*c][*c]u8,
    Count: c_int,
};
pub const jsConsumerNamesList = struct_jsConsumerNamesList;
pub const struct_jsAPIStats = extern struct {
    Total: u64,
    Errors: u64,
};
pub const jsAPIStats = struct_jsAPIStats;
pub const struct_jsAccountLimits = extern struct {
    MaxMemory: i64,
    MaxStore: i64,
    MaxStreams: i64,
    MaxConsumers: i64,
    MaxAckPending: i64,
    MemoryMaxStreamBytes: i64,
    StoreMaxStreamBytes: i64,
    MaxBytesRequired: bool,
};
pub const jsAccountLimits = struct_jsAccountLimits;
pub const struct_jsTier = extern struct {
    Name: [*c]const u8,
    Memory: u64,
    Store: u64,
    Streams: i64,
    Consumers: i64,
    Limits: jsAccountLimits,
};
pub const jsTier = struct_jsTier;
pub const struct_jsAccountInfo = extern struct {
    Memory: u64,
    Store: u64,
    Streams: i64,
    Consumers: i64,
    Domain: [*c]u8,
    API: jsAPIStats,
    Limits: jsAccountLimits,
    Tiers: [*c][*c]jsTier,
    TiersLen: c_int,
};
pub const jsAccountInfo = struct_jsAccountInfo;
pub const struct_jsMsgMetaData = extern struct {
    Sequence: jsSequencePair,
    NumDelivered: u64,
    NumPending: u64,
    Timestamp: i64,
    Stream: [*c]u8,
    Consumer: [*c]u8,
    Domain: [*c]u8,
};
pub const jsMsgMetaData = struct_jsMsgMetaData;
pub const struct_jsDirectGetMsgOptions = extern struct {
    Sequence: u64,
    NextBySubject: [*c]const u8,
    LastBySubject: [*c]const u8,
};
pub const jsDirectGetMsgOptions = struct_jsDirectGetMsgOptions;
pub const struct_jsFetchRequest = extern struct {
    Expires: i64,
    Batch: c_int,
    MaxBytes: i64,
    NoWait: bool,
    Heartbeat: i64,
};
pub const jsFetchRequest = struct_jsFetchRequest;
pub const struct___kvStore = extern struct {
    mu: [*c]natsMutex,
    refs: c_int,
    js: [*c]jsCtx,
    bucket: [*c]u8,
    stream: [*c]u8,
    pre: [*c]u8,
    putPre: [*c]u8,
    usePutPre: bool,
    useJSPrefix: bool,
    useDirect: bool,
};
pub const kvStore = struct___kvStore;
pub const struct___kvEntry = extern struct {
    kv: [*c]kvStore,
    key: [*c]const u8,
    msg: [*c]natsMsg,
    delta: u64,
    op: kvOperation,
    next: [*c]struct___kvEntry,
};
pub const kvEntry = struct___kvEntry;
pub const struct___kvStatus = extern struct {
    kv: [*c]kvStore,
    si: [*c]jsStreamInfo,
};
pub const kvStatus = struct___kvStatus;
pub const struct___kvWatcher = extern struct {
    mu: [*c]natsMutex,
    refs: c_int,
    kv: [*c]kvStore,
    sub: [*c]natsSubscription,
    initPending: u64,
    received: u64,
    ignoreDel: bool,
    initDone: bool,
    retMarker: bool,
    stopped: bool,
};
pub const kvWatcher = struct___kvWatcher;
pub const kvOp_Unknown: c_int = 0;
pub const kvOp_Put: c_int = 1;
pub const kvOp_Delete: c_int = 2;
pub const kvOp_Purge: c_int = 3;
pub const kvOperation = c_uint;
pub const struct_kvConfig = extern struct {
    Bucket: [*c]const u8,
    Description: [*c]const u8,
    MaxValueSize: i32,
    History: u8,
    TTL: i64,
    MaxBytes: i64,
    StorageType: jsStorageType,
    Replicas: c_int,
    RePublish: [*c]jsRePublish,
    Mirror: [*c]jsStreamSource,
    Sources: [*c][*c]jsStreamSource,
    SourcesLen: c_int,
};
pub const kvConfig = struct_kvConfig;
pub const struct_kvWatchOptions = extern struct {
    IgnoreDeletes: bool,
    IncludeHistory: bool,
    MetaOnly: bool,
    Timeout: i64,
};
pub const kvWatchOptions = struct_kvWatchOptions;
pub const struct_kvPurgeOptions = extern struct {
    Timeout: i64,
    DeleteMarkersOlderThan: i64,
};
pub const kvPurgeOptions = struct_kvPurgeOptions;
pub const struct_kvEntryList = extern struct {
    Entries: [*c][*c]kvEntry,
    Count: c_int,
};
pub const kvEntryList = struct_kvEntryList;
pub const struct_kvKeysList = extern struct {
    Keys: [*c][*c]u8,
    Count: c_int,
};
pub const kvKeysList = struct_kvKeysList;
pub const natsEvLoop_Attach = ?*const fn ([*c]?*anyopaque, ?*anyopaque, [*c]natsConnection, natsSock) callconv(.C) natsStatus;
pub const natsEvLoop_ReadAddRemove = ?*const fn (?*anyopaque, bool) callconv(.C) natsStatus;
pub const natsEvLoop_WriteAddRemove = ?*const fn (?*anyopaque, bool) callconv(.C) natsStatus;
pub const natsEvLoop_Detach = ?*const fn (?*anyopaque) callconv(.C) natsStatus;
pub extern fn nats_Open(lockSpinCount: i64) natsStatus;
pub extern fn nats_GetVersion() [*c]const u8;
pub extern fn nats_GetVersionNumber() u32;
pub extern fn nats_CheckCompatibilityImpl(reqVerNumber: u32, verNumber: u32, verString: [*c]const u8) bool;
pub extern fn nats_Now() i64;
pub extern fn nats_NowInNanoSeconds() i64;
pub extern fn nats_Sleep(sleepTime: i64) void;
pub extern fn nats_GetLastError(status: [*c]natsStatus) [*c]const u8;
pub extern fn nats_GetLastErrorStack(buffer: [*c]u8, bufLen: usize) natsStatus;
pub extern fn nats_PrintLastErrorStack(file: [*c]FILE) void;
pub extern fn nats_SetMessageDeliveryPoolSize(max: c_int) natsStatus;
pub extern fn nats_ReleaseThreadMemory() void;
pub extern fn nats_Sign(encodedSeed: [*c]const u8, input: [*c]const u8, signature: [*c][*c]u8, signatureLength: [*c]c_int) natsStatus;
pub extern fn nats_Close() void;
pub extern fn nats_CloseAndWait(timeout: i64) natsStatus;
pub extern fn natsStatus_GetText(s: natsStatus) [*c]const u8;
pub extern fn natsStatistics_Create(newStats: [*c][*c]natsStatistics) natsStatus;
pub extern fn natsStatistics_GetCounts(stats: [*c]const natsStatistics, inMsgs: [*c]u64, inBytes: [*c]u64, outMsgs: [*c]u64, outBytes: [*c]u64, reconnects: [*c]u64) natsStatus;
pub extern fn natsStatistics_Destroy(stats: [*c]natsStatistics) void;
pub extern fn natsOptions_Create(newOpts: [*c][*c]natsOptions) natsStatus;
pub extern fn natsOptions_SetURL(opts: [*c]natsOptions, url: [*c]const u8) natsStatus;
pub extern fn natsOptions_SetServers(opts: [*c]natsOptions, servers: [*c][*c]const u8, serversCount: c_int) natsStatus;
pub extern fn natsOptions_SetUserInfo(opts: [*c]natsOptions, user: [*c]const u8, password: [*c]const u8) natsStatus;
pub extern fn natsOptions_SetToken(opts: [*c]natsOptions, token: [*c]const u8) natsStatus;
pub extern fn natsOptions_SetTokenHandler(opts: [*c]natsOptions, tokenCb: natsTokenHandler, closure: ?*anyopaque) natsStatus;
pub extern fn natsOptions_SetNoRandomize(opts: [*c]natsOptions, noRandomize: bool) natsStatus;
pub extern fn natsOptions_SetTimeout(opts: [*c]natsOptions, timeout: i64) natsStatus;
pub extern fn natsOptions_SetName(opts: [*c]natsOptions, name: [*c]const u8) natsStatus;
pub extern fn natsOptions_SetSecure(opts: [*c]natsOptions, secure: bool) natsStatus;
pub extern fn natsOptions_LoadCATrustedCertificates(opts: [*c]natsOptions, fileName: [*c]const u8) natsStatus;
pub extern fn natsOptions_SetCATrustedCertificates(opts: [*c]natsOptions, certificates: [*c]const u8) natsStatus;
pub extern fn natsOptions_LoadCertificatesChain(opts: [*c]natsOptions, certsFileName: [*c]const u8, keyFileName: [*c]const u8) natsStatus;
pub extern fn natsOptions_SetCertificatesChain(opts: [*c]natsOptions, cert: [*c]const u8, key: [*c]const u8) natsStatus;
pub extern fn natsOptions_SetCiphers(opts: [*c]natsOptions, ciphers: [*c]const u8) natsStatus;
pub extern fn natsOptions_SetCipherSuites(opts: [*c]natsOptions, ciphers: [*c]const u8) natsStatus;
pub extern fn natsOptions_SetExpectedHostname(opts: [*c]natsOptions, hostname: [*c]const u8) natsStatus;
pub extern fn natsOptions_SkipServerVerification(opts: [*c]natsOptions, skip: bool) natsStatus;
pub extern fn natsOptions_SetVerbose(opts: [*c]natsOptions, verbose: bool) natsStatus;
pub extern fn natsOptions_SetPedantic(opts: [*c]natsOptions, pedantic: bool) natsStatus;
pub extern fn natsOptions_SetPingInterval(opts: [*c]natsOptions, interval: i64) natsStatus;
pub extern fn natsOptions_SetMaxPingsOut(opts: [*c]natsOptions, maxPingsOut: c_int) natsStatus;
pub extern fn natsOptions_SetIOBufSize(opts: [*c]natsOptions, ioBufSize: c_int) natsStatus;
pub extern fn natsOptions_SetAllowReconnect(opts: [*c]natsOptions, allow: bool) natsStatus;
pub extern fn natsOptions_SetMaxReconnect(opts: [*c]natsOptions, maxReconnect: c_int) natsStatus;
pub extern fn natsOptions_SetReconnectWait(opts: [*c]natsOptions, reconnectWait: i64) natsStatus;
pub extern fn natsOptions_SetReconnectJitter(opts: [*c]natsOptions, jitter: i64, jitterTLS: i64) natsStatus;
pub extern fn natsOptions_SetCustomReconnectDelay(opts: [*c]natsOptions, cb: natsCustomReconnectDelayHandler, closure: ?*anyopaque) natsStatus;
pub extern fn natsOptions_SetReconnectBufSize(opts: [*c]natsOptions, reconnectBufSize: c_int) natsStatus;
pub extern fn natsOptions_SetMaxPendingMsgs(opts: [*c]natsOptions, maxPending: c_int) natsStatus;
pub extern fn natsOptions_SetErrorHandler(opts: [*c]natsOptions, errHandler: natsErrHandler, closure: ?*anyopaque) natsStatus;
pub extern fn natsOptions_SetClosedCB(opts: [*c]natsOptions, closedCb: natsConnectionHandler, closure: ?*anyopaque) natsStatus;
pub extern fn natsOptions_SetDisconnectedCB(opts: [*c]natsOptions, disconnectedCb: natsConnectionHandler, closure: ?*anyopaque) natsStatus;
pub extern fn natsOptions_SetReconnectedCB(opts: [*c]natsOptions, reconnectedCb: natsConnectionHandler, closure: ?*anyopaque) natsStatus;
pub extern fn natsOptions_SetDiscoveredServersCB(opts: [*c]natsOptions, discoveredServersCb: natsConnectionHandler, closure: ?*anyopaque) natsStatus;
pub extern fn natsOptions_SetIgnoreDiscoveredServers(opts: [*c]natsOptions, ignore: bool) natsStatus;
pub extern fn natsOptions_SetLameDuckModeCB(opts: [*c]natsOptions, lameDuckCb: natsConnectionHandler, closure: ?*anyopaque) natsStatus;
pub extern fn natsOptions_SetEventLoop(opts: [*c]natsOptions, loop: ?*anyopaque, attachCb: natsEvLoop_Attach, readCb: natsEvLoop_ReadAddRemove, writeCb: natsEvLoop_WriteAddRemove, detachCb: natsEvLoop_Detach) natsStatus;
pub extern fn natsOptions_UseGlobalMessageDelivery(opts: [*c]natsOptions, global: bool) natsStatus;
pub extern fn natsOptions_IPResolutionOrder(opts: [*c]natsOptions, order: c_int) natsStatus;
pub extern fn natsOptions_SetSendAsap(opts: [*c]natsOptions, sendAsap: bool) natsStatus;
pub extern fn natsOptions_UseOldRequestStyle(opts: [*c]natsOptions, useOldStyle: bool) natsStatus;
pub extern fn natsOptions_SetFailRequestsOnDisconnect(opts: [*c]natsOptions, failRequests: bool) natsStatus;
pub extern fn natsOptions_SetNoEcho(opts: [*c]natsOptions, noEcho: bool) natsStatus;
pub extern fn natsOptions_SetRetryOnFailedConnect(opts: [*c]natsOptions, retry: bool, connectedCb: natsConnectionHandler, closure: ?*anyopaque) natsStatus;
pub extern fn natsOptions_SetUserCredentialsCallbacks(opts: [*c]natsOptions, ujwtCB: natsUserJWTHandler, ujwtClosure: ?*anyopaque, sigCB: natsSignatureHandler, sigClosure: ?*anyopaque) natsStatus;
pub extern fn natsOptions_SetUserCredentialsFromFiles(opts: [*c]natsOptions, userOrChainedFile: [*c]const u8, seedFile: [*c]const u8) natsStatus;
pub extern fn natsOptions_SetUserCredentialsFromMemory(opts: [*c]natsOptions, jwtAndSeedContent: [*c]const u8) natsStatus;
pub extern fn natsOptions_SetNKey(opts: [*c]natsOptions, pubKey: [*c]const u8, sigCB: natsSignatureHandler, sigClosure: ?*anyopaque) natsStatus;
pub extern fn natsOptions_SetNKeyFromSeed(opts: [*c]natsOptions, pubKey: [*c]const u8, seedFile: [*c]const u8) natsStatus;
pub extern fn natsOptions_SetWriteDeadline(opts: [*c]natsOptions, deadline: i64) natsStatus;
pub extern fn natsOptions_DisableNoResponders(opts: [*c]natsOptions, disabled: bool) natsStatus;
pub extern fn natsOptions_SetCustomInboxPrefix(opts: [*c]natsOptions, inboxPrefix: [*c]const u8) natsStatus;
pub extern fn natsOptions_SetMessageBufferPadding(opts: [*c]natsOptions, paddingSize: c_int) natsStatus;
pub extern fn natsOptions_Destroy(opts: [*c]natsOptions) void;
pub extern fn natsInbox_Create(newInbox: [*c][*c]natsInbox) natsStatus;
pub extern fn natsInbox_Destroy(inbox: [*c]natsInbox) void;
pub extern fn natsMsgList_Destroy(list: [*c]natsMsgList) void;
pub extern fn natsMsg_Create(newMsg: [*c][*c]natsMsg, subj: [*c]const u8, reply: [*c]const u8, data: [*c]const u8, dataLen: c_int) natsStatus;
pub extern fn natsMsg_GetSubject(msg: [*c]const natsMsg) [*c]const u8;
pub extern fn natsMsg_GetReply(msg: [*c]const natsMsg) [*c]const u8;
pub extern fn natsMsg_GetData(msg: [*c]const natsMsg) [*c]const u8;
pub extern fn natsMsg_GetDataLength(msg: [*c]const natsMsg) c_int;
pub extern fn natsMsgHeader_Set(msg: [*c]natsMsg, key: [*c]const u8, value: [*c]const u8) natsStatus;
pub extern fn natsMsgHeader_Add(msg: [*c]natsMsg, key: [*c]const u8, value: [*c]const u8) natsStatus;
pub extern fn natsMsgHeader_Get(msg: [*c]natsMsg, key: [*c]const u8, value: [*c][*c]const u8) natsStatus;
pub extern fn natsMsgHeader_Values(msg: [*c]natsMsg, key: [*c]const u8, values: [*c][*c][*c]const u8, count: [*c]c_int) natsStatus;
pub extern fn natsMsgHeader_Keys(msg: [*c]natsMsg, keys: [*c][*c][*c]const u8, count: [*c]c_int) natsStatus;
pub extern fn natsMsgHeader_Delete(msg: [*c]natsMsg, key: [*c]const u8) natsStatus;
pub extern fn natsMsg_IsNoResponders(msg: [*c]natsMsg) bool;
pub extern fn natsMsg_Destroy(msg: [*c]natsMsg) void;
pub extern fn natsConnection_Connect(nc: [*c][*c]natsConnection, options: [*c]natsOptions) natsStatus;
pub extern fn natsConnection_ProcessReadEvent(nc: [*c]natsConnection) void;
pub extern fn natsConnection_ProcessWriteEvent(nc: [*c]natsConnection) void;
pub extern fn natsConnection_ConnectTo(nc: [*c][*c]natsConnection, urls: [*c]const u8) natsStatus;
pub extern fn natsConnection_IsClosed(nc: [*c]natsConnection) bool;
pub extern fn natsConnection_IsReconnecting(nc: [*c]natsConnection) bool;
pub extern fn natsConnection_IsDraining(nc: [*c]natsConnection) bool;
pub extern fn natsConnection_Status(nc: [*c]natsConnection) natsConnStatus;
pub extern fn natsConnection_Buffered(nc: [*c]natsConnection) c_int;
pub extern fn natsConnection_Flush(nc: [*c]natsConnection) natsStatus;
pub extern fn natsConnection_FlushTimeout(nc: [*c]natsConnection, timeout: i64) natsStatus;
pub extern fn natsConnection_GetMaxPayload(nc: [*c]natsConnection) i64;
pub extern fn natsConnection_GetStats(nc: [*c]natsConnection, stats: [*c]natsStatistics) natsStatus;
pub extern fn natsConnection_GetConnectedUrl(nc: [*c]natsConnection, buffer: [*c]u8, bufferSize: usize) natsStatus;
pub extern fn natsConnection_GetConnectedServerId(nc: [*c]natsConnection, buffer: [*c]u8, bufferSize: usize) natsStatus;
pub extern fn natsConnection_GetServers(nc: [*c]natsConnection, servers: [*c][*c][*c]u8, count: [*c]c_int) natsStatus;
pub extern fn natsConnection_GetDiscoveredServers(nc: [*c]natsConnection, servers: [*c][*c][*c]u8, count: [*c]c_int) natsStatus;
pub extern fn natsConnection_GetLastError(nc: [*c]natsConnection, lastError: [*c][*c]const u8) natsStatus;
pub extern fn natsConnection_GetClientID(nc: [*c]natsConnection, cid: [*c]u64) natsStatus;
pub extern fn natsConnection_Drain(nc: [*c]natsConnection) natsStatus;
pub extern fn natsConnection_DrainTimeout(nc: [*c]natsConnection, timeout: i64) natsStatus;
pub extern fn natsConnection_Sign(nc: [*c]natsConnection, message: [*c]const u8, messageLen: c_int, sig: [*c]u8) natsStatus;
pub extern fn natsConnection_GetClientIP(nc: [*c]natsConnection, ip: [*c][*c]u8) natsStatus;
pub extern fn natsConnection_GetRTT(nc: [*c]natsConnection, rtt: [*c]i64) natsStatus;
pub extern fn natsConnection_HasHeaderSupport(nc: [*c]natsConnection) natsStatus;
pub extern fn natsConnection_GetLocalIPAndPort(nc: [*c]natsConnection, ip: [*c][*c]u8, port: [*c]c_int) natsStatus;
pub extern fn natsConnection_Close(nc: [*c]natsConnection) void;
pub extern fn natsConnection_Destroy(nc: [*c]natsConnection) void;
pub extern fn natsConnection_Publish(nc: [*c]natsConnection, subj: [*c]const u8, data: ?*const anyopaque, dataLen: c_int) natsStatus;
pub extern fn natsConnection_PublishString(nc: [*c]natsConnection, subj: [*c]const u8, str: [*c]const u8) natsStatus;
pub extern fn natsConnection_PublishMsg(nc: [*c]natsConnection, msg: [*c]natsMsg) natsStatus;
pub extern fn natsConnection_PublishRequest(nc: [*c]natsConnection, subj: [*c]const u8, reply: [*c]const u8, data: ?*const anyopaque, dataLen: c_int) natsStatus;
pub extern fn natsConnection_PublishRequestString(nc: [*c]natsConnection, subj: [*c]const u8, reply: [*c]const u8, str: [*c]const u8) natsStatus;
pub extern fn natsConnection_Request(replyMsg: [*c][*c]natsMsg, nc: [*c]natsConnection, subj: [*c]const u8, data: ?*const anyopaque, dataLen: c_int, timeout: i64) natsStatus;
pub extern fn natsConnection_RequestString(replyMsg: [*c][*c]natsMsg, nc: [*c]natsConnection, subj: [*c]const u8, str: [*c]const u8, timeout: i64) natsStatus;
pub extern fn natsConnection_RequestMsg(replyMsg: [*c][*c]natsMsg, nc: [*c]natsConnection, requestMsg: [*c]natsMsg, timeout: i64) natsStatus;
pub extern fn natsConnection_Subscribe(sub: [*c][*c]natsSubscription, nc: [*c]natsConnection, subject: [*c]const u8, cb: natsMsgHandler, cbClosure: ?*anyopaque) natsStatus;
pub extern fn natsConnection_SubscribeTimeout(sub: [*c][*c]natsSubscription, nc: [*c]natsConnection, subject: [*c]const u8, timeout: i64, cb: natsMsgHandler, cbClosure: ?*anyopaque) natsStatus;
pub extern fn natsConnection_SubscribeSync(sub: [*c][*c]natsSubscription, nc: [*c]natsConnection, subject: [*c]const u8) natsStatus;
pub extern fn natsConnection_QueueSubscribe(sub: [*c][*c]natsSubscription, nc: [*c]natsConnection, subject: [*c]const u8, queueGroup: [*c]const u8, cb: natsMsgHandler, cbClosure: ?*anyopaque) natsStatus;
pub extern fn natsConnection_QueueSubscribeTimeout(sub: [*c][*c]natsSubscription, nc: [*c]natsConnection, subject: [*c]const u8, queueGroup: [*c]const u8, timeout: i64, cb: natsMsgHandler, cbClosure: ?*anyopaque) natsStatus;
pub extern fn natsConnection_QueueSubscribeSync(sub: [*c][*c]natsSubscription, nc: [*c]natsConnection, subject: [*c]const u8, queueGroup: [*c]const u8) natsStatus;
pub extern fn natsSubscription_NoDeliveryDelay(sub: [*c]natsSubscription) natsStatus;
pub extern fn natsSubscription_NextMsg(nextMsg: [*c][*c]natsMsg, sub: [*c]natsSubscription, timeout: i64) natsStatus;
pub extern fn natsSubscription_Unsubscribe(sub: [*c]natsSubscription) natsStatus;
pub extern fn natsSubscription_AutoUnsubscribe(sub: [*c]natsSubscription, max: c_int) natsStatus;
pub extern fn natsSubscription_QueuedMsgs(sub: [*c]natsSubscription, queuedMsgs: [*c]u64) natsStatus;
pub extern fn natsSubscription_GetID(sub: [*c]natsSubscription) i64;
pub extern fn natsSubscription_GetSubject(sub: [*c]natsSubscription) [*c]const u8;
pub extern fn natsSubscription_SetPendingLimits(sub: [*c]natsSubscription, msgLimit: c_int, bytesLimit: c_int) natsStatus;
pub extern fn natsSubscription_GetPendingLimits(sub: [*c]natsSubscription, msgLimit: [*c]c_int, bytesLimit: [*c]c_int) natsStatus;
pub extern fn natsSubscription_GetPending(sub: [*c]natsSubscription, msgs: [*c]c_int, bytes: [*c]c_int) natsStatus;
pub extern fn natsSubscription_GetDelivered(sub: [*c]natsSubscription, msgs: [*c]i64) natsStatus;
pub extern fn natsSubscription_GetDropped(sub: [*c]natsSubscription, msgs: [*c]i64) natsStatus;
pub extern fn natsSubscription_GetMaxPending(sub: [*c]natsSubscription, msgs: [*c]c_int, bytes: [*c]c_int) natsStatus;
pub extern fn natsSubscription_ClearMaxPending(sub: [*c]natsSubscription) natsStatus;
pub extern fn natsSubscription_GetStats(sub: [*c]natsSubscription, pendingMsgs: [*c]c_int, pendingBytes: [*c]c_int, maxPendingMsgs: [*c]c_int, maxPendingBytes: [*c]c_int, deliveredMsgs: [*c]i64, droppedMsgs: [*c]i64) natsStatus;
pub extern fn natsSubscription_IsValid(sub: [*c]natsSubscription) bool;
pub extern fn natsSubscription_Drain(sub: [*c]natsSubscription) natsStatus;
pub extern fn natsSubscription_DrainTimeout(sub: [*c]natsSubscription, timeout: i64) natsStatus;
pub extern fn natsSubscription_WaitForDrainCompletion(sub: [*c]natsSubscription, timeout: i64) natsStatus;
pub extern fn natsSubscription_DrainCompletionStatus(sub: [*c]natsSubscription) natsStatus;
pub extern fn natsSubscription_SetOnCompleteCB(sub: [*c]natsSubscription, cb: natsOnCompleteCB, closure: ?*anyopaque) natsStatus;
pub extern fn natsSubscription_Destroy(sub: [*c]natsSubscription) void;
pub extern fn jsOptions_Init(opts: [*c]jsOptions) natsStatus;
pub extern fn natsConnection_JetStream(js: [*c][*c]jsCtx, nc: [*c]natsConnection, opts: [*c]jsOptions) natsStatus;
pub extern fn jsCtx_Destroy(js: [*c]jsCtx) void;
pub extern fn jsStreamConfig_Init(cfg: [*c]jsStreamConfig) natsStatus;
pub extern fn jsPlacement_Init(placement: [*c]jsPlacement) natsStatus;
pub extern fn jsStreamSource_Init(source: [*c]jsStreamSource) natsStatus;
pub extern fn jsExternalStream_Init(external: [*c]jsExternalStream) natsStatus;
pub extern fn jsRePublish_Init(rp: [*c]jsRePublish) natsStatus;
pub extern fn js_AddStream(si: [*c][*c]jsStreamInfo, js: [*c]jsCtx, cfg: [*c]jsStreamConfig, opts: [*c]jsOptions, errCode: [*c]jsErrCode) natsStatus;
pub extern fn js_UpdateStream(si: [*c][*c]jsStreamInfo, js: [*c]jsCtx, cfg: [*c]jsStreamConfig, opts: [*c]jsOptions, errCode: [*c]jsErrCode) natsStatus;
pub extern fn js_PurgeStream(js: [*c]jsCtx, stream: [*c]const u8, opts: [*c]jsOptions, errCode: [*c]jsErrCode) natsStatus;
pub extern fn js_DeleteStream(js: [*c]jsCtx, stream: [*c]const u8, opts: [*c]jsOptions, errCode: [*c]jsErrCode) natsStatus;
pub extern fn js_GetMsg(msg: [*c][*c]natsMsg, js: [*c]jsCtx, stream: [*c]const u8, seq: u64, opts: [*c]jsOptions, errCode: [*c]jsErrCode) natsStatus;
pub extern fn js_GetLastMsg(msg: [*c][*c]natsMsg, js: [*c]jsCtx, stream: [*c]const u8, subject: [*c]const u8, opts: [*c]jsOptions, errCode: [*c]jsErrCode) natsStatus;
pub extern fn jsDirectGetMsgOptions_Init(opts: [*c]jsDirectGetMsgOptions) natsStatus;
pub extern fn js_DirectGetMsg(msg: [*c][*c]natsMsg, js: [*c]jsCtx, stream: [*c]const u8, opts: [*c]jsOptions, dgOpts: [*c]jsDirectGetMsgOptions) natsStatus;
pub extern fn js_DeleteMsg(js: [*c]jsCtx, stream: [*c]const u8, seq: u64, opts: [*c]jsOptions, errCode: [*c]jsErrCode) natsStatus;
pub extern fn js_EraseMsg(js: [*c]jsCtx, stream: [*c]const u8, seq: u64, opts: [*c]jsOptions, errCode: [*c]jsErrCode) natsStatus;
pub extern fn js_GetStreamInfo(si: [*c][*c]jsStreamInfo, js: [*c]jsCtx, stream: [*c]const u8, opts: [*c]jsOptions, errCode: [*c]jsErrCode) natsStatus;
pub extern fn jsStreamInfo_Destroy(si: [*c]jsStreamInfo) void;
pub extern fn js_Streams(list: [*c][*c]jsStreamInfoList, js: [*c]jsCtx, opts: [*c]jsOptions, errCode: [*c]jsErrCode) natsStatus;
pub extern fn jsStreamInfoList_Destroy(list: [*c]jsStreamInfoList) void;
pub extern fn js_StreamNames(list: [*c][*c]jsStreamNamesList, js: [*c]jsCtx, opts: [*c]jsOptions, errCode: [*c]jsErrCode) natsStatus;
pub extern fn jsStreamNamesList_Destroy(list: [*c]jsStreamNamesList) void;
pub extern fn jsConsumerConfig_Init(cc: [*c]jsConsumerConfig) natsStatus;
pub extern fn js_AddConsumer(ci: [*c][*c]jsConsumerInfo, js: [*c]jsCtx, stream: [*c]const u8, cfg: [*c]jsConsumerConfig, opts: [*c]jsOptions, errCode: [*c]jsErrCode) natsStatus;
pub extern fn js_UpdateConsumer(ci: [*c][*c]jsConsumerInfo, js: [*c]jsCtx, stream: [*c]const u8, cfg: [*c]jsConsumerConfig, opts: [*c]jsOptions, errCode: [*c]jsErrCode) natsStatus;
pub extern fn js_GetConsumerInfo(ci: [*c][*c]jsConsumerInfo, js: [*c]jsCtx, stream: [*c]const u8, consumer: [*c]const u8, opts: [*c]jsOptions, errCode: [*c]jsErrCode) natsStatus;
pub extern fn js_DeleteConsumer(js: [*c]jsCtx, stream: [*c]const u8, consumer: [*c]const u8, opts: [*c]jsOptions, errCode: [*c]jsErrCode) natsStatus;
pub extern fn jsConsumerInfo_Destroy(ci: [*c]jsConsumerInfo) void;
pub extern fn js_Consumers(list: [*c][*c]jsConsumerInfoList, js: [*c]jsCtx, stream: [*c]const u8, opts: [*c]jsOptions, errCode: [*c]jsErrCode) natsStatus;
pub extern fn jsConsumerInfoList_Destroy(list: [*c]jsConsumerInfoList) void;
pub extern fn js_ConsumerNames(list: [*c][*c]jsConsumerNamesList, js: [*c]jsCtx, stream: [*c]const u8, opts: [*c]jsOptions, errCode: [*c]jsErrCode) natsStatus;
pub extern fn jsConsumerNamesList_Destroy(list: [*c]jsConsumerNamesList) void;
pub extern fn js_GetAccountInfo(ai: [*c][*c]jsAccountInfo, js: [*c]jsCtx, opts: [*c]jsOptions, errCode: [*c]jsErrCode) natsStatus;
pub extern fn jsAccountInfo_Destroy(ai: [*c]jsAccountInfo) void;
pub extern fn jsPubOptions_Init(opts: [*c]jsPubOptions) natsStatus;
pub extern fn js_Publish(pubAck: [*c][*c]jsPubAck, js: [*c]jsCtx, subj: [*c]const u8, data: ?*const anyopaque, dataLen: c_int, opts: [*c]jsPubOptions, errCode: [*c]jsErrCode) natsStatus;
pub extern fn js_PublishMsg(pubAck: [*c][*c]jsPubAck, js: [*c]jsCtx, msg: [*c]natsMsg, opts: [*c]jsPubOptions, errCode: [*c]jsErrCode) natsStatus;
pub extern fn jsPubAck_Destroy(pubAck: [*c]jsPubAck) void;
pub extern fn js_PublishAsync(js: [*c]jsCtx, subj: [*c]const u8, data: ?*const anyopaque, dataLen: c_int, opts: [*c]jsPubOptions) natsStatus;
pub extern fn js_PublishMsgAsync(js: [*c]jsCtx, msg: [*c][*c]natsMsg, opts: [*c]jsPubOptions) natsStatus;
pub extern fn js_PublishAsyncComplete(js: [*c]jsCtx, opts: [*c]jsPubOptions) natsStatus;
pub extern fn js_PublishAsyncGetPendingList(pending: [*c]natsMsgList, js: [*c]jsCtx) natsStatus;
pub extern fn jsSubOptions_Init(opts: [*c]jsSubOptions) natsStatus;
pub extern fn js_Subscribe(sub: [*c][*c]natsSubscription, js: [*c]jsCtx, subject: [*c]const u8, cb: natsMsgHandler, cbClosure: ?*anyopaque, opts: [*c]jsOptions, subOpts: [*c]jsSubOptions, errCode: [*c]jsErrCode) natsStatus;
pub extern fn js_SubscribeSync(sub: [*c][*c]natsSubscription, js: [*c]jsCtx, subject: [*c]const u8, opts: [*c]jsOptions, subOpts: [*c]jsSubOptions, errCode: [*c]jsErrCode) natsStatus;
pub extern fn js_PullSubscribe(sub: [*c][*c]natsSubscription, js: [*c]jsCtx, subject: [*c]const u8, durable: [*c]const u8, opts: [*c]jsOptions, subOpts: [*c]jsSubOptions, errCode: [*c]jsErrCode) natsStatus;
pub extern fn natsSubscription_Fetch(list: [*c]natsMsgList, sub: [*c]natsSubscription, batch: c_int, timeout: i64, errCode: [*c]jsErrCode) natsStatus;
pub extern fn jsFetchRequest_Init(request: [*c]jsFetchRequest) natsStatus;
pub extern fn natsSubscription_FetchRequest(list: [*c]natsMsgList, sub: [*c]natsSubscription, request: [*c]jsFetchRequest) natsStatus;
pub extern fn natsSubscription_GetConsumerInfo(ci: [*c][*c]jsConsumerInfo, sub: [*c]natsSubscription, opts: [*c]jsOptions, errCode: [*c]jsErrCode) natsStatus;
pub extern fn natsSubscription_GetSequenceMismatch(csm: [*c]jsConsumerSequenceMismatch, sub: [*c]natsSubscription) natsStatus;
pub extern fn natsMsg_GetMetaData(new_meta: [*c][*c]jsMsgMetaData, msg: [*c]natsMsg) natsStatus;
pub extern fn jsMsgMetaData_Destroy(meta: [*c]jsMsgMetaData) void;
pub extern fn natsMsg_Ack(msg: [*c]natsMsg, opts: [*c]jsOptions) natsStatus;
pub extern fn natsMsg_AckSync(msg: [*c]natsMsg, opts: [*c]jsOptions, errCode: [*c]jsErrCode) natsStatus;
pub extern fn natsMsg_Nak(msg: [*c]natsMsg, opts: [*c]jsOptions) natsStatus;
pub extern fn natsMsg_NakWithDelay(msg: [*c]natsMsg, delay: i64, opts: [*c]jsOptions) natsStatus;
pub extern fn natsMsg_InProgress(msg: [*c]natsMsg, opts: [*c]jsOptions) natsStatus;
pub extern fn natsMsg_Term(msg: [*c]natsMsg, opts: [*c]jsOptions) natsStatus;
pub extern fn natsMsg_GetSequence(msg: [*c]natsMsg) u64;
pub extern fn natsMsg_GetTime(msg: [*c]natsMsg) i64;
pub extern fn kvConfig_Init(cfg: [*c]kvConfig) natsStatus;
pub extern fn js_CreateKeyValue(new_kv: [*c][*c]kvStore, js: [*c]jsCtx, cfg: [*c]kvConfig) natsStatus;
pub extern fn js_KeyValue(new_kv: [*c][*c]kvStore, js: [*c]jsCtx, bucket: [*c]const u8) natsStatus;
pub extern fn js_DeleteKeyValue(js: [*c]jsCtx, bucket: [*c]const u8) natsStatus;
pub extern fn kvStore_Destroy(kv: [*c]kvStore) void;
pub extern fn kvEntry_Bucket(e: [*c]kvEntry) [*c]const u8;
pub extern fn kvEntry_Key(e: [*c]kvEntry) [*c]const u8;
pub extern fn kvEntry_Value(e: [*c]kvEntry) ?*const anyopaque;
pub extern fn kvEntry_ValueLen(e: [*c]kvEntry) c_int;
pub extern fn kvEntry_ValueString(e: [*c]kvEntry) [*c]const u8;
pub extern fn kvEntry_Revision(e: [*c]kvEntry) u64;
pub extern fn kvEntry_Created(e: [*c]kvEntry) i64;
pub extern fn kvEntry_Delta(e: [*c]kvEntry) u64;
pub extern fn kvEntry_Operation(e: [*c]kvEntry) kvOperation;
pub extern fn kvEntry_Destroy(e: [*c]kvEntry) void;
pub extern fn kvStore_Get(new_entry: [*c][*c]kvEntry, kv: [*c]kvStore, key: [*c]const u8) natsStatus;
pub extern fn kvStore_GetRevision(new_entry: [*c][*c]kvEntry, kv: [*c]kvStore, key: [*c]const u8, revision: u64) natsStatus;
pub extern fn kvStore_Put(rev: [*c]u64, kv: [*c]kvStore, key: [*c]const u8, data: ?*const anyopaque, len: c_int) natsStatus;
pub extern fn kvStore_PutString(rev: [*c]u64, kv: [*c]kvStore, key: [*c]const u8, data: [*c]const u8) natsStatus;
pub extern fn kvStore_Create(rev: [*c]u64, kv: [*c]kvStore, key: [*c]const u8, data: ?*const anyopaque, len: c_int) natsStatus;
pub extern fn kvStore_CreateString(rev: [*c]u64, kv: [*c]kvStore, key: [*c]const u8, data: [*c]const u8) natsStatus;
pub extern fn kvStore_Update(rev: [*c]u64, kv: [*c]kvStore, key: [*c]const u8, data: ?*const anyopaque, len: c_int, last: u64) natsStatus;
pub extern fn kvStore_UpdateString(rev: [*c]u64, kv: [*c]kvStore, key: [*c]const u8, data: [*c]const u8, last: u64) natsStatus;
pub extern fn kvStore_Delete(kv: [*c]kvStore, key: [*c]const u8) natsStatus;
pub extern fn kvStore_Purge(kv: [*c]kvStore, key: [*c]const u8, opts: [*c]kvPurgeOptions) natsStatus;
pub extern fn kvWatchOptions_Init(opts: [*c]kvWatchOptions) natsStatus;
pub extern fn kvPurgeOptions_Init(opts: [*c]kvPurgeOptions) natsStatus;
pub extern fn kvStore_PurgeDeletes(kv: [*c]kvStore, opts: [*c]kvPurgeOptions) natsStatus;
pub extern fn kvStore_Watch(new_watcher: [*c][*c]kvWatcher, kv: [*c]kvStore, keys: [*c]const u8, opts: [*c]kvWatchOptions) natsStatus;
pub extern fn kvStore_WatchAll(new_watcher: [*c][*c]kvWatcher, kv: [*c]kvStore, opts: [*c]kvWatchOptions) natsStatus;
pub extern fn kvStore_Keys(list: [*c]kvKeysList, kv: [*c]kvStore, opts: [*c]kvWatchOptions) natsStatus;
pub extern fn kvKeysList_Destroy(list: [*c]kvKeysList) void;
pub extern fn kvStore_History(list: [*c]kvEntryList, kv: [*c]kvStore, key: [*c]const u8, opts: [*c]kvWatchOptions) natsStatus;
pub extern fn kvEntryList_Destroy(list: [*c]kvEntryList) void;
pub extern fn kvStore_Bucket(kv: [*c]kvStore) [*c]const u8;
pub extern fn kvStore_Status(new_status: [*c][*c]kvStatus, kv: [*c]kvStore) natsStatus;
pub extern fn kvWatcher_Next(new_entry: [*c][*c]kvEntry, w: [*c]kvWatcher, timeout: i64) natsStatus;
pub extern fn kvWatcher_Stop(w: [*c]kvWatcher) natsStatus;
pub extern fn kvWatcher_Destroy(w: [*c]kvWatcher) void;
pub extern fn kvStatus_Bucket(sts: [*c]kvStatus) [*c]const u8;
pub extern fn kvStatus_Values(sts: [*c]kvStatus) u64;
pub extern fn kvStatus_History(sts: [*c]kvStatus) i64;
pub extern fn kvStatus_TTL(sts: [*c]kvStatus) i64;
pub extern fn kvStatus_Replicas(sts: [*c]kvStatus) i64;
pub extern fn kvStatus_Bytes(sts: [*c]kvStatus) u64;
pub extern fn kvStatus_Destroy(sts: [*c]kvStatus) void;
pub extern fn nats_setErrorReal(fileName: [*c]const u8, funcName: [*c]const u8, line: c_int, errSts: natsStatus, errTxtFmt: [*c]const u8, ...) natsStatus;
pub extern fn nats_updateErrStack(err: natsStatus, func: [*c]const u8) natsStatus;
pub extern fn nats_clearLastError() void;
pub extern fn nats_doNotUpdateErrStack(skipStackUpdate: bool) void;
pub extern fn nats_updateErrTxt(fileName: [*c]const u8, funcName: [*c]const u8, line: c_int, errTxtFmt: [*c]const u8, ...) void;
pub extern fn nats_setErrStatusAndTxt(err: natsStatus, errTxt: [*c]const u8) void;
pub extern fn natsBuf_InitWithBackend(buf: [*c]natsBuffer, data: [*c]u8, len: c_int, capacity: c_int) natsStatus;
pub extern fn natsBuf_Init(buf: [*c]natsBuffer, capacity: c_int) natsStatus;
pub extern fn natsBuf_CreateWithBackend(newBuf: [*c][*c]natsBuffer, data: [*c]u8, len: c_int, capacity: c_int) natsStatus;
pub extern fn natsBuf_Create(newBuf: [*c][*c]natsBuffer, capacity: c_int) natsStatus;
pub extern fn natsBuf_Reset(buf: [*c]natsBuffer) void;
pub extern fn natsBuf_MoveTo(buf: [*c]natsBuffer, newPosition: c_int) void;
pub extern fn natsBuf_Expand(buf: [*c]natsBuffer, newSize: c_int) natsStatus;
pub extern fn natsBuf_Append(buf: [*c]natsBuffer, data: [*c]const u8, dataLen: c_int) natsStatus;
pub extern fn natsBuf_AppendByte(buf: [*c]natsBuffer, b: u8) natsStatus;
pub extern fn natsBuf_Consume(buf: [*c]natsBuffer, n: c_int) void;
pub extern fn natsBuf_Destroy(buf: [*c]natsBuffer) void;
