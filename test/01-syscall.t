#!/usr/bin/env luajit

require 'Test.More'

if not jit then
    skip_all 'not LuaJIT'
end

plan(4)

local S = require 'syscall'

ok( S.stdin:isatty(), "isatty" )

local ws = S.ioctl(S.stdin, 'TIOCGWINSZ')
ok( ws, "winsize" )
type_ok( ws.ws_col, 'number', 'ws_col' )
ok( ws.ws_col >= 0 )
