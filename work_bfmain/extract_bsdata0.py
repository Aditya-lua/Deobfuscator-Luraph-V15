#!/usr/bin/env python3
"""Extract the deterministic _bsdata0 handshake from the envlog trace of the
bf_main loader, unescape it, and emit a Lua prelude that re-arms it for a
standalone run of the captured VM chunk."""
import re
import sys

TRACE = sys.argv[1] if len(sys.argv) > 1 else 'work_bfmain/raw_trace.txt'
OUT = sys.argv[2] if len(sys.argv) > 2 else 'work_bfmain/bsdata0_prelude.lua'

text = open(TRACE, encoding='utf-8', errors='surrogateescape').read()
m = re.search(
    r'getgenv\(\)\._bsdata0 = \{\n\t"((?:[^"\\]|\\.)*)",\n\t(\d+),\n\t(\d+)',
    text, re.S)
if not m:
    sys.exit('[!] no _bsdata0 in trace')

escaped, seed1, seed2 = m.group(1), m.group(2), m.group(3)

# Unescape the envlog's Lua-style rendering back to raw bytes.
out = bytearray()
i = 0
while i < len(escaped):
    ch = escaped[i]
    if ch != '\\':
        out.extend(ch.encode('utf-8', errors='surrogateescape'))
        i += 1
        continue
    nxt = escaped[i + 1]
    if nxt == 'n':
        out.append(10); i += 2
    elif nxt == 't':
        out.append(9); i += 2
    elif nxt == 'r':
        out.append(13); i += 2
    elif nxt == '\\':
        out.append(92); i += 2
    elif nxt == '"':
        out.append(34); i += 2
    elif nxt == "'":
        out.append(39); i += 2
    elif nxt == 'a':
        out.append(7); i += 2
    elif nxt == 'b':
        out.append(8); i += 2
    elif nxt == 'f':
        out.append(12); i += 2
    elif nxt == 'v':
        out.append(11); i += 2
    elif nxt == '\n':
        out.append(10); i += 2
    elif nxt.isdigit():
        j = i + 1
        num = ''
        while j < len(escaped) and escaped[j].isdigit() and len(num) < 3:
            num += escaped[j]; j += 1
        out.append(int(num) & 0xFF); i = j
    else:
        sys.exit('[!] unknown escape: \\%s at %d' % (nxt, i))

print('[*] blob bytes: %d  seeds: %s %s' % (len(out), seed1, seed2))
if len(out) != 256:
    print('[!] expected 256 bytes -- continuing anyway')

# Round-trip check: re-escape with envlog's exact quote() algorithm and
# require a byte-identical match with the trace rendering.
def re_escape(bs):
    parts = []
    for b in bs:
        if b == 10: parts.append('\\n')
        elif b == 9: parts.append('\\t')
        elif b == 13: parts.append('\\r')
        elif b == 34: parts.append('\\"')
        elif b == 92: parts.append('\\\\')
        elif 0x20 <= b < 0x7F: parts.append(chr(b))
        else: parts.append('\\%d' % b)
    return ''.join(parts)

rt = re_escape(bytes(out))
if rt == escaped:
    print('[+] round-trip: LOSSLESS (parse verified)')
else:
    print('[!] round-trip MISMATCH (parsed %dB, re-escaped %d chars vs %d)'
          % (len(out), len(rt), len(escaped)))

# Re-emit as a Lua long-bracket-free escaped literal (decimal escapes only,
# printable ASCII kept literal so the file stays diffable).
def lua_quote(bs):
    parts = []
    for b in bs:
        if 0x20 <= b < 0x7F and b not in (34, 92):
            parts.append(chr(b))
        else:
            parts.append('\\%d' % b)
    return '"' + ''.join(parts) + '"'

blob = lua_quote(bytes(out))
prelude = (
    '-- auto-generated: re-arms the deterministic _bsdata0 handshake that the\n'
    '-- bf_main loader sets before loadstring-ing its VM chunk\n'
    '-- (prelude env: G=_G, genv=getgenv() table, shared=shared table)\n'
    'local B = %s\n'
    'local T = { B, %s, %s }\n'
    'genv._bsdata0 = T\n'
    'G._bsdata0 = T\n'
    'shared._bsdata0 = T\n'
    'env._bsdata0 = T\n'
) % (blob, seed1, seed2)
open(OUT, 'w', encoding='utf-8', errors='surrogateescape').write(prelude)
print('[+] prelude: %s' % OUT)
