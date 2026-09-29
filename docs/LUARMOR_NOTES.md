# Luarmor Client — Static Format Notes

Static analysis of the Luarmor whitelist client, based on a single 16,095-line
sample (`gdrive_in/Luarmor/luarmor source code compiled.lua (client)`, ~611 KB)
plus its companion signature file (`loadstring55.txt`). All line numbers refer
to that sample. This document describes **structure only** — it is the
reference we need to detect, classify, and (partially) unwrap Luarmor-wrapped
scripts in the corpus pipeline. It does **not** include and does not enable a
key-auth bypass: the parts of the format that matter for full recovery are
session-bound and live server-side (see §8).

---

## 1. TL;DR

Luarmor is not an obfuscator — it is a **whitelist/auth service** whose client
wraps and stages payloads. Its relationship to Luraph is layered, not competing:

```
executor paste (loadstring stub, not in sample)
  └─ defines ce_like_loadstring_fn + luraph_runtime1 (embedded Luraph VM runtime)
      └─ downloads / runs Luarmor client  (the analyzed file)
          ├─ executor fingerprinting        (UserGameSettings PRNG)
          ├─ env hardening + anti-tamper    (global hooks, marker tables, traps)
          ├─ auth: /auth/{id}/init → /auth/start/{tok}   (region-routed hosts)
          ├─ server response v81[]          (fn25 deserializer)
          │     [1][5][7] → PRNG reseeds   [3] → challenge hash   [6] → VM chunk
          └─ luraph_runtime1(v83, <encrypted constants buffer>, tbl33, 199)()
                └─ fills payload constant table v84[]  ← session-seeded
                    └─ plain-ish Lua payload runs (renamed locals, v84[N] constants)
```

Practical consequence: **the visible payload logic is recoverable statically;
the VM-decoded constants are not** — their values depend on the auth session.
A pipeline can therefore strip the loader, keep the payload, and flag the
`v84[N]` sites as opaque, instead of mis-classifying the whole file as garbage.

## 2. Stage map of the analyzed sample

| Lines (approx) | Stage | Notes |
|---|---|---|
| 1–17 | Bootstrap guard | `ce_like_loadstring_fn` check; direct-run kick is gated behind `if false then` (dead trap) |
| 18–95 | Fingerprint PRNG | tutorial-state LCG, 16 chars × 5 bits from `qwertyuiopasdfghjklzxcvbnm098765` |
| 96–200+ | Region routing | host tables per timezone/locale: `eu1/eu2`, `as1..as7`, `au1..au5`, `us1/us2`, `ca1` |
| 226–260 | Stdlib capture | `string["char"]`, `debug["traceback"]`, `os["clock"]`, Heartbeat, etc. hoisted to locals |
| 278–~900 | Cipher + helper core | 256-byte shuffled table, LCG byte generator (`fn`), encode/decode chains (`fn10..fn26`) |
| 907–934 | Env hardening | `env["print"] = env["error"] = env["tostring"] = fn21` (silencer) |
| 1082–1103 | `fn25` | response deserializer: `[len][2-char fields]…` → string array |
| 1150–1160 | Env marker | `getfenv()[tbl17] = v73` — table-keyed global, checked later (anti-tamper) |
| 1158 | Auth init | `GET {Host}/{region}/auth/{ScriptID}/init?t=…&v=…&k=…` |
| 1310 | Auth start | `GET {Host}/{region}/auth/start/{token}?t=…` |
| 1331–1388 | Challenge verify | 3 attempts, hash from session counters + `JobId`; reseeds `n26/n27/n28` |
| 1391–1560 | Payload closure | big local block, then `luraph_runtime1(v83, buffer.fromstring(…), tbl33, 199)()` |
| 1561–16095 | Visible payload | Steal-a-Brainrot trade bot: config tables via `v84[N]`, then main logic |

## 3. Fingerprinting layer

The first stage derives a per-executor, per-session identifier by abusing
`UserGameSettings` tutorial states as writable bits:

- Seeds an LCG (`1103515245`, `12345` constants) from `wait()` timing, then
  encodes 80 bits (16 iterations × 5) via `SetTutorialState("nil  nil  " .. n, bit)`,
  reading them back with `GetTutorialState` to build a 16-char session key.
- A parallel **timezone check** (`os.time(os.date("*t")) - os.time(os.date("!*t"))`)
  gates region selection; mismatch → `Kick("invalid timezone - send this
  screenshot to developer and Federal")`.
- `LocalizationService:GetCountryRegionForPlayerAsync` feeds the AU/host-table
  branch. Together these pick one of ~18 `*-roblox-auth.luarmor.net` hosts.

The companion `loadstring55.txt` is the same fingerprinting logic as a
**standalone signature canary** (`Path2D` control-point probes, attribute
connections, `GetTutorialState` sweeps) — it prints the marker
"Luarmor - Lua whitelist service … If you are seeing this, you know what not
to do :3". Seeing it in a dump identifies the source unambiguously.

## 4. Environment hardening and anti-tamper

Three independent systems, all cheap to detect statically:

1. **Global silencing** — `print`, `error`, `tostring` in `getfenv()` are
   replaced by `fn21` (no-op). Errors from the protected body never surface.
2. **Table-keyed env marker** — `getfenv()[tbl17] = v73` plants a value under a
   *table* key (impossible from plain source); later re-checked before auth
   continues. Env swap ⇒ marker lost ⇒ hang.
3. **Wall-clock PRNG guards** — after auth, `math.random` equivalents `n26`,
   `n27`, `n28` embed `if not (flag or n31 < os.clock() - 8) then … while true
   do end`. If the process runs >8 s behind the session clock (debugger,
   tracing harness), every subsequent random draw **deadlocks**. This is why
   behaviour-tracing a Luarmor file under our Luau harness stalls instead of
   erroring — it is by design, not a bug in the harness.

Payload-body traps also include bare `while v78 ~= tbl18[6] do end` /
`while true do end` loops on any failed precondition (`response == "err"`,
missing challenge, heartbeat TTL expiry `Heartbeat failure [0x01]`).

## 5. Auth protocol (as observed, static)

- **Init**: `{Host}/{region}/auth/{ScriptID}/init?t=<token>&v=<ScriptVersion>&k=<key>`
  where `<token>` concatenates ~10 hashed numeric fields (session counters,
  timezone deltas, PRNG outputs) through `fn10/fn13/fn16/fn17/fn26` chains.
- **Start**: `{Host}/{region}/auth/start/{v77[12]}?t=<token2>`.
- **Heartbeat**: `{Host}/{region}/auth/heartbeat?t=<token3>&s=<session>` with
  TTL-expiry kick paths.
- Transport: `syn.request` → `http_request` → `request` → `http.request`
  (executor-specific precedence), or `HttpGet` on some branches.
- **Response format** (`fn25`): flat string of 2-char chunks; first chunk =
  field count, then per field `[len][len × 2-char bytes]`. Result indexes used:
  `[1]`, `[5]`, `[7]` (PRNG reseed offsets), `[3]` (challenge hash vs
  counters+`JobId`), `[6]` (payload chunk `v83`), `[8]`, `[9]` (labels).
- Session keys are also bound to `game.JobId`, so captured responses do not
  replay across servers.

## 6. The Luraph handoff

After auth succeeds the loader calls, exactly once (line 1572):

```lua
luraph_runtime1(v83, buffer.fromstring("<~4.4 KB binary blob>"), tbl33, 199)()
```

- `luraph_runtime1` is **never defined in plaintext** in the client — it is
  planted by the paste-time loadstring stub (same place `ce_like_loadstring_fn`
  comes from). It is a Luraph VM runtime embedded in the bootstrap.
- `v83 = v81[6]` — the server-delivered chunk executed by that VM.
- The `buffer` blob + `tbl33` (16 seed bytes: `[8]=247, [16]=213, [15]=11,
  [6]=47, [7]=129, [14]=47, 175, [9]=152, [13]=8, [5]=65, [11]=49, [3]=30,
  [10]=208, 152, [12]=225, [4]=91` + integer `199`) decode the payload's
  constant table into the closure-local `v84` (declared at 1391, nilled at
  1556, populated by the VM call, consumed from 1561 onward).
- Consequence: Luarmor-protected scripts are **Luraph-virtualized only at the
  constant layer**, with keys partially delivered per-session by the auth
  server. The control flow of the payload itself is *not* virtualized.

## 7. Payload anatomy

The visible payload (lines 1561–16095) is a Steal-a-Brainrot trade bot:

- Config tables (`getgenv().SPECIAL_BRAINROTS`, `FALLBACK_BRAINROTS`,
  `FORCE_MUTATIONS`, trade-timing tables at 2400+) mix plaintext values with
  `v84[N]` placeholders (~40+ distinct sites).
- Main logic uses renamed-but-readable locals (`fn29…fn62`, `tbl19…tbl31`);
  heap-scan loops over `ReplicatedStorage.Shared.BrainrotAssets`,
  `SharedAnimals`, etc.
- Hardcoded exfil config inside the sample (standard IOC report, redacted):
  `getgenv().SPECIAL_TARGET = "<username>"` and
  `getgenv().SPECIAL_WEBHOOK_URL = "https://<worker>.workers.dev/d/alt/<id>"` —
  a Cloudflare-worker relay. Any corpus entry embedding a webhook relay is a
  candidate flag for the Safety Index regardless of deobfuscation status.

## 8. Static recoverability matrix

| Component | Recoverable statically? | Why |
|---|---|---|
| Detecting "Luarmor client" | ✅ trivially | §9 signatures |
| Loader vs payload split | ✅ | payload starts at the flagged local block / first `getgenv().` after the VM call |
| Payload control flow | ✅ | not virtualized; renamed locals only — existing `structure.py`/`tidy` passes apply |
| `v84[N]` constant values | ❌ | session-seeded via auth server + VM blob; no key material in file |
| `v83` (VM chunk) | ❌ | delivered per-session; `luraph_runtime1` implementation lives in the paste-time stub we do not have |
| Behaviour-tracing payload | ⚠️ limited | wall-clock guards deadlock >8 s; harness budgets trip traps |
| Stripping loader boilerplate | ✅ | loader region is additive; payload closure is self-contained |

## 9. Detection signatures (for `src/detect.js`)

High-signal, low-false-positive set (any 2 ⇒ Luarmor client):

1. `/luarmor\.net|Luarmor/i` within first 2 KB (hosts, kick prefix `[Luarmor]:`,
   signature banner `:3`).
2. `luraph_runtime1\s*\(` anywhere (unique global, single call site pattern).
3. `GetTutorialState("nil  nil  ` fingerprint loop string.
4. `getfenv()[` with a **table-typed key** (`getfenv()[tbl%d+] = `).
5. `writefile("luarmor-error-log.txt"` string.
6. `/-?[a-z]{1,3}\d-roblox-auth\.luarmor\.net/` host literal.

The sample is additionally `ce_like_loadstring_fn`-gated at line 1, and pairs
with a `loadstring55.txt` signature canary.

## 10. Pipeline implications

- Corpus classification: files matching §9 should be tagged `luarmor_client`,
  not fed to the v15 devirtualizer as-is (wasted cycles, guaranteed failures).
- A `--luarmor-split` pass can emit: `{ loader.lua, payload.lua, opaque.json }`
  where `opaque.json` lists `v84[N]` sites for later manual/dynamic filling.
- The payload half is ordinary (lightly renamed) Luau — existing cleanup passes
  are the right tools; no new devirtualization work is required for this layer.
- Full constant recovery would require a live authed session inside an
  executor; out of scope for a static toolchain by design (and out of scope of
  this project's goals).

## 11. Bootstrap chain (v4 loader stub, observed)

The public paste entry (`api.luarmor.net/files/v4/loaders/<md5>.lua`) is a
5-line, **unobfuscated** stub:

1. Sets global `_bsdata0` — 12 mixed entries: 8 numeric IDs (incl. 32-bit-ish
   values like `3117095690`, `1790607955`), two 39-byte raw binary blobs, and
   two ASCII-hex blobs (69 and 203 bytes decoded). No code, no plaintext —
   signing/key material consumed by the next stage.
2. Disk-cache check: `readfile("static_content_170926/init-<module>.lua")`
   (module id here: `f07dbcbe19a-sephal`); used if `#a > 2000`.
3. Otherwise `game:HttpGet("https://cdn.luarmor.net/v4_init_sephal.lua" ..
   (_ca920af6193 or ""))`, caches it, runs `loadstring(a)(<module-id>)`.

`_ca920af6193` is an optional suffix global (version pin set by hub wrappers).
**CDN gate**: fetching the init URL without the right suffix (or from a
non-executor client) returns a 327-byte trap that kicks
("Your executor is not supported…"). UA spoofing and arbitrary query suffixes
do NOT pass the gate (tested: synapse/ScriptWare/Krnl/Roblox UAs, `?v=`,
`?c=`, etc. — all 327 bytes). The real init is served per-executor-build.

Consequence for the chain: the real "sephal" init (stage 2, which defines
`ce_like_loadstring_fn` and `luraph_runtime1`) is best obtained from an
executor's disk cache (`static_content_170926/init-*.lua` in the executor
workspace) rather than the CDN. Once obtained, §6's "not in sample" caveat
about `luraph_runtime1` can be closed.

No key is required at any point of the *bootstrap*; keys only matter at the
client's `/auth/init` (§5), which requires a live executor session regardless.

## 12. Live sandbox results (sephal init, corrected + completed)

Stage 2 obtained from an executor cache (`init-f07dbcbe19a-sephal.lua`,
764 KB). File layout (all on one line after a 197-byte header comment):

1. `superflow_bytecode={"\136\221..."}` — 9.6 KB encrypted blob **as a
   global table assignment**. Its last element embeds a runtime concat with
   `_bsdata0[10]` — i.e. the blob table itself is keyed to the stub's
   handoff and the assignment order matters: `_bsdata0` must exist BEFORE
   the blob line executes.
2. `return setmetatable({[80]=unpack,[32]=tonumber,[31]=bit32.bxor,…},{}):TK()(…)`
   — a **Luraph v15 chunk** (detector: 0.80; letter-named superoperators,
   env-check closure returning `f2e2960fc4e18e910dcba7, "fa6607",
   e165cabf1c2f2445e90a9c`). It decrypts and interprets the blob.

**Correction of the earlier (Sep 28) diagnosis:** the "env-materialization
ordering" theory was wrong. The real causes of the `attempt to index nil
with 'sub'` crash, in order:

1. The extracted VM chunk had dropped the `superflow_bytecode` global, so
   the harness answered it with an ever-callable proxy (poisoned data).
2. The primed input assigned `_bsdata0` AFTER the blob line; the blob's
   embedded `_bsdata0[10]` concat read it too early.
3. A real envlog fidelity bug: script globals land in the env **facade**
   table (the nearly-empty table `getfenv()` hands out), not in GLOBALS.
   A script-side nil-out (`_bsdata0 = nil`, anti-dump) therefore fell
   through to GLOBALS, where the key had never been written, and the
   `__index` proxy answered a *function* for a global the script itself
   had removed. Fixed with `SEEN_GLOBALS` tracking on both the facade's
   `__newindex` and GLOBALS' metatable: seen-then-nil'd keys now read
   back as `nil`, exactly like real Luau.
4. Missing executor surface: `delfolder`, `syn` (type-checked as table!),
   and a canned-filesystem map so `readfile("static_content_170926/
   init-f07dbcbe19a-sephal.lua")` can answer with the real cached text
   (`CFG.readfile_map`; `isfile`/`isfolder` derive from it).

With those fixed, the input is assembled in stub order
(`_bsdata0` → `superflow_bytecode` → chunk with the module id passed as
vararg, mirroring the stub's `loadstring(a)(b)` fresh path) plus
`ldrupd8m = <raw init text>` (the stub sets this only on fresh downloads)
and a placeholder `script_key`. The bootstrap then **runs its real logic
in the sandbox**: task.watchdogs, a 159×288 ScreenGui/Frame loader window,
the full Path2D fingerprint canary (12 offline-engine answers), signal
probes, `isfile` cache probe, and finally the auth handshake below.

### The superflow auth request (fully captured)

```lua
local response = syn.request({
    Method = "GET",
    Url = "https://x.luarmor.net/a9b90889ea88d2a9cfaac"
        .. "?a=fa6607"           -- SKU/version marker (env-check constant)
        .. "&d=<203 hex>"        -- _bsdata0[7] verbatim (stub signing blob)
        .. "&b=<105 chars>"      -- computed 52-byte signature, see below
})
HttpService:JSONDecode(response.Body)
```

- `x.luarmor.net` is a new auth host, not in the §2 region list.
- `d` is byte-identical to `_bsdata0[7]`; `a` matches the chunk's embedded
  `"fa6607"` marker — both static.
- `b` is **computed at runtime** (105 chars ≙ 52 bytes + 1 nibble char) and
  matches no trivial derivation of `_bsdata0[2]`/`[10]` (XOR/add/concat)
  nor sha256/sha1/sha512 truncations of the blobs or the placeholder key —
  the derivation (and its inputs, e.g. `game.JobId`, hwid, `script_key`)
  lives inside the VM-interpreted superflow bytecode. Replaying the GET
  with a sandbox-computed `b` is answered by the server-side tripwire
  ("This loader code is outdated…", same family as the §11 CDN trap).

Failure ladder observed in-sandbox (each fixed check revealed the next):
`State294` (missing `ldrupd8m`/vararg) → `State848` ("Lrmsfail",
missing `script_key` / failed handshake) → both end in the CoreGui
"Loader Failed" ErrorPrompt loop + `LocalPlayer:Kick`.

## 13. Harness/tooling upgrades that made this possible

All generic, regression-protected (npm test 29/29 + golden green):

- envlog `SEEN_GLOBALS`: nil-out fidelity for script-removed globals
  (anti-dump patterns in Luarmor/Luraph chains).
- envlog canned filesystem: `CFG.readfile_map` + derived
  `isfile`/`isfolder` (cache-integrity checks are now answerable).
- envlog executor surface: `E.delfolder`, `E.syn = {request = …}` (typed
  table, routed through the recorded request path).
- harness.js `luaValue`: plain-object CFG values serialize correctly
  (keys quoted) — previously produced `[object Object]`.
- `CFG.trace_globals`: per-key global read/write/nil-out logging with
  caller `debug.info` + traceback (used to pin down every bug above).

Remaining gap (future wave): the superflow *program* itself is VM
bytecode, never `loadstring`ed as source, so the chunk-capture pipeline
never sees it. Recovering `ce_like_loadstring_fn` / `luraph_runtime1`
and the `b` signature derivation requires interpreting the 9.6 KB blob
— either via the envlog optrace ring (`E.__TR`, (loop, pc, op) log) to
reconstruct its control flow, or by emulating the v15 dispatch loop
directly. The outer two layers (stub, VM chunk) are fully mapped today.

Analysis artifacts: `gdrive_in/Luarmor/stub/` — `loader.lua` (stub),
`sephal_init.lua` (CDN trap), `init-f07dbcbe19a-sephal.lua` (stage 2),
`superflow_stmt.lua` + `vm_chunk_line.lua` (split), `sephal_v3.lua`
(correctly ordered + primed input), `sephal_full.lua` (intermediate),
`sephal_devirt.lua` (outer devirt), `/tmp/sephal_v5.raw.txt` (final
behaviour trace incl. the auth request).

## 14. The live chain cracked: loader rotation, session acceptance, and the tool

Session of Sep 28 (continued). The "outdated" tripwire from section 12 is now
understood and beaten, and the whole chain is automated in
`tools/luarmor_fetch.py`.

### The loader file rotates; stale blobs are the tripwire

- The v4 loader files (`api.luarmor.net/files/v4/loaders/<md5>.lua`) are
  **public and ungated** (plain HTTP GET works). They rotate: the same URL
  fetched twice ~50 minutes apart had different `_bsdata0` content (first
  entry `339253403` -> `663777057`). The blobs are short-lived signing data.
- The auth server validates `d`/`b` against the CURRENT rotation. A stale
  loader's handshake gets the plain-text "This loader code is outdated. You
  must use the loadstring..." answer; a fresh loader's handshake -- with the
  sandbox-computed `b` -- is **ACCEPTED**.
- So `x.luarmor.net` never rejected our sandbox because it is a sandbox: it
  rejected the stale signing material. The sandbox-built signature is valid.

### The accepted response

- Shape: a JSON array holding one hex string, e.g.
  `["d8e55380558032852ae6fc64f70e3fe26..."]` (~310 bytes binary). Not plain
  text, not the tripwire -- the next protocol stage, encrypted.
- The response is **keyed to a one-time nonce inside `b`**: replaying the
  exact same URL a second time returns the "outdated" tripwire (nonce
  burned), and a canned replay into a fresh sandbox run fails in the
  response decrypt (`sub` on nil) because the sandbox computes a different
  nonce. `b` is 103 hex chars; the 97-char prefix is fully deterministic
  under `CFG.time_pin`, the last 6 chars (3 bytes) still vary per process
  even with clocks, `math.random`, `Random` seeds, wait() timestamps and
  `collectgarbage`/`gcinfo` pinned, and with ASLR disabled. The remaining
  nonce source is inside the superflow VM (optrace/dispatch-emulation wave).

### Static devirt status of the sephal chunk

- The full pipeline now runs on the primed input end to end (detection
  tolerates loader prelude lines before `return setmetatable({`; the
  node->python bridge passes object-valued CFG; `--cfg-json` feeds
  readfile_map/http_map). The outer program (byte decoder, `_bsdata0`
  validation, module-id setup) lifts; the walk stops at the bootstrap
  closure with `closure of non-proto` (VM mode 239 pc 49076, op 77): that
  maker call passes the proto through the maker's own upvalue (`self`),
  not through the argument list, so the walker cannot bind it. The
  bootstrap logic therefore remains VM-interpreted; its behaviour is fully
  captured by the trace (GUI, canary, cache probe, handshake, State294/848
  ladder).

### The tool

`tools/luarmor_fetch.py` runs the chain end to end:

1. fetch/parse the public loader stub (`--loader-url` recommended: the
   rotation makes saved stubs stale within the hour);
2. obtain the init (`--init` from an executor cache; the CDN gate still
   serves the real file only to executor clients -- browsers get an
   "Unauthorized" page, curl gets the 327-byte executor trap, no-UA
   requests get a Cloudflare worker error 1101);
3. build the stub-faithful input and run the sandbox bootstrap;
4. replay the handshake live and classify the answer
   (`session-response` / `stale-loader` / `executor-trap`);
5. canned-replay the response into the sandbox (works once the nonce
   source is pinned; the limitation is reported, not hidden);
6. hand any client file to `tools/luarmor_probe.py` for the
   loader/payload split + IOC scan.

Unit tests: `test/luarmor_fetch_test.py` (stub/blob/init parsing, input
building, response classification, handshake extraction).

## 15. The superflow source opens: maker-params fix, b stability, and the two-phase protocol

Session of Sep 28 (continued). Three results, two blockers mapped precisely.

### The op-77/mode-239 walker barrier is broken

`_maker_params` (core/obfuscators/luraph_v15/vmmap.py) inferred the closure
maker's proto parameter by self-index patterns (`P[P[k]]`) on the parameter
itself. The sephal VM's factories read the proto through *alias locals*
(`local Y = r` / `local d,K,... = r`, then `Y[Y[10]]...`), so the heuristic
found nothing and fell back to param 1; the real layout of all four factories
is `function(L,o,o,o,r,...)` — proto at index 4, upvalue list at 3 (the
mode-239 closure op calls `L[W[W[1]]](L, nil, nil, j, W)`). The fix resolves
direct param aliases and, when no direct self-index count exists, selects the
proto param from alias-resolved counts. Effect on the primed sephal input:
devirt walks 15 functions (was 2) and lifts **9,333 lines** of the superflow
bootstrap — env-check constants (`fa6607`), the FileSystem/canary checks and
their error strings, the request-building logic. Remaining gaps: 14 unlifted
blocks (`symbolic next pc/mode`, `unexplored successor`) where nested-function
protos read shared buffers the runtime deserializer materializes lazily; those
need the force-decode path extended to non-lazy (metatable-less) tables.

### b is process-stable; the handshake is accepted live

With `CFG.time_pin` set, the 103-hex signature b is **byte-identical across
repeated runs inside one luau process** (serve mode, 3 starts -> 6 identical
captures) while varying per process. The per-process nonce therefore comes
from state fixed at process init (allocation addresses survived full env/cwd/
argv pinning: two separate runs with identical env, cwd and argv still differ
in the last 6 chars). Consequence: a b built in-process can be replayed live
from the driver, and the server accepts it (fresh loader; rotation still
~50 min).

### The two-phase protocol and the tamper snapshot

`tools/luarmor_two_phase.py` runs: serve process -> phase 1 (build handshake,
capture b) -> live replay (classify) -> inject the session response as a
canned http_map into the SAME process (new serve "http" mode, JSON payload,
wildcard keys) -> phase 2 (same process recomputes the identical b, hits the
canned answer, decrypts in-sandbox). Phase 2 still ends in State848: the
bootstrap's anti-tamper restores its own snapshot of the harness config state
during the run — every injected field (CFG.http_map, CHAIN fields, proxy
upvalue stores behind them) reads back nil by request time, while fields
present in phase 1 (CFG.readfile_map, time_pin) survive. A write-traceback
watchdog on the injected map never fires: the wipe is not an assignment
through the table. Candidate paths: (a) extend the lift to the nested protos
(force-decode for metatable-less tables) and read the response cipher + nonce
derivation statically out of the recovered source; (b) run the phase-2
handshake through a channel the tamper whitelists.

### Path (b) WORKS: the readfile_map channel closes the loop

The tamper's snapshot is **shallow for table fields**: `CFG.readfile_map`
(the table) stays shared, so the handler can serve content planted in it, but
keys *added after phase 1* are deleted by a key-diff restore — therefore the
response key is **planted at build time** (`__lrm_session_response =
"PENDING"`) and only its *value* is overwritten when phase 2 starts (serve
"start" now accepts the raw body/JSON payload as its `req` argument).

End-to-end result (tools/luarmor_two_phase.py, fresh loader): phase 1 builds
b; the live handshake is ACCEPTED; the session response is planted; phase 2
recomputes the identical b, the handler serves the real ~630-byte response
via the readfile_map channel, the script JSON-decodes it and **runs the
session decrypt in-sandbox** — then issues a SECOND handshake (protocol
retry) and kicks. No State848, no harness crash on the first response.

The remaining kick is by design, not a gap: the session response is keyed to
the **real script key** (`LRM_SCRIPT_KEY` env for luarmor_two_phase.py);
with the placeholder key the decrypted session is garbage, the bootstrap
soft-fails, retries the handshake once and kicks. With a valid script key the
same run loads the client chunk. Fixed en route: the runtime require rejects
long-bracket modules that luau-ast accepts (resp modules use quoted+escaped
strings), and the syn.request handler guards userdata Urls before
string-matching.

## 15. The real-script-key wave (Sep 29): in-run live fetch, fingerprint parity, and the State848 frontier

With a real script key supplied, the whole chain advanced several steps. The
pieces below are all in `tools/luarmor_two_phase.py` + `runtime/envlog.luau`.

### The recovered Luraph environment fingerprint

The bootstrap's anti-tamper includes a **fingerprint script** (recovered
externally, kept at `luarmor_run_key/fingerprint_input.lua` in the workspace):
cclosure checks on every builtin (`string.pack`, `task.*`, `debug.*`...),
`"The metatable is locked"` metatables on userdata (Instance/Vector3/Random/
Enum/EnumItem...), HttpService/RunService shape, `Random:Clone()` stream
semantics, `utf8.nfcnormalize/nfdnormalize`, and ~100 bytes of **Path2D
curve math** over per-run-randomized control points (frame size varies per
run, e.g. 159x288 vs 170x147). Its 148 output bytes feed the handshake.
envlog passes all of it end-to-end (`FINGERPRINT-OK bytes=148`); one fix was
required: RunService flag methods must also tolerate `rs.IsStudio()` dot
calls (the recovered copy calls them with `.`).

### Cross-run response replay is impossible by construction

Phase 1 -> capture handshake URL -> live replay -> plant -> re-run in the
same process does NOT work: `d` is byte-stable across runs but `b` carries a
**24-bit allocation-derived nonce in its tail** that shifts whenever the
driver plants anything (module compiles, plant allocations). A response
decrypted under one nonce is garbage under the next. Verified byte-level:
the planted URL and the requested URL matched in length and `d` but diverged
in the nonce tail.

### The fix: in-run live fetch (serve modes "plant"/"resume"/"plantdbg")

The request handlers now **suspend the run** instead of failing: for a
luarmor URL with no canned answer, the handler prints
`NEEDFETCH <url>` + flush padding and `coroutine.yield("__LRMRES " .. url)`;
`runMain` stashes the runner thread (`urls.__lrm_runner`) and returns
("fetchwait"); the Python driver fetches the URL **live**, plants the
response via serve mode "plant" (native-table payload -- no JSON decoder in
the path, any size), and calls serve mode "resume", which resumes the exact
thread. Same process = same nonce = the response decrypts. Plant entries
accumulate in `urls.__lrm_plant` (a module local the anti-tamper snapshot
cannot reach; string keys invisible to the ipairs dump; a dedicated
top-level local would break the 200-register compile limit -- observed).
The legacy readfile_map plant is obsolete: a build-time "PENDING" placeholder
pre-empts the live path and (with a real key) the tamper's value restore
brings it back mid-run (observed: response 1 returned the 7-byte placeholder).

With that loop the full protocol runs in ONE process: handshake -> live
630-byte session-response -> decrypt -> ... and the time_pin must track the
loader: `_bsdata0` carries a ~now epoch build stamp that rotates with the
loader file (the tool now derives `time_pin` from it; a 10-hour stale pin was
another reject candidate).

### Where it stands: State848

With the real key the run still ends in the baked-in fail state UI
("Loader Failed" / `" Lrmsfail, ... Error: State848"`) + Kick, followed by the
KNOWN nested-proto deserializer crash (`Script:14` multiply-on-nil -- the
same crash the devirt's own no-session run reproduces; the `proto[proto[3]]`
lazy-buffer gap from section 13). Findings that bound the problem:

- The fail-state message is a **literal** (not `"State" .. n`), and the
  decrypted verdict never reaches `HttpService:JSONDecode` -- the verdict is
  parsed inside the VM with no library calls: the call-log ring (armed after
  the fingerprint; the frozen-stdlib swap + string-metatable rebind in
  `CHAIN.armCallLog` now works) records **zero** string/table/bit32/buffer
  calls from the decrypt, i.e. the cipher is pure VM arithmetic on captured
  locals. Library interception cannot see the plaintext.
- The 9,333-line lift (reproduced: `node deob.js
  gdrive_in/Luarmor/stub/sephal_v4.lua --cfg-json @/tmp/sephal_cfg.json -o
  sephal_lift_v4.lua`) covers the bootstrap's outer logic; the session
  handling lives in the nested protos behind `luraph_runtime1(tbl7[...],
  buffer.fromstring("..."))` calls.

Next wave (unchanged from section 13's plan, now with better tooling): lift
the nested protos (force-decode for metatable-less tracked tables) to read
the verdict checks + the response cipher statically; alternatively diff a
real-executor run's `d`/fingerprint bytes against the sandbox's to find what
the server rejects.
