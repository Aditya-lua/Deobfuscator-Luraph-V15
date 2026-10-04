'use strict';

// In-memory job queue, concurrency gate, and per-IP rate limiter.
//
// Deliberately in-memory and single-process: this is a small self-hosted tool,
// not a cluster. If you scale to multiple instances, move the store and rate
// limiter to Redis -- the interface here is intentionally small.

const config = require('../config');
const { runDeob, newJobId, cleanupJob } = require('./runner');

// --- job store ------------------------------------------------------------
// id -> { id, status, createdAt, finishedAt, detect, error, outputPath, name }
const jobs = new Map();

// --- rate limiter (token bucket per IP) -----------------------------------
const buckets = new Map(); // ip -> { count, resetAt }

function rateCheck(ip) {
  const now = Date.now();
  let b = buckets.get(ip);
  if (!b || now >= b.resetAt) {
    b = { count: 0, resetAt: now + config.RATE_WINDOW_MS };
    buckets.set(ip, b);
  }
  if (b.count >= config.RATE_MAX) {
    return { ok: false, retryAfterMs: b.resetAt - now };
  }
  b.count += 1;
  return { ok: true };
}

// --- concurrency gate -----------------------------------------------------
let active = 0;
const waiting = []; // queued job ids

function pump() {
  while (active < config.MAX_CONCURRENT_JOBS && waiting.length > 0) {
    const id = waiting.shift();
    const job = jobs.get(id);
    if (!job || job.status !== 'queued') continue;
    active += 1;
    job.status = 'running';
    job.startedAt = Date.now();
    runDeob(id, job.name, job.buffer)
      .then((res) => {
        job.buffer = null; // free the upload from memory asap
        if (res.ok) {
          job.status = 'done';
          job.detect = res.detect;
          job.outputPath = res.output;
        } else {
          job.status = 'error';
          job.error = res.timedOut ? 'Deobfuscation timed out.' : (res.error || 'Deobfuscation failed.');
          job.detail = tailLines(res.stderr, 12);
        }
      })
      .catch((err) => {
        job.buffer = null;
        job.status = 'error';
        job.error = 'Internal error: ' + err.message;
      })
      .finally(() => {
        job.finishedAt = Date.now();
        active -= 1;
        scheduleCleanup(id);
        pump();
      });
  }
}

function tailLines(s, n) {
  if (!s) return '';
  const lines = s.trim().split('\n');
  return lines.slice(-n).join('\n');
}

function scheduleCleanup(id) {
  setTimeout(() => {
    const job = jobs.get(id);
    if (job) { cleanupJob(id); jobs.delete(id); }
  }, config.RESULT_TTL_MS).unref();
}

// Enqueue a new job. Returns { id } or { error, status }.
function enqueue({ ip, name, buffer }) {
  const rl = rateCheck(ip);
  if (!rl.ok) {
    return { error: 'Rate limit reached. Try again later.', status: 429, retryAfterMs: rl.retryAfterMs };
  }
  if (waiting.length >= config.MAX_QUEUE_LENGTH) {
    return { error: 'Server is busy, the queue is full. Try again shortly.', status: 503 };
  }
  const id = newJobId();
  jobs.set(id, {
    id, name, buffer,
    status: 'queued',
    createdAt: Date.now(),
    queuePosition: waiting.length + 1,
  });
  waiting.push(id);
  pump();
  return { id };
}

// Enqueue a capture that arrived over the (token-authenticated) executor
// bridge. No per-IP rate limit -- the token is the authorization -- but the
// queue-length cap still applies so a flood of captures can't exhaust memory.
function enqueueTrusted({ name, buffer }) {
  if (waiting.length >= config.MAX_QUEUE_LENGTH) {
    return { error: 'Queue full.', status: 503 };
  }
  const id = newJobId();
  jobs.set(id, { id, name, buffer, status: 'queued', createdAt: Date.now() });
  waiting.push(id);
  pump();
  return { id };
}

function get(id) { return jobs.get(id); }

function publicView(job) {
  if (!job) return null;
  const v = {
    id: job.id,
    status: job.status,
    createdAt: job.createdAt,
  };
  if (job.status === 'queued') v.queuePosition = waiting.indexOf(job.id) + 1;
  if (job.status === 'done') v.detect = job.detect;
  if (job.status === 'error') { v.error = job.error; v.detail = job.detail; }
  return v;
}

function stats() {
  return { active, queued: waiting.length, total: jobs.size };
}

module.exports = { enqueue, enqueueTrusted, get, publicView, stats };
