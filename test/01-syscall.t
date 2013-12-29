#!/usr/bin/env luajit

require 'Test.More'

if not jit then
    skip_all 'not LuaJIT'
end

plan(2)

local S = require 'syscall'

ok( S.stdin:isatty(), "isatty" )

todo( "TIOCGWINSZ", 1 )
ok( S.ioctl(S.stdout, 'TIOCGWINSZ'), "winsize" )
