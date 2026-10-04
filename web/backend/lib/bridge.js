'use strict';

// Executor bridge collector (Milestone 1).
//
// The Delta tracer runs the target script in the user's real, key-redeemed
// session, hooks loadstring / HttpGet / request to capture each real stage,
// and streams the captures here in base64 chunks. This module reassembles the
// chunks, hands each completed stage to the deobfuscation queue, and exposes
// the per-session results. Token-authenticated; in-memory and ephemeral.

const crypto = require('crypto');
const config = require('../config');
const queue = require('./queue');

// sid -> { createdAt, captures: Map(capId -> capture), pending: Map(capId -> {seq..}) }
const sessions = new Map();

function tokenOk(tok) {
  const want = config.BRIDGE_TOKEN;
  if (!want) return false; // bridge disabled when no token configured
  if (typeof tok !== 'string' || tok.length !== want.length) return false;
  // constant-time compare
  return crypto.timingSafeEqual(Buffer.from(tok), Buffer.from(want));
}

function enabled() { return !!config.BRIDGE_TOKEN; }

function newSid() { return crypto.randomBytes(8).toString('hex'); }

function getSession(sid, create) {
  let s = sessions.get(sid);
  if (!s && create) {
    s = { createdAt: Date.now(), captures: new Map(), pending: new Map() };
    sessions.set(sid, s);
    setTimeout(() => sessions.delete(sid), config.BRIDGE_SESSION_TTL_MS).unref();
  }
  return s;
}

// A capture is a de-wrapped stage the tracer saw (a loadstring'd chunk, an
// HttpGet/request body, or a note). Scripts are auto-deobfuscated.
function looksLikeScript(kind) {
  return kind === 'loadstring' || kind === 'httpget' || kind === 'request';
}

// Ingest one chunk. Returns { ok } or { error, status }.
function ingest(body) {
  const { sid, cap, kind = 'loadstring', url = '', seq, total, data } = body || {};
  if (!sid || !cap || typeof seq !== 'number' || typeof total !== 'number' || typeof data !== 'string') {
    return { error: 'Malformed chunk.', status: 400 };
  }
  if (total < 1 || total > 4096 || seq < 0 || seq >= total) {
    return { error: 'Bad chunk index.', status: 400 };
  }
  const s = getSession(sid, true);
  if (s.captures.has(cap)) return { ok: true, duplicate: true }; // already assembled

  let p = s.pending.get(cap);
  if (!p) {
    p = { kind, url, total, chunks: new Array(total), have: 0, bytes: 0 };
    s.pending.set(cap, p);
  }
  if (p.chunks[seq] === undefined) {
    let buf;
    try { buf = Buffer.from(data, 'base64'); }
    catch { return { error: 'Bad base64.', status: 400 }; }
    p.bytes += buf.length;
    if (p.bytes > config.BRIDGE_MAX_BYTES) {
      s.pending.delete(cap);
      return { error: 'Capture exceeds size limit.', status: 413 };
    }
    p.chunks[seq] = buf;
    p.have += 1;
  }

  if (p.have === p.total) {
    s.pending.delete(cap);
    const full = Buffer.concat(p.chunks);
    const capture = { cap, kind: p.kind, url: p.url, bytes: full.length, at: Date.now(), jobId: null, skipped: false };
    s.captures.set(cap, capture);
    if (looksLikeScript(p.kind) && full.length > 0) {
      const name = (p.url && p.url.split('/').pop()) || (p.kind + '.lua');
      const r = queue.enqueueTrusted({ name: name.slice(0, 80) || 'stage.lua', buffer: full });
      if (r.id) capture.jobId = r.id; else capture.skipped = true;
    } else {
      capture.skipped = true;
    }
    return { ok: true, assembled: true, cap, jobId: capture.jobId };
  }
  return { ok: true, received: p.have, total: p.total };
}

function result(sid) {
  const s = sessions.get(sid);
  if (!s) return null;
  const captures = [];
  for (const c of s.captures.values()) {
    const view = { cap: c.cap, kind: c.kind, url: c.url, bytes: c.bytes, at: c.at };
    if (c.jobId) {
      const job = queue.get(c.jobId);
      view.status = job ? job.status : 'expired';
      if (job && job.status === 'done') {
        view.detect = job.detect;
        view.jobId = c.jobId; // download via /api/job/:id/download
      }
      if (job && job.status === 'error') view.error = job.error;
    } else {
      view.status = 'skipped';
    }
    captures.push(view);
  }
  const pending = [];
  for (const [cap, p] of s.pending) pending.push({ cap, kind: p.kind, url: p.url, have: p.have, total: p.total });
  return { sid, createdAt: s.createdAt, captures, pending };
}

module.exports = { tokenOk, enabled, newSid, ingest, result };
