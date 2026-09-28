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
