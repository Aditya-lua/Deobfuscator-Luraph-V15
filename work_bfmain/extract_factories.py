#!/usr/bin/env python3
"""Extract every LPH_ENCFUNC plaintext factory from the captured VM chunk of
banana-hub bf_main.lua and render a recovered-source view.

Each factory is [key]=function(b, <upvals...>) return function(<args>) <body> end end
where b = the per-closure upvalue table (b[N] = Nth upvalue). The bodies are
plaintext Luau (only identifiers mangled, stdlib/globals hoisted into b[N])."""
import json
import re
import sys

SRC = 'work_bfmain/chunk_input.lua'
AST = 'work_bfmain/chunk_ast.json'
OUT = sys.argv[1] if len(sys.argv) > 1 else 'work_bfmain/bf_main_recovered.lua'

src = open(SRC, encoding='utf-8', errors='surrogateescape').read()
ast = json.load(open(AST))
ra = lambda p: int(p.split(',')[1])

def slice_loc(loc):
    a, b = loc.split(' - ')
    return src[ra(a):ra(b)]

tbl = ast['root']['body'][0]['list'][0]['func']['expr']['args'][0]

factories = []   # (key, factory_text, size)
scalars = []     # (key, value_text)
for it in tbl['items']:
    if it['kind'] != 'general':
        continue
    key = it['key'].get('value')
    v = it['value']
    text = slice_loc(v['location'])
    if v.get('type') == 'AstExprFunction':
        factories.append((key, text, len(text)))
    else:
        scalars.append((key, text))

factories.sort(key=lambda x: -x[2])

# ---- render ------------------------------------------------------------
def indent(text, pad):
    return re.sub(r'^', pad, text, flags=re.M)

lines = []
w = lines.append
w('-- =====================================================================================')
w('-- banana-hub.xyz bf_main.lua -- recovered source view (Luraph Obfuscator v15)')
w('-- =====================================================================================')
w('-- Provenance:')
w('--   wrapper : Luraph v15 loader (_bsdata0 handshake, request stubs, 305-byte key blob)')
w('--   payload : 435,924-byte Luraph v15 VM chunk (sha256-verified capture)')
w('--   contents: 137 plaintext LPH_ENCFUNC function factories (the actual script logic)')
w('--             + Luraph v15 VM interpreter (string/state dispatch, not script logic)')
w('--')
w('-- Factory shape: fn_<key>(UP, <upvals...>) -> function(<args>) ... end')
w('--   UP[N] = the Nth upvalue bound by the VM dispatcher at runtime (globals like')
w('--   pairs/typeof/game, or enclosing locals). Where the use is unambiguous the')
w('--   header comment names it. Identifiers are Luraph-mangled (Z, F, c, l, H, ...).')
w('--')
w('-- Sorted by body size, largest first.')
w('-- =====================================================================================')
w('')
scalars_sorted = sorted(scalars)
w('-- ---- VM table scalar fields (reference) ----------------------------------------------')
for k, text in scalars_sorted:
    w('-- [%s] = %s' % (k, text[:100]))
w('')
w('-- ---- VM table non-function entries (stdlib + constants, reference) -------------------')

# stdlib map from the factories list is not here; emit separately below
stdlib = {}
for it in tbl['items']:
    if it['kind'] != 'general':
        continue
    key = it['key'].get('value')
    v = it['value']
    if v.get('type') != 'AstExprFunction':
        stdlib[key] = slice_loc(v['location'])

for key in sorted(stdlib):
    w('-- [%s] = %s' % (key, stdlib[key]))
w('')

def label(key, text):
    import re as _re
    strs = _re.findall(r'"([^"]{8,60})"', text)
    genv = _re.findall(r'getgenv\(\)\.([A-Za-z0-9_]+)', text)
    parts = []
    if strs:
        parts.append('notable strings: ' + '; '.join(strs[:3]))
    if genv:
        seen = []
        for g in genv:
            if g not in seen:
                seen.append(g)
            if len(seen) >= 4:
                break
        parts.append('getgenv globals: ' + ', '.join(seen))
    return '  '.join(parts)

for key, text, size in factories:
    # annotate obvious b[N] uses in a header comment
    refs = sorted(set(int(m) for m in re.findall(r'b\[(\d+)\]', text)))
    refnotes = []
    for r in refs:
        if r in stdlib:
            refnotes.append('b[%d]=%s' % (r, stdlib[r]))
    is_runtime = ('bit32' in ' '.join(refnotes) and 'buffer' in ' '.join(refnotes)) or \
                 ('b[55]=setfenv' in refnotes or 'b[56]=getfenv' in refnotes)
    kind = 'VM runtime helper (slots = the VM env table itself)' if is_runtime \
        else 'script logic (slots = runtime-bound upvalues; identify from use: pairs/game/etc.)'
    w('-- -------------------------------------------------------------------------------------')
    w('-- fn_%s  (%d bytes)   %s' % (key, size, kind))
    w('--   slots referenced: %s' % (refs if refs else 'none'))
    lab = label(key, text)
    if lab:
        w('--   %s' % lab)
    # render: turn [key]=<fn> into  fn_<key> = <fn>
    body = text
    w('fn_%s = %s;' % (key, body))
    w('')

open(OUT, 'w', encoding='utf-8', errors='surrogateescape').write('\n'.join(lines))
print('[+] wrote %s (%d bytes, %d factories)' % (OUT, len('\n'.join(lines)), len(factories)))
