#!/usr/bin/env python3
"""Wrap the captured VM chunk so that, when the loader calls it, the wrapper
logs each vararg (type / length / keys) through print() before forwarding
everything to the original :oP(...) entry. Purely diagnostic."""
import sys

SRC = sys.argv[1] if len(sys.argv) > 1 else 'work_bfmain/chunk_input.lua'
OUT = sys.argv[2] if len(sys.argv) > 2 else 'work_bfmain/chunk_diag.lua'

src = open(SRC, encoding='utf-8', errors='surrogateescape').read()

TAIL = '},{}):oP(...);'
if not src.rstrip().endswith(TAIL):
    sys.exit('[!] unexpected chunk tail')
body = src.rstrip()[: -len(TAIL)]  # 'return setmetatable({...'

PREFIX = 'return setmetatable('
if not body.startswith(PREFIX):
    sys.exit('[!] unexpected chunk head')
body = 'local __impl = setmetatable(' + body[len(PREFIX):]

wrapper = (
    '},{});\n'
    'return function(...)\n'
    '    local n = select("#", ...)\n'
    '    print("CHUNK_CALL nargs=", n)\n'
    '    for i = 1, n do\n'
    '        local v = select(i, ...)\n'
    '        local t = typeof(v)\n'
    '        if t == "string" then\n'
    '            print("CHUNK_ARG", i, "string", #v)\n'
    '        elseif t == "buffer" then\n'
    '            print("CHUNK_ARG", i, "buffer", buffer.len(v))\n'
    '        elseif t == "table" then\n'
    '            local keys = {}\n'
    '            local nk = 0\n'
    '            for k in pairs(v) do\n'
    '                nk = nk + 1\n'
    '                if nk <= 12 then keys[nk] = tostring(k) .. ":" .. typeof(v[k]) end\n'
    '            end\n'
    '            print("CHUNK_ARG", i, "table", nk, table.concat(keys, ","))\n'
    '        else\n'
    '            print("CHUNK_ARG", i, t, tostring(v))\n'
    '        end\n'
    '    end\n'
    '    local ok, err = pcall(function(...) return __impl:oP(...) end, ...)\n'
    '    if not ok then print("CHUNK_ERR", err, debug.traceback(err)) end\n'
    '    if PASS_STATE == nil then\n'
    '        local ok2, r2 = pcall(function() return __impl:oP(buffer.fromstring(getgenv()._bsdata0[1])) end)\n'
    '        print("STATE_TEST", ok2, r2)\n'
    '    end\n'
    '    return __impl:oP(...)\n'
    'end;\n'
)

out = body + wrapper
open(OUT, 'w', encoding='utf-8', errors='surrogateescape').write(out)
print('[+] wrote %s (%d bytes)' % (OUT, len(out)))
