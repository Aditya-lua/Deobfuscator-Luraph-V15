#!/usr/bin/env python3
"""List the TOP-LEVEL fields of the captured VM chunk's setmetatable table
(depth-aware scanner: only name=value pairs at brace depth 1)."""
import sys

src = open(sys.argv[1] if len(sys.argv) > 1 else 'work_bfmain/chunk_input.lua',
           encoding='utf-8', errors='surrogateescape').read()

i = src.index('setmetatable({') + len('setmetatable({')
depth = 1          # inside the outer '{'
instr = False      # inside a "..." string
esc = False
fields = []
cur = ''
j = i
while j < len(src) and depth > 0:
    ch = src[j]
    if instr:
        cur += ch
        if esc:
            esc = False
        elif ch == '\\':
            esc = True
        elif ch == '"':
            instr = False
        j += 1
        continue
    if ch == '"':
        instr = True
        cur += ch
    elif ch in '{([':
        depth += 1
        cur += ch
    elif ch in '})]':
        depth -= 1
        if depth == 0:
            break
        cur += ch
    elif ch == ',' and depth == 1:
        fields.append(cur.strip())
        cur = ''
    else:
        cur += ch
    j += 1

if cur.strip():
    fields.append(cur.strip())

print('top-level fields:', len(fields))
for f in fields:
    if '=function' in f:
        name = f.split('=function')[0]
        print('  FUNC   ', name)
    elif f.startswith('['):
        name = f.split(']=', 1)[0] + ']'
        val = f.split(']=', 1)[1] if ']=' in f else '?'
        vs = val[:60] + ('...' if len(val) > 60 else '')
        print('  INDEX  ', name, '=', vs)
    else:
        name = f.split('=', 1)[0] if '=' in f else f
        print('  SCALAR ', f[:120])
