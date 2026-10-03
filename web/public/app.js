'use strict';
(function () {
  var $ = function (id) { return document.getElementById(id); };
  var api = '';              // same origin
  var currentFile = null;    // { name, text }
  var poll = null;
  var backendUp = true;      // flipped off if /api/health is unreachable (static preview)

  // Probe for the backend. Detection + sample viewer are pure client-side, so
  // they work either way; only live deobfuscation needs the API.
  fetch(api + '/api/health', { method: 'GET' })
    .then(function (r) { if (!r.ok) throw 0; return r.json(); })
    .then(function () { backendUp = true; })
    .catch(function () {
      backendUp = false;
      var b = $('preview-banner'); if (b) b.classList.remove('hidden');
    });

  // ---- theme ----
  var THEME_KEY = 'luraph-theme';
  try {
    var saved = localStorage.getItem(THEME_KEY);
    if (saved) document.documentElement.setAttribute('data-theme', saved);
  } catch (e) {}
  $('theme-toggle').addEventListener('click', function () {
    var cur = document.documentElement.getAttribute('data-theme') === 'light' ? 'dark' : 'light';
    document.documentElement.setAttribute('data-theme', cur);
    try { localStorage.setItem(THEME_KEY, cur); } catch (e) {}
  });

  function highlight(el) {
    if (window.hljs) { try { el.removeAttribute('data-highlighted'); window.hljs.highlightElement(el); } catch (e) {} }
  }
  function fmtBytes(n) {
    if (n < 1024) return n + ' B';
    if (n < 1024 * 1024) return (n / 1024).toFixed(1) + ' KB';
    return (n / 1024 / 1024).toFixed(2) + ' MB';
  }

  // ---- upload + detect ----
  var drop = $('drop'), fileInput = $('file');
  drop.addEventListener('click', function () { fileInput.click(); });
  drop.addEventListener('keydown', function (e) { if (e.key === 'Enter' || e.key === ' ') { e.preventDefault(); fileInput.click(); } });
  ['dragenter', 'dragover'].forEach(function (ev) {
    drop.addEventListener(ev, function (e) { e.preventDefault(); drop.classList.add('dragging'); });
  });
  ['dragleave', 'drop'].forEach(function (ev) {
    drop.addEventListener(ev, function (e) { e.preventDefault(); drop.classList.remove('dragging'); });
  });
  drop.addEventListener('drop', function (e) {
    if (e.dataTransfer.files && e.dataTransfer.files[0]) handleFile(e.dataTransfer.files[0]);
  });
  fileInput.addEventListener('change', function () { if (fileInput.files[0]) handleFile(fileInput.files[0]); });

  var MAX = 3 * 1024 * 1024;
  function handleFile(file) {
    resetJob();
    if (file.size > MAX) { showDetect(null, file.name + ' is too large (max 3 MB).', true); return; }
    var reader = new FileReader();
    reader.onload = function () {
      currentFile = { name: file.name, text: reader.result, size: file.size };
      $('drop-sub').textContent = file.name + ' · ' + fmtBytes(file.size);
      var res = window.LuraphDetect.detect(reader.result);
      showDetect(res, null, false);
    };
    reader.onerror = function () { showDetect(null, 'Could not read that file.', true); };
    reader.readAsText(file, 'latin1');
  }

  function showDetect(res, errMsg, isErr) {
    var row = $('detect-row'), chip = $('detect-chip'), meta = $('detect-meta'), go = $('go');
    row.classList.remove('hidden');
    chip.className = 'detect-chip';
    if (isErr || !res) {
      chip.classList.add('none'); chip.textContent = 'Error';
      meta.textContent = errMsg || 'Could not detect.';
      go.disabled = true; return;
    }
    if (res.name === 'luraph_v15') chip.classList.add('v15');
    else if (res.name === 'luraph_v14') chip.classList.add('v14');
    else chip.classList.add('none');
    chip.textContent = res.version ? ('Luraph ' + res.version) : res.label;
    if (res.name === 'generic') {
      meta.textContent = 'Not recognized as Luraph — the server will still try a behaviour trace.';
      go.disabled = false;
    } else {
      meta.textContent = res.label + ' · confidence ' + res.confidence.toFixed(2);
      go.disabled = false;
    }
  }

  // ---- deobfuscate job ----
  $('go').addEventListener('click', startJob);

  function resetJob() {
    if (poll) { clearInterval(poll); poll = null; }
    $('job').classList.add('hidden');
    $('result').classList.add('hidden');
  }

  function startJob() {
    if (!currentFile) return;
    if (!backendUp) {
      $('job').classList.remove('hidden');
      fail('Live deobfuscation needs the backend. This is a static preview — deploy the Docker image to enable it.');
      return;
    }
    $('go').disabled = true;
    $('job').classList.remove('hidden');
    $('result').classList.add('hidden');
    setStatus('Uploading…', 8, '');

    var fd = new FormData();
    fd.append('file', new Blob([currentFile.text], { type: 'text/plain' }), currentFile.name);

    fetch(api + '/api/deobfuscate', { method: 'POST', body: fd })
      .then(function (r) { return r.json().then(function (j) { return { ok: r.ok, status: r.status, j: j }; }); })
      .then(function (out) {
        if (!out.ok) { fail(out.j.error || ('Request failed (' + out.status + ')')); return; }
        setStatus('Queued…', 15, 'job ' + out.j.id);
        watch(out.j.id);
      })
      .catch(function (e) { fail('Network error: ' + e.message); });
  }

  function watch(id) {
    var ticks = 0;
    poll = setInterval(function () {
      ticks++;
      fetch(api + '/api/job/' + id)
        .then(function (r) { return r.json(); })
        .then(function (j) {
          if (j.status === 'queued') setStatus('Queued (position ' + (j.queuePosition || 1) + ')…', 18, '');
          else if (j.status === 'running') setStatus('Deobfuscating…', Math.min(30 + ticks * 4, 90), 'tracing + devirtualizing');
          else if (j.status === 'done') { clearInterval(poll); poll = null; finish(id, j); }
          else if (j.status === 'error') { clearInterval(poll); poll = null; fail(j.error || 'Deobfuscation failed.', j.detail); }
          else if (j.error) { clearInterval(poll); poll = null; fail(j.error); }
        })
        .catch(function (e) { clearInterval(poll); poll = null; fail('Lost connection: ' + e.message); });
    }, 2500);
  }

  function setStatus(txt, pct, detail) {
    $('job-status').textContent = txt;
    $('bar-fill').style.width = pct + '%';
    $('job-detail').textContent = detail || '';
  }
  function fail(msg, detail) {
    setStatus('✗ ' + msg, 100, detail || '');
    $('bar-fill').style.background = 'var(--no)';
    $('go').disabled = false;
  }

  function finish(id, j) {
    setStatus('✓ Done', 100, j.detect ? ('detected ' + j.detect.label) : '');
    $('go').disabled = false;
    fetch(api + '/api/job/' + id + '/result')
      .then(function (r) { return r.json(); })
      .then(function (d) {
        var pane = $('result'); pane.classList.remove('hidden');
        var code = $('result-code');
        code.textContent = d.text + (d.truncated ? '\n\n-- … truncated for preview; use Download for the full file --' : '');
        highlight(code);
        $('result-info').textContent = fmtBytes(d.bytes) + (d.truncated ? ' (preview truncated)' : '');
        var dl = $('download');
        dl.setAttribute('href', api + '/api/job/' + id + '/download');
        $('copy').onclick = function () {
          navigator.clipboard.writeText(d.text).then(function () {
            $('copy').textContent = 'Copied'; setTimeout(function () { $('copy').textContent = 'Copy'; }, 1400);
          });
        };
      })
      .catch(function (e) { fail('Could not load result: ' + e.message); });
  }

  // ---- before/after viewer ----
  var SAMPLES = {
    hoshihub: { before: 'samples/hoshihub.before.txt', after: 'samples/hoshihub.after.luau' },
    rideapet: { before: 'samples/rideapet.before.txt', after: 'samples/rideapet.after.luau' },
  };
  function loadSample(key) {
    var s = SAMPLES[key]; if (!s) return;
    Promise.all([fetch(s.before).then(function (r) { return r.text(); }),
                 fetch(s.after).then(function (r) { return r.text(); })])
      .then(function (parts) {
        var before = parts[0], after = parts[1];
        var bc = $('before-code'), ac = $('after-code');
        bc.textContent = before.slice(0, 2600) + '\n\n-- … (payload is one long line; slice shown) --';
        ac.textContent = after;
        $('before-meta').textContent = 'first ' + fmtBytes(2600);
        $('after-meta').textContent = after.split('\n').length + ' lines';
        highlight(bc); highlight(ac);
      })
      .catch(function () {});
  }
  var tabs = document.querySelectorAll('#sample-tabs .tab');
  tabs.forEach(function (t) {
    t.addEventListener('click', function () {
      tabs.forEach(function (x) { x.classList.remove('is-active'); });
      t.classList.add('is-active');
      loadSample(t.getAttribute('data-sample'));
    });
  });
  loadSample('hoshihub');
})();
