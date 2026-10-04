'use strict';

const express = require('express');
const multer = require('multer');
const fs = require('fs');
const path = require('path');
const config = require('./config');
const queue = require('./lib/queue');
const bridge = require('./lib/bridge');

// Reuse the engine's real detector so the server and the CLI never disagree.
const detector = require(path.join(config.REPO_ROOT, 'src', 'detect'));

const app = express();
app.disable('x-powered-by');
app.set('trust proxy', true); // so req.ip is the client behind a proxy/CDN

// --- security + CORS headers ----------------------------------------------
app.use((req, res, next) => {
  res.setHeader('Access-Control-Allow-Origin', config.CORS_ORIGIN);
  res.setHeader('Access-Control-Allow-Methods', 'GET,POST,OPTIONS');
  res.setHeader('Access-Control-Allow-Headers', 'Content-Type, X-Bridge-Token');
  res.setHeader('X-Content-Type-Options', 'nosniff');
  res.setHeader('Referrer-Policy', 'no-referrer');
  if (req.method === 'OPTIONS') return res.sendStatus(204);
  next();
});

// JSON only for the bridge ingest chunks; multipart routes use multer, which
// express.json leaves untouched (it only parses application/json).
app.use(express.json({ limit: '2mb' }));

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

// --- executor bridge (Milestone 1) ----------------------------------------
// Enabled only when BRIDGE_TOKEN is set. Token gates serving the tracer and
// ingesting captures; results are read with the same token.
function bridgeToken(req) {
  return req.get('X-Bridge-Token') || req.query.t || (req.body && req.body.t) || '';
}

const TRACER_PATH = path.join(__dirname, '..', 'bridge', 'tracer.lua');

app.get('/bridge/boot', (req, res) => {
  if (!bridge.enabled()) return res.status(404).type('text/plain').send('-- bridge disabled (no BRIDGE_TOKEN set)');
  if (!bridge.tokenOk(bridgeToken(req))) return res.status(401).type('text/plain').send('-- unauthorized');
  let lua;
  try { lua = fs.readFileSync(TRACER_PATH, 'utf8'); }
  catch { return res.status(500).type('text/plain').send('-- tracer unavailable'); }
  const sid = bridge.newSid();
  const base = (config.BRIDGE_PUBLIC_URL || `${req.protocol}://${req.get('host')}`).replace(/\/+$/, '');
  lua = lua.replace(/\{\{COLLECTOR\}\}/g, base)
           .replace(/\{\{TOKEN\}\}/g, bridgeToken(req))
           .replace(/\{\{SID\}\}/g, sid);
  res.setHeader('X-Bridge-Session', sid);
  res.type('text/plain').send(lua);
});

app.post('/bridge/ingest', (req, res) => {
  if (!bridge.enabled()) return res.status(404).json({ error: 'bridge disabled' });
  if (!bridge.tokenOk(bridgeToken(req))) return res.status(401).json({ error: 'unauthorized' });
  const r = bridge.ingest(req.body);
  if (r.error) return res.status(r.status || 400).json({ error: r.error });
  res.json(r);
});

app.get('/bridge/result/:sid', (req, res) => {
  if (!bridge.enabled()) return res.status(404).json({ error: 'bridge disabled' });
  if (!bridge.tokenOk(bridgeToken(req))) return res.status(401).json({ error: 'unauthorized' });
  const r = bridge.result(req.params.sid);
  if (!r) return res.status(404).json({ error: 'session not found or expired' });
  res.json(r);
});

// Mobile-friendly status page: enter token + session, watch captures deobfuscate.
app.get('/bridge', (req, res) => {
  res.type('html').send(`<!doctype html><html><head><meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1"><title>Bridge</title>
<style>body{font-family:-apple-system,system-ui,sans-serif;background:#0d1117;color:#e6edf3;margin:0;padding:16px}
h1{font-size:18px}input{width:100%;box-sizing:border-box;padding:10px;margin:6px 0;border-radius:8px;border:1px solid #272e38;background:#161b22;color:#e6edf3;font-family:monospace}
button{padding:10px 16px;border-radius:8px;border:0;background:#6ea8fe;color:#fff;font-weight:600}
.cap{border:1px solid #272e38;border-radius:8px;padding:10px;margin:8px 0;background:#161b22;font-size:14px}
.k{font-family:monospace;color:#8b7cff}.ok{color:#3fb950}.err{color:#f85149}.dim{color:#6b7684;font-size:12px;word-break:break-all}
a{color:#6ea8fe}</style></head><body>
<h1>Executor bridge</h1>
<input id=t placeholder="bridge token" autocomplete=off>
<input id=s placeholder="session id (printed in Delta)" autocomplete=off>
<button onclick=go()>Watch</button>
<div id=out></div>
<script>
function go(){localStorage.bt=t.value;localStorage.bs=s.value;tick();}
t.value=localStorage.bt||'';s.value=localStorage.bs||'';
async function tick(){
 if(!t.value||!s.value)return;
 try{const r=await fetch('/bridge/result/'+encodeURIComponent(s.value)+'?t='+encodeURIComponent(t.value));
 if(!r.ok){out.innerHTML='<p class=err>'+(await r.json()).error+'</p>';return;}
 const d=await r.json();let h='';
 for(const c of d.captures){h+='<div class=cap><span class=k>'+c.kind+'</span> '+c.bytes+' B'
  +(c.url?'<div class=dim>'+c.url+'</div>':'')
  +'<div>'+ (c.status==='done'?'<span class=ok>✓ deobfuscated'+(c.detect?' · '+c.detect.label:'')+'</span> — <a href="/api/job/'+c.jobId+'/download">download</a>':(c.status==='error'?'<span class=err>'+c.error+'</span>':c.status))
  +'</div></div>';}
 for(const p of d.pending){h+='<div class=cap><span class=k>'+p.kind+'</span> receiving '+p.have+'/'+p.total+'…</div>';}
 out.innerHTML=h||'<p class=dim>waiting for captures…</p>';
 }catch(e){out.innerHTML='<p class=err>'+e.message+'</p>';}
 setTimeout(tick,2500);
}
tick();
</script></body></html>`);
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
