#!/usr/bin/env lua

local M = require 'sysutil'

local b = M.basename('/usr/local/bin/lua')
assert(b == 'lua',               "basename: expected 'lua'")

local d = M.dirname('/usr/local/bin/lua')
assert(d == '/usr/local/bin',    "dirname: expected '/usr/local/bin'")
assert(M.dirname('foo.txt') == '.',
                                  "dirname('foo.txt'): expected '.'")
local r = M.realpath('/')
assert(type(r) == 'string',      "realpath('/'): expected string")
assert(#r > 0,                   "realpath('/'): expected non-empty")

local l = M.readlink('/proc/self')
assert(type(l) == 'string',      "readlink('/proc/self'): expected string")
assert(#l > 0,                   "readlink('/proc/self'): expected non-empty")

