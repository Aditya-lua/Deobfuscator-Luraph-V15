'use strict';

// Central configuration. Everything is overridable by environment variable so
// the same image can be tuned per deployment without a rebuild. Keep the
// defaults conservative: this service executes untrusted uploaded scripts in a
// sandbox, so limits are a safety feature, not just performance tuning.

const path = require('path');

function int(name, def) {
  const v = parseInt(process.env[name], 10);
  return Number.isFinite(v) ? v : def;
}

const REPO_ROOT = path.resolve(__dirname, '..', '..');

module.exports = {
  REPO_ROOT,
  DEOB_ENTRY: path.join(REPO_ROOT, 'deob.js'),

  PORT: int('PORT', 8080),
  // Lock CORS to this origin in production (e.g. https://deob.example.com).
  // "*" is convenient for local dev but should be set for a public deploy.
  CORS_ORIGIN: process.env.CORS_ORIGIN || '*',

  // Upload / job limits ------------------------------------------------------
  MAX_UPLOAD_BYTES: int('MAX_UPLOAD_BYTES', 3 * 1024 * 1024), // 3 MB
  // How long one deobfuscation may run (wall clock) before it is force-killed.
  JOB_TIMEOUT_MS: int('JOB_TIMEOUT_MS', 180 * 1000),
  // Address-space cap for the worker process tree (KB, enforced via ulimit -v).
  // 0 disables. Python + luau on a large payload can legitimately use ~1.5 GB.
  JOB_MEM_KB: int('JOB_MEM_KB', 2 * 1024 * 1024), // 2 GB
  // CPU-seconds cap for the worker tree (ulimit -t). 0 disables.
  JOB_CPU_SECONDS: int('JOB_CPU_SECONDS', 240),
  // Per-lift codegen/structure budget handed to the engine (see backend.py).
  STACK_BUDGET_SECONDS: int('STACK_BUDGET_SECONDS', 150),

  // Concurrency / queue ------------------------------------------------------
  MAX_CONCURRENT_JOBS: int('MAX_CONCURRENT_JOBS', 2),
  MAX_QUEUE_LENGTH: int('MAX_QUEUE_LENGTH', 20),

  // Per-IP rate limit: RATE_MAX jobs per RATE_WINDOW_MS.
  RATE_MAX: int('RATE_MAX', 6),
  RATE_WINDOW_MS: int('RATE_WINDOW_MS', 10 * 60 * 1000), // 10 min

  // Lifecycle ----------------------------------------------------------------
  // Outputs are kept this long for download, then deleted. Uploads are deleted
  // as soon as the job finishes.
  RESULT_TTL_MS: int('RESULT_TTL_MS', 15 * 60 * 1000),
  WORK_ROOT: process.env.WORK_ROOT || path.join(require('os').tmpdir(), 'luraph-web'),

  PYTHON_BIN: process.env.PYTHON_BIN || 'python3',

  // Executor bridge (Milestone 1). Disabled unless BRIDGE_TOKEN is set, so a
  // default public deploy never exposes an open code-serving / ingest surface.
  // The token gates /bridge/boot (serves the tracer) and /bridge/ingest.
  BRIDGE_TOKEN: process.env.BRIDGE_TOKEN || '',
  // Public base URL baked into the served tracer (so the executor posts back to
  // the right host). Defaults to the request's own host when unset.
  BRIDGE_PUBLIC_URL: process.env.BRIDGE_PUBLIC_URL || '',
  // Largest single captured stage the bridge will reassemble and deobfuscate.
  BRIDGE_MAX_BYTES: int('BRIDGE_MAX_BYTES', 12 * 1024 * 1024), // 12 MB
  // How long a bridge session (and its captures) is retained.
  BRIDGE_SESSION_TTL_MS: int('BRIDGE_SESSION_TTL_MS', 60 * 60 * 1000), // 1 h
};
