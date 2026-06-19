#!/usr/bin/env lua

local M = require 'sysutil'

-- base64(data [, decode])
local enc = M.base64('hello world')
assert(type(enc) == 'string',    'base64(encode): expected string')
assert(#enc > 0,                 'base64(encode): expected non-empty')
local dec = M.base64(enc, true)
assert(dec == 'hello world',     'base64(decode): round-trip failed')

-- sha256(data [, is_file [, hex_output]])
local raw = M.sha256('hello world')
assert(type(raw) == 'string',    'sha256: expected string')
assert(#raw == 32,               'sha256: expected 32 bytes')
local hex = M.sha256('hello world', false, true)
assert(#hex == 64,               'sha256(hex): expected 64 chars')
assert(hex == 'b94d27b9934d3e08a52e52d7da7dabfac484efe37a5380ee9088f7ace2efcde9',
                                  'sha256(hex): known value mismatch')

