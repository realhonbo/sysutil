#!/usr/bin/env lua

local M = require 'sysutil'

-- getenv(name)
local home = M.getenv('HOME')
assert(type(home) == 'string',   "getenv('HOME'): expected string")
assert(#home > 0,                "getenv('HOME'): expected non-empty")
local v, err = M.getenv('__SYSUTIL_NONEXIST_VAR__')
assert(v == nil,                 "getenv(nonexist): expected nil")
assert(type(err) == 'number',    "getenv(nonexist): err expected number")

local r = M.setenv('SYSUTIL_TEST_VAR', 'hello')
assert(r == 0,                   "setenv(new): expected 0")
assert(M.getenv('SYSUTIL_TEST_VAR') == 'hello',
                                  "setenv(new): verify failed")

-- setenv(name [, value [, overwrite]])
M.setenv('SYSUTIL_TEST_VAR', 'keep', false)
assert(M.getenv('SYSUTIL_TEST_VAR') == 'hello',
                                  "setenv(no-override): should keep old value")

