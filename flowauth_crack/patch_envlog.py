#!/usr/bin/env python3
"""Patch runtime/envlog.luau (the sandbox) with FlowAuth support:

   1. a verified pure-Luau SHA-256 exposed as executor globals
      (hash/digest/crypto/crypt/sha256), so FlowAuth's native-crypto
      precheck passes;
   2. base64 decode/encode under the usual executor names;
   3. real HttpService JSONEncode/JSONDecode + GenerateGUID (v4 format);
   4. stable device identifiers (GetClientId, gethwid);
   5. the exact _bsdata0 handoff a fresh FlowAuth loader publishes
      (normal, non-alternate variant);
   6. request/http_request/etc. answered from a canned JSON map
      (captured live from flowauth.net) so server round-trips work;
      unknown requests are leaked into the trace via the
      \\x01SUPERZREQ\\x01 marker + a superz.leak/... HttpGet probe so the
      driver can replay them for real and re-patch.

Usage:
    python3 patch_envlog.py [--repo PATH] [--loader loader.lua]
                            [--canned canned.json]

Defaults: --repo is the parent of this script's directory (i.e. the repo
root), --loader defaults to work/loader.lua, --canned to work/canned.json.
Idempotent via the [SUPERZ] marker; restores from envlog.luau.orig first.
"""
import argparse
import json
import os
import re
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
DEFAULT_REPO = os.path.dirname(HERE)
MARK = "[SUPERZ]"

parser = argparse.ArgumentParser(description="Patch envlog.luau for FlowAuth")
parser.add_argument("--repo", default=DEFAULT_REPO, help="deobfuscator repo root")
parser.add_argument("--loader", default=os.path.join(HERE, "work", "loader.lua"),
                    help="fresh FlowAuth loader .lua (contains the handoff line)")
parser.add_argument("--canned", default=os.path.join(HERE, "work", "canned.json"),
                    help="JSON map 'METHOD url' -> {status, body}")
args = parser.parse_args()

REPO = args.repo
ENVPATH = os.path.join(REPO, "runtime", "envlog.luau")
LOADER = args.loader
CANNED_JSON = args.canned if os.path.exists(args.canned) else None
SHA = os.path.join(HERE, "sha256.luau")
B64 = os.path.join(HERE, "base64.luau")
JSONP = os.path.join(HERE, "json.luau")

if not os.path.exists(ENVPATH):
    sys.exit(f"envlog not found: {ENVPATH}")
if not os.path.exists(LOADER):
    sys.exit(f"loader not found: {LOADER} (fetch a fresh one with flowauth_chain.py)")

# --- 1. extract the normal (non-alternate) handoff literal -----------------
loader = open(LOADER, encoding="latin1").read()
hline = [l for l in loader.splitlines() if l.startswith("local handoff=")]
if not hline:
    sys.exit("handoff line not found in loader")
hline = hline[0].rstrip()
idx = hline.find("} or {")
assert idx > 0, "cannot split handoff line"
normal_part = hline[idx + 5:].strip()
assert normal_part.startswith("{") and normal_part.endswith("}"), normal_part[-40:]
seeds = re.search(r",(\d{9,10}),(\d{9,10})\}$", normal_part)
assert seeds, "no seeds found in normal handoff"
normal = normal_part
nbytes = normal.count("\\") - 1
print("normal handoff: blob with", nbytes, "escaped bytes, seeds",
      seeds.group(1), seeds.group(2))

# --- 2. load sha256 + base64 impls ------------------------------------------
sha_src = open(SHA).read().rstrip()
assert "return sha256" in sha_src
b64_src = open(B64).read().rstrip()
assert "return b64decode, b64encode" in b64_src
json_src = open(JSONP).read().rstrip()
assert "return jsonEncode, jsonDecode" in json_src

def lua_str(s):
    out = ["\""]
    for ch in s.encode("latin1"):
        if ch == 34: out.append("\\\"")
        elif ch == 92: out.append("\\\\")
        elif ch == 10: out.append("\\n")
        elif ch == 13: out.append("\\r")
        elif ch == 9: out.append("\\t")
        elif 32 <= ch < 127: out.append(chr(ch))
        else: out.append("\\%03d" % ch)
    out.append("\"")
    return "".join(out)

# --- 3. patch envlog ---------------------------------------------------------
orig = ENVPATH + ".orig"
if not os.path.exists(orig):
    open(orig, "w", encoding="latin1", newline="").write(open(ENVPATH, encoding="latin1").read())
    print("backup written:", orig)
env = open(orig, encoding="latin1").read()

anchor = 'E.shared = genvTable("shared")'
assert anchor in env, "anchor line not found"

# GetClientId special case in the generic method dispatcher
svc_anchor = 'if name == "HttpGet" or name == "HttpGetAsync" or name == "HttpPost" or name == "HttpPostAsync"'
assert svc_anchor in env, "service dispatch anchor not found"
svc_block = '''        -- ''' + MARK + ''' real GUID for HttpService (envlog default answers a proxy)
        if name == "GenerateGUID" and isMethod then
                emit({ text = calleeText .. "(" .. fmtArgs(R.unpack(args, 1, args.n)) .. ") -- ''' + MARK + ''' real" })
                local v1, v2, v3 = math.random(0, 2147483647), math.random(0, 2147483647), math.random(0, 2147483647)
                return string.format("%08x-%04x-4%03x-%04x-%04x%08x",
                        v1 % 4294967296,
                        v1 % 65536,
                        v2 % 4096,
                        (v3 % 16384) + 0x8000,
                        v2 % 65536, v3 % 4294967296)
        end
        -- ''' + MARK + ''' real JSON for HttpService (envlog default answers a proxy)
        if (name == "JSONEncode" or name == "JSONDecode") and isMethod then
                local j = CFG.__superz_json
                local ok, out
                if name == "JSONEncode" then
                        ok, out = R.pcall(j.encode, args[1])
                else
                        ok, out = R.pcall(j.decode, a1 or args[1])
                end
                if ok then
                        emit({ text = calleeText .. "(" .. fmtArgs(R.unpack(args, 1, args.n)) .. ") -- ''' + MARK + ''' real" })
                        return out
                end
        end
        -- ''' + MARK + ''' RbxAnalyticsService:GetClientId() -> stable device GUID
        if name == "GetClientId" and isMethod then
                emit({ text = calleeText .. "()" })
                return "6c1f8a20-4e2b-4c9d-9f3a-71b2d5e0a4c7"
        end
        -- ''' + MARK + ''' canned HttpGet responses (FlowAuth payload fetch)
        if (name == "HttpGet" or name == "HttpGetAsync" or name == "GetAsync") and R.type(a1) == "string" then
                remember(urls, a1)
                local szcanned = CFG.__superz_canned
                local hit = szcanned and (szcanned["GET " .. a1] or szcanned[a1])
                if hit then
                        emit({ text = calleeText .. "(" .. fmtArgs(R.unpack(args, 1, args.n)) .. ") -- ''' + MARK + ''' canned" })
                        return hit.body
                end
        end

''' + svc_anchor

block = anchor + """

-- """ + MARK + """ FlowAuth support: verified SHA-256 + base64 + _bsdata0 handoff preseed
do
        local sha256fn = (function()
""" + sha_src + """
        end)()
        local b64decode, b64encode = (function()
""" + b64_src + """
        end)()
        local jsonEncode, jsonDecode = (function()
""" + json_src + """
        end)()
        CFG.__superz_json = { encode = jsonEncode, decode = jsonDecode }
        CFG.__superz_logglobal = true
        CFG.__superz_calls = {}
        -- game identity: EDIT these to the game FlowAuth should believe it runs in
        CFG.__superz_game_id = 3317771874
        CFG.__superz_place_id = 8737899170
        CFG.__superz_creator_id = 745308
        CFG.__superz_creator_type = "User"
        local function tobytes(data)
                if type(data) == "buffer" then return buffer.tostring(data) end
                return tostring(data)
        end
        E.sha256 = sha256fn
        E.hash = function(alg, data)
                local a = string.lower(tostring(alg))
                if a == "sha256" then return sha256fn(tobytes(data)) end
                error("hash: algorithm '" .. tostring(alg) .. "' not available in sandbox", 2)
        end
        E.digest = E.hash
        E.crypto = { sha256 = sha256fn, hash = E.hash, digest = E.hash }
        E.crypt = { sha256 = sha256fn, hash = E.hash,
                base64decode = b64decode, base64_decode = b64decode,
                base64encode = b64encode, base64_encode = b64encode }
        E.base64 = { decode = b64decode, encode = b64encode,
                Decode = b64decode, Encode = b64encode }
        E.base64decode = b64decode
        E.base64_decode = b64decode
        E.base64encode = b64encode
        -- stable device identifier fallbacks (FlowAuth probes these)
        E.gethwid = function() return "AF21C3E5B6D74E0982F1C0A5D3B7E912" end
        E.get_hwid = E.gethwid
        -- canned HTTP responses (captured live from flowauth.net)
        local canned = {}
        CFG.__superz_canned = canned
__CANNED_LUA__
        local function fakeRequest(opts)
                -- [SUPERZ] unwrap property proxies (REALV-backed) before use
                if (type(opts) == "table" or type(opts) == "userdata") and REALV[opts] ~= nil then
                        opts = REALV[opts]
                end
                local url, body, method = "", "", "GET"
                if type(opts) == "table" then
                        local uv = opts.Url or opts.url
                        if (type(uv) == "table" or type(uv) == "userdata") and REALV[uv] ~= nil then uv = REALV[uv] end
                        url = tostring(uv or "")
                        method = tostring(opts.Method or opts.method or "GET")
                        local bv = opts.Body or opts.body
                        if (type(bv) == "table" or type(bv) == "userdata") and REALV[bv] ~= nil then bv = REALV[bv] end
                        body = tobytes(bv or "")
                else
                        url = tostring(opts)
                end
                if not R.find(url, "^https?://") then
                        -- [SUPERZ] diagnostics: dump the proxy info so the
                        -- driver can show WHAT the runtime passed as opts
                        local desc = "opts=" .. type(opts)
                        if isP(opts) and INFO[opts] then
                                for ik, iv in R.next, INFO[opts] do
                                        desc = desc .. " " .. tostring(ik) .. "=" .. tostring(iv):sub(1, 60)
                                end
                        end
                        if type(opts) == "table" then
                                local uv2 = opts.Url or opts.url
                                desc = desc .. " Url=" .. type(uv2)
                                if isP(uv2) and INFO[uv2] then
                                        for ik2, iv2 in R.next, INFO[uv2] do
                                                desc = desc .. " " .. tostring(ik2) .. "=" .. tostring(iv2):sub(1, 60)
                                        end
                                end
                        end
                        print("\\1SUPERZREQOPTS\\1" .. b64encode(desc))
                end
                local hit = canned[method .. " " .. url] or canned[url]
                if hit then
                        return { Success = true, StatusCode = hit.status or 200,
                                Headers = hit.headers or {}, Body = hit.body }
                end
                -- [SUPERZ] in-run plant list (serve driver live responses),
                -- full-URL prefix matched, any host; reqbody (when present)
                -- additionally pins the entry to one REQUEST body -- the
                -- FlowAuth payload endpoint reuses one URL for chunk 1/2,
                -- only the token in the body differs (same-URL replay of
                -- chunk 1 broke the payload integrity check, observed).
                local list = urls.__lrm_plant
                if R.type(list) == "table" then
                        for i = 1, #list do
                                local plant = list[i]
                                if R.type(plant) == "table" and R.type(plant.body) == "string" then
                                        local u = plant.url
                                        local umatch = u == nil
                                                or (R.type(u) == "string" and R.sub(url, 1, #u) == u)
                                        local rb = plant.reqbody
                                        local rbmatch = rb == nil
                                                or (R.type(rb) == "string" and rb == body)
                                        if umatch and rbmatch then
                                                return { Success = true, StatusCode = plant.status or 200,
                                                        Headers = plant.headers or {}, Body = plant.body }
                                        end
                                end
                        end
                end
                -- leak the request into the trace (method|url|body, base64)
                local leak = b64encode(method .. "|" .. url .. "|" .. body)
                print("\\1SUPERZREQ\\1" .. leak)
                -- [SUPERZ] in-run live fetch loop: suspend the whole run for
                -- the serve driver (same process = same session nonce); the
                -- driver plants the response and resumes this exact thread
                if CFG.serve and SERVE_PAD and coroutine.isyieldable() then
                        local tries = urls.__sz_tries or {}
                        urls.__sz_tries = tries
                        local nk = method .. " " .. url
                        local n = (tries[nk] or 0) + 1
                        tries[nk] = n
                        if n <= 4 then
                                print(SERVE_PAD)
                                coroutine.yield("__LRMRES " .. url)
                                -- resumed with the response planted: re-enter
                                -- from the top (the plant scan hits now)
                                return fakeRequest(opts)
                        end
                end
                pcall(function() return E.game:HttpGet("https://superz.leak/" .. leak) end)
                return { Success = false, StatusCode = 0, Headers = {}, Body = "" }
        end
        local function installRequest(t)
                if type(t) ~= "table" then return end
                t.request = fakeRequest
                t.http_request = fakeRequest
                t.httpRequest = fakeRequest
                t.httprequest = fakeRequest
                t.http = { request = fakeRequest }
                t.syn = { request = fakeRequest }
        end
        installRequest(E)
        installRequest(GENV)
        installRequest(E._G)
        installRequest(E.shared)
        E.http = { request = fakeRequest }
        E.syn = { request = fakeRequest }
        -- ''' + MARK + ''' table.concat probe: find who passes userdata into concat
        local realtable = table
        local shimtable = setmetatable({}, { __index = realtable })
        shimtable.concat = function(t, sep, i, j)
                local lo, hi = (i or 1), (j or #t)
                local bad = false
                for k = lo, hi do
                        local v = t[k]
                        local vt = type(v)
                        if vt ~= "string" and vt ~= "number" then bad = true end
                end
                if bad then
                        local parts = {}
                        for k = 1, math.min(#t, 40) do
                                local v = t[k]
                                local desc = k .. ":" .. type(v) .. "=" .. tostring(v):sub(1, 40)
                                if isP(v) and INFO[v] then
                                        local inf = INFO[v]
                                        local ikeys = {}
                                        for ik, iv in pairs(inf) do
                                                ikeys[#ikeys + 1] = tostring(ik) .. "=" .. tostring(iv):sub(1, 80)
                                        end
                                        desc = desc .. " [INFO " .. table.concat(ikeys, ", ") .. "]"
                                end
                                parts[#parts + 1] = desc
                        end
                        local calllog = ""
                        if CFG.__superz_calls then
                                local cl = {}
                                local cc = #CFG.__superz_calls
                                for ci = math.max(1, cc - 12), cc do
                                        cl[#cl + 1] = tostring(CFG.__superz_calls[ci]):sub(1, 60)
                                end
                                calllog = " ||CALLS " .. table.concat(cl, " ;; ")
                        end
                        local tb = debug and debug.traceback and debug.traceback("concat", 2) or ""
                        print("\\1SUPERZCONCAT\\1" .. b64encode(table.concat(parts, " ~ ")
                                .. calllog .. " ||TB " .. tostring(tb):sub(1, 120)))
                end
                return realtable.concat(t, sep, i, j)
        end
        E.table = shimtable
        GENV.table = shimtable
        if type(E._G) == "table" then E._G.table = shimtable end
        if type(E.shared) == "table" then E.shared.table = shimtable end
        -- FlowAuth loader publishes _bsdata0 = {blob, seedA, seedB} (normal variant)
        local handoff = """ + normal + """
        E._bsdata0 = handoff
        GENV._bsdata0 = handoff
        if type(E._G) == "table" then E._G._bsdata0 = handoff end
        if type(E.shared) == "table" then E.shared._bsdata0 = handoff end
end"""

env = env.replace(anchor, block, 1)
env = env.replace(svc_anchor, svc_block, 1)

# ''' + MARK + ''' real values for game properties the sandbox doesn't model
pmti_anchor = "PMT.__index = function(p, k)\n        local info = INFO[p]"
assert pmti_anchor in env, "PMT.__index anchor not found"
env = env.replace(pmti_anchor, pmti_anchor + '''
        if k == "CreatorType" then return CFG.__superz_creator_type or "User" end
        if k == "GameId" then return CFG.__superz_game_id or 0 end
        if k == "PlaceId" then return CFG.__superz_place_id or 0 end
        if k == "CreatorId" then return CFG.__superz_creator_id or 0 end''', 1)

# ''' + MARK + ''' PMT.__concat: resolve REALV-wrapped proxies into real strings
cc_anchor = '''PMT.__concat = function(a, b)
        if opaqueType(a) or opaqueType(b) then
                R.error(R.fmt("attempt to concatenate %s with %s", luaTypeName(a), luaTypeName(b)), 2)
        end
        return exprP(fmt(a) .. " .. " .. fmt(b), "string")
end'''
assert cc_anchor in env, "__concat anchor not found"
env = env.replace(cc_anchor, '''PMT.__concat = function(a, b)
        if opaqueType(a) or opaqueType(b) then
                R.error(R.fmt("attempt to concatenate %s with %s", luaTypeName(a), luaTypeName(b)), 2)
        end
        local function __sz_rval(x)
                local t = type(x)
                if (t == "table" or t == "userdata") and REALV[x] ~= nil then return REALV[x] end
                return x
        end
        local __ra, __rb = __sz_rval(a), __sz_rval(b)
        local __ta, __tb = R.type(__ra), R.type(__rb)
        if (__ta == "string" or __ta == "number") and (__tb == "string" or __tb == "number") then
                return __ra .. __rb
        end
        if CFG.__superz_logglobal then
                local function __sz_desc(x)
                        local rv = "-"
                        local xt = type(x)
                        if (xt == "table" or xt == "userdata") and REALV[x] ~= nil then rv = R.tostring(REALV[x]):sub(1, 40) end
                        local inf = ((xt == "table" or xt == "userdata") and INFO[x]) or nil
                        local kind = inf and R.tostring(inf.kind) or "?"
                        local txt = inf and R.tostring(inf.text or inf.name or inf.hint or "?"):sub(1, 60) or R.tostring(x):sub(1, 40)
                        return xt .. "/" .. kind .. "/" .. txt .. "/realv=" .. rv
                end
                R.print("\\1SUPERZCONCATOP\\1" .. __sz_desc(a) .. " || " .. __sz_desc(b))
        end
        return exprP(fmt(a) .. " .. " .. fmt(b), "string")
end''', 1)

# log tostring() calls that fall through to expr proxy (root-cause probe)
ts_anchor = '                return exprP("tostring(" .. tok(v) .. ")", "string")'
assert ts_anchor in env, "tostring anchor not found"
env = env.replace(ts_anchor, '''                if CFG.__superz_logglobal then
                        local iks = {}
                        for ik2, iv2 in pairs(info) do
                                iks[#iks + 1] = tostring(ik2) .. "=" .. tostring(iv2):sub(1, 70)
                        end
                        R.print("\\1SUPERZTOSTRING\\1" .. table.concat(iks, " | "))
                end
''' + ts_anchor, 1)

# log every proxy-creating call (ring buffer) for diagnostics
cp_anchor = "local function callP(text, hint, tname, force)"
assert cp_anchor in env, "callP anchor not found"
env = env.replace(
    cp_anchor,
    cp_anchor + '''
        if CFG.__superz_calls then
                local n = #CFG.__superz_calls
                CFG.__superz_calls[n + 1] = text
                if n >= 400 then table.remove(CFG.__superz_calls, 1) end
        end''',
    1)

# log every unknown-global proxy answer (name leak)
gp_anchor = 'local p = globalP(k, "function")'
assert gp_anchor in env, "globalP anchor not found"
env = env.replace(
    gp_anchor,
    'if CFG.__superz_logglobal then R.print("\\1SUPERZGLOBAL\\1" .. k) end\n                ' + gp_anchor,
    1)

# inject canned responses (url -> {status, body}) from a JSON file
if CANNED_JSON:
    items = json.load(open(CANNED_JSON))
    parts = ["        canned[%s] = { status = %d, body = %s }" % (
        lua_str(u), r.get("status", 200), lua_str(r.get("body", ""))) for u, r in items.items()]
    env = env.replace("__CANNED_LUA__", "\n".join(parts), 1)
    print("canned responses injected:", len(items))
else:
    env = env.replace("__CANNED_LUA__", "        -- (none yet)", 1)

open(ENVPATH, "w", encoding="latin1", newline="").write(env)
print("patched:", ENVPATH, f"({len(env)} bytes)")
