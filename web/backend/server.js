'use strict';

const express = require('express');
const multer = require('multer');
const fs = require('fs');
const path = require('path');
const config = require('./config');
const queue = require('./lib/queue');

// Reuse the engine's real detector so the server and the CLI never disagree.
const detector = require(path.join(config.REPO_ROOT, 'src', 'detect'));

const app = express();
app.disable('x-powered-by');
app.set('trust proxy', true); // so req.ip is the client behind a proxy/CDN

// --- security + CORS headers ----------------------------------------------
app.use((req, res, next) => {
  res.setHeader('Access-Control-Allow-Origin', config.CORS_ORIGIN);
  res.setHeader('Access-Control-Allow-Methods', 'GET,POST,OPTIONS');
  res.setHeader('Access-Control-Allow-Headers', 'Content-Type');
  res.setHeader('X-Content-Type-Options', 'nosniff');
  res.setHeader('Referrer-Policy', 'no-referrer');
  if (req.method === 'OPTIONS') return res.sendStatus(204);
  next();
});

const upload = multer({
  storage: multer.memoryStorage(),
  limits: { fileSize: config.MAX_UPLOAD_BYTES, files: 1 },
});

function clientIp(req) {
  return (req.ip || req.connection.remoteAddress || 'unknown').replace(/^::ffff:/, '');
}

// --- API ------------------------------------------------------------------

app.get('/api/health', (req, res) => {
  res.json({ ok: true, ...queue.stats() });
});

// Pure-JS detection: no sandbox execution, so it is safe to run synchronously
// and without rate limiting. (The browser also does this client-side; this
// endpoint is the authoritative mirror.)
app.post('/api/detect', upload.single('file'), (req, res) => {
  if (!req.file) return res.status(400).json({ error: 'No file uploaded (field "file").' });
  const source = req.file.buffer.toString('latin1');
  try {
    const { plugin, confidence } = detector.detect(source);
    res.json({ name: plugin.name, label: plugin.label, confidence });
  } catch (err) {
    res.status(500).json({ error: 'Detection failed: ' + err.message });
  }
});

// Full deobfuscation: executes the payload, so it is rate-limited and queued.
app.post('/api/deobfuscate', upload.single('file'), (req, res) => {
  if (!req.file) return res.status(400).json({ error: 'No file uploaded (field "file").' });
  const r = queue.enqueue({
    ip: clientIp(req),
    name: req.file.originalname || 'input.lua',
    buffer: req.file.buffer,
  });
  if (r.error) {
    if (r.retryAfterMs) res.setHeader('Retry-After', Math.ceil(r.retryAfterMs / 1000));
    return res.status(r.status || 400).json({ error: r.error });
  }
  res.status(202).json({ id: r.id });
});

app.get('/api/job/:id', (req, res) => {
  const view = queue.publicView(queue.get(req.params.id));
  if (!view) return res.status(404).json({ error: 'Job not found or expired.' });
  res.json(view);
});

app.get('/api/job/:id/download', (req, res) => {
  const job = queue.get(req.params.id);
  if (!job || job.status !== 'done' || !job.outputPath || !fs.existsSync(job.outputPath)) {
    return res.status(404).json({ error: 'Result not available (not finished, or expired).' });
  }
  res.setHeader('Content-Type', 'text/plain; charset=utf-8');
  res.setHeader('Content-Disposition', 'attachment; filename="deobfuscated.luau"');
  fs.createReadStream(job.outputPath).pipe(res);
});

// Inline result (for the in-page viewer), capped so a huge lift can't blow up
// the browser; the download endpoint always has the full file.
app.get('/api/job/:id/result', (req, res) => {
  const job = queue.get(req.params.id);
  if (!job || job.status !== 'done' || !job.outputPath || !fs.existsSync(job.outputPath)) {
    return res.status(404).json({ error: 'Result not available.' });
  }
  const MAX_INLINE = 1024 * 1024;
  const size = fs.statSync(job.outputPath).size;
  const text = fs.readFileSync(job.outputPath, 'utf8').slice(0, MAX_INLINE);
  res.json({ text, truncated: size > MAX_INLINE, bytes: size, detect: job.detect });
});

// --- static frontend ------------------------------------------------------
const PUBLIC_DIR = path.join(__dirname, '..', 'public');
app.use(express.static(PUBLIC_DIR, { extensions: ['html'], maxAge: '1h' }));
app.get('*', (req, res) => res.sendFile(path.join(PUBLIC_DIR, 'index.html')));

// --- multer / generic error handler ---------------------------------------
app.use((err, req, res, next) => {
  if (err && err.code === 'LIMIT_FILE_SIZE') {
    return res.status(413).json({
      error: `File too large (max ${Math.round(config.MAX_UPLOAD_BYTES / 1024 / 1024)} MB).`,
    });
  }
  console.error('[server] error:', err && err.message);
  res.status(500).json({ error: 'Internal server error.' });
});

fs.mkdirSync(config.WORK_ROOT, { recursive: true });
app.listen(config.PORT, () => {
  console.log(`[luraph-web] listening on :${config.PORT}  (repo: ${config.REPO_ROOT})`);
  console.log(`[luraph-web] limits: upload=${config.MAX_UPLOAD_BYTES}B timeout=${config.JOB_TIMEOUT_MS}ms ` +
    `concurrency=${config.MAX_CONCURRENT_JOBS} rate=${config.RATE_MAX}/${config.RATE_WINDOW_MS}ms`);
});
