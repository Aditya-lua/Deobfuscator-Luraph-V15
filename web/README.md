# Luraph Deobfuscator — Web App

A browser front-end and HTTP API around the Luraph v14.7–v15 deobfuscation
engine. Upload a protected `.lua`/`.luau`/`.txt` file, the version is detected
in your browser, and the server recovers readable source in a sandbox.

```
web/
  backend/           Express API + job runner + safety layer
    server.js        routes, CORS, static hosting
    config.js        all limits (env-overridable)
    lib/runner.js    spawns deob.js with ulimit + timeout, isolated temp dir
    lib/queue.js     concurrency gate, per-IP rate limit, TTL job store
  public/            static front-end (clean dev-tool UI, all client-side)
  Dockerfile         node + python3 + prebuilt bin/luau
  docker-compose.yml single-host deployment with safety limits
```

## Run it

### Docker (recommended — portable to any host)

Build from the **repo root** (the image needs the engine + `bin/luau`):

```bash
docker build -f web/Dockerfile -t luraph-deob .
docker run -p 8080:8080 luraph-deob
# open http://localhost:8080
```

Or with compose (adds resource/safety limits):

```bash
docker compose -f web/docker-compose.yml up --build
```

### Without Docker (local dev)

Needs Node 18+ and Python 3.10+, with `bin/luau` present (ships prebuilt;
rebuild with `python3 build_luau.py` if needed).

```bash
cd web
npm install
npm start          # http://localhost:8080
```

## API

| Method | Path                     | Purpose                                             |
|--------|--------------------------|-----------------------------------------------------|
| POST   | `/api/detect`            | Pure-JS version detection (no execution). `file` field. |
| POST   | `/api/deobfuscate`       | Enqueue a job. `file` field. Returns `{ id }` (202). |
| GET    | `/api/job/:id`           | Job status: `queued` / `running` / `done` / `error`. |
| GET    | `/api/job/:id/result`    | Inline result text (capped at 1 MB) for the viewer. |
| GET    | `/api/job/:id/download`  | Full deobfuscated file download.                    |
| GET    | `/api/health`            | Liveness + queue stats.                             |

## Configuration (env vars)

| Var | Default | Meaning |
|-----|---------|---------|
| `PORT` | `8080` | Listen port |
| `CORS_ORIGIN` | `*` | **Set to your site origin in production** |
| `MAX_UPLOAD_BYTES` | `3145728` | Max upload size (3 MB) |
| `JOB_TIMEOUT_MS` | `180000` | Wall-clock cap per job |
| `JOB_MEM_KB` | `2097152` | `ulimit -v` for the worker tree (2 GB) |
| `JOB_CPU_SECONDS` | `240` | `ulimit -t` for the worker tree |
| `STACK_BUDGET_SECONDS` | `150` | Per-lift budget (oversized functions fall back to a trace) |
| `MAX_CONCURRENT_JOBS` | `2` | Simultaneous deobfuscations |
| `MAX_QUEUE_LENGTH` | `20` | Rejects new jobs past this |
| `RATE_MAX` / `RATE_WINDOW_MS` | `6` / `600000` | Per-IP rate limit |
| `RESULT_TTL_MS` | `900000` | How long a result is downloadable before deletion |

## Security — read before exposing this publicly

This service **executes the uploaded script** in the `luau` sandbox to trace
its behaviour. Treat every upload as hostile. Defense in depth:

1. **Sandboxed runtime** — `bin/luau` has no `io`/`os`; `runtime/envlog.luau`
   stubs `HttpGet`, remotes and file APIs. This is the first line.
2. **Per-job isolation** — each run is a short-lived subprocess in its own temp
   dir, its own process group (killed as a unit on timeout), with `ulimit`
   caps on address space and CPU. Uploads are deleted the moment the job ends;
   outputs expire on a TTL.
3. **Throughput limits** — upload-size cap, per-IP rate limit, global
   concurrency cap with a bounded queue.
4. **Container hardening** (compose defaults) — `read_only` root FS with a
   `tmpfs` scratch, `no-new-privileges`, `pids_limit`, `mem_limit`, `cpus`.
5. **No outbound internet needed** — the engine never has to reach the network.
   **Block egress** from the container at the host/orchestrator level (a Docker
   network with no NAT, a firewall rule, or a platform egress policy) so a
   payload that finds a gap still can't phone home. Also set `CORS_ORIGIN`.

For a public deploy, also put it behind a reverse proxy with TLS and an
additional network-level rate limit.

## Deploy to Render (Blueprint, recommended)

A ready `render.yaml` Blueprint lives at the repo root — it builds
`web/Dockerfile`, sets the health check, and configures all limits.

**One-click:**

[![Deploy to Render](https://render.com/images/deploy-to-render-button.svg)](https://render.com/deploy?repo=https://github.com/Aditya-lua/Deobfuscator-Luraph-V15)

**Or manually:**

1. Render dashboard → **New → Blueprint**.
2. Connect GitHub (one-time authorization) and pick
   `Aditya-lua/Deobfuscator-Luraph-V15`.
3. **Select the branch `ccr-13a7a689-lioqfx`** (that's where `render.yaml` and
   the web app currently live) and **Apply**.

Render reads `render.yaml`, builds the image, and gives you a public
`*.onrender.com` URL. Health check is `/api/health`; `PORT` is injected
automatically. First build takes a few minutes (it installs Python and copies
the engine).

Notes:
- The Blueprint defaults to the **2 GB "standard"** instance — the engine can
  use ~1.5 GB on large payloads. A 512 MB free/starter instance works for
  smaller scripts if you also set `JOB_MEM_KB` to ~`400000`.
- After the service is up, set `CORS_ORIGIN` to your real origin, and add an
  egress restriction if your plan allows it.
- Once you merge the web app into your default branch, change `branch:` in
  `render.yaml` (and the Blueprint) to that branch.

## Other deploy targets (all Docker-based)
- **Railway** — new service from repo, Docker build; set the Dockerfile path
  and env vars. Railway injects `PORT`.
- **Fly.io** — `fly launch --dockerfile web/Dockerfile`; add a `[[services]]`
  health check on `/api/health` and set VM memory ≥ 2 GB. Restrict egress with
  Fly's network policy.
- **Bare VPS** — `docker compose -f web/docker-compose.yml up -d` behind nginx
  (TLS + proxy_pass to `:8080`). Keep the egress firewall rule.
