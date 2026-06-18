#!/usr/bin/env lua

local M = require 'sysutil'

-- get current work directory
local cwd = M.getcwd()
assert(type(cwd) == 'string',    "getcwd: expected string")
assert(#cwd > 0,                 "getcwd: expected non-empty")

local r = M.chdir('/tmp')
assert(r == 0,                   "chdir('/tmp'): expected 0")
assert(M.getcwd() == '/tmp',     "chdir('/tmp'): verify failed")
M.chdir(cwd)

-- mkdir(path [, mode])
-- mode: default to be 0755
local d = '/tmp/sysutil-test-dir'
local r2 = M.mkdir(d)
assert(r2 == 0,                  'mkdir: expected 0')

-- rmdir(path [, path1 [, path2 [, ...]]])
local n, err = M.rmdir(d)
assert(n == 1,                   'rmdir: expected 1')
assert(err == 0,                 'rmdir: expected err 0')

