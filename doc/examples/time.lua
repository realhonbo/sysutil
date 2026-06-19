#!/usr/bin/env lua

local M = require 'sysutil'

-- optional args: (is_utc, want_nanoseconds)
local sec, msec = M.uptime()
assert(type(sec) == 'number',   'uptime: sec expected number')
assert(type(msec) == 'number',  'uptime: msec expected number')
assert(sec >= 0,                'uptime: sec should be >= 0')
assert(msec >= 0,               'uptime: msec should be >= 0')
assert(msec < 1000,             'uptime: msec should be < 1000')

-- uptime(1970): return an 'Unix Timestamp'
local rt_sec = M.uptime(1970)
assert(type(rt_sec) == 'number','uptime(1970): expected number')
assert(rt_sec > 1000000000,     'uptime(1970): should be after 2001')

-- uptime in milliseconds
local ums = M.upmsec()
assert(type(ums) == 'number',   'upmsec: expected number')
assert(ums > 0,                 'upmsec: should be > 0')

-- YYYY-MM-DD HH:MM:SS
local ts = M.timestr()
assert(type(ts) == 'string',    'timestr(): expected string')
assert(#ts >= 19,               'timestr(): expected at least 19 chars')
assert(string.match(ts, '^%d%d%d%d%-%d%d%-%d%d %d%d:%d%d:%d%d') ~= nil,
                                 'timestr(): bad format')

-- timestr(ts [, ms [, is_utc]])
-- ts: Unix Timestamp
-- ms: milliseconds, format to: YYYY-MM-DD HH:MM:SS.mmm
local ts3 = M.timestr(0, 0, true)
assert(type(ts3) == 'string',   'timestr(0,0,true): expected string')
assert(string.match(ts3, '^1970%-01%-01') ~= nil,
                                 'timestr(0,0,true): expected 1970-01-01')

-- timedur(duration [, is_msec])
local d1 = M.timedur(0)
assert(type(d1) == 'string',    'timedur(0): expected string')
assert(#d1 > 0,                 'timedur(0): expected non-empty')
assert(d1 == '0 day, 00:00:00', 'timedur(0): bad format')

local r = M.delay(0)
assert(r == 0,                  'delay(0): expected 0')
local r2 = M.mdelay(0)
assert(r2 == 0,                 'mdelay(0): expected 0')

