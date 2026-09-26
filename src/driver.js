'use strict';

const fs = require('fs');
const path = require('path');
const vmmap = require('./vmmap');
const harness = require('./harness');
const trace = require('./traceout');
const tidy = require('./tidy');
const devirt = require('./devirt');

const SPIN_CHECKS = 24;

function patchChunk(src, tmpdir, chunkTag) {
  const p = path.join(tmpdir, `_chunk_${harness.chunkKey(src)}.luau`);
  fs.writeFileSync(p, src, 'latin1');
  try {
    return vmmap.patchEntries(src, p, chunkTag);
  } catch (e) {
    process.stderr.write(`[!] could not instrument chunk (${e.message})\n`);
    return src;
  } finally {
    try { fs.unlinkSync(p); } catch {}
  }
}

async function run(job) {
  const { args } = job;
  const devirtOn = !args.noDevirt;
  let source = job.source;

  let patched;
  try {
    patched = args.noHooks ? source : vmmap.patchEntries(source, job.sourcePath, harness.chunkKey(source));
  } catch (e) {
    process.stderr.write(`[!] AST parse failed: ${e.message}\n`);
    throw e;
  }

  let spin = true;
  if (spin) patched = vmmap.patchSpin(patched);

  const cachePath = harness.loadP2dCache(job.input);
  const runner = new harness.Runner(job);

  const skip = [];
  const chunks = {};
  const rawChunks = {};
  let body = null;
  let trapped = null;
  let cfg = null;

  for (let attempt = 1; attempt <= args.maxRuns; attempt++) {
    cfg = {
      time_budget: args.budget,
      dump_strings: args.strings,
      executor: args.executor,
      skip_protos: skip,
      devirt: devirtOn,
    };
    if (args.inputText) cfg.input_text = args.inputText;
    if (args.noFold) cfg.fold = false;
    if (spin) cfg.spin = SPIN_CHECKS;

    process.stderr.write(`[*] tracing ${job.input} (run ${attempt})...\n`);
    const res = await runner.run(patched, cfg, chunks);
    body = res.body;

    if (!body) {
      runner.finish();
      throw new Error(res.err || 'Trace failed without output');
    }

    body = harness.takeP2d(body);

    const { chunks: found, body: cleanBody } = harness.takeChunks(body);
    body = cleanBody;
    let added = 0;
    for (const [key, src] of found) {
      if (!chunks[key]) {
        rawChunks[key] = src;
        chunks[key] = patchChunk(src, job.outdir, key);
        if (spin) chunks[key] = vmmap.patchSpin(chunks[key]);
        added++;
      }
    }
    if (added > 0) {
      process.stderr.write(`[*] script loadstring'd ${added} new VM chunk(s); instrumenting and re-running\n`);
      continue;
    }

    const trig = /\x00TRIGGER (\d+)/.exec(body);
    if (trapped !== null && trace.stmtCount(body) < trace.stmtCount(trapped[0])) {
      process.stderr.write(`[*] disabling function #${skip[skip.length - 1]} made script stop earlier: keeping run ${attempt - 1}\n`);
      body = trapped[0];
      skip.pop();
      break;
    }
    if (!trig) break;

    trapped = [body, harness.getLastRaw()];
    const pid = parseInt(trig[1], 10);
    if (skip.includes(pid)) {
      process.stderr.write(`[!] anti-tamper trigger ${pid} fired again; giving up on reruns\n`);
      break;
    }
    process.stderr.write(`[*] anti-tamper trap reached through function #${pid}; disabling it and re-running\n`);
    skip.push(pid);
  }

  const runText = harness.traceText(body);
  body = harness.p2dMiss(body, cachePath);
  body = body.replace(/\x00TRIGGER \d+\n?/g, '');

  const [protosJson, b1] = trace.takeLine(body, 'PROTOS');
  body = b1;
  const [force, b2] = trace.takeLine(body, 'FORCE');
  body = b2;
  if (force && devirtOn) process.stderr.write(`[*] constants decoded on request: ${force}\n`);

  const [unscrambled, b3] = trace.takeLine(body, 'UNSCRAMBLED');
  body = b3;
  if (unscrambled && devirtOn)
    process.stderr.write(`[*] ${unscrambled} function(s) scrambled by LPH_CRASH(): dumped as created\n`);

  const [b4, strings] = trace.takeStrings(body);
  body = b4;

  const notes = skip.length ? [`anti-tamper trap functions disabled: ${skip.map(p => '#' + p).join(', ')}`] : [];
  const text = trace.header(job.input, notes) + body;

  function writeTrace() {
    job.write(job.tracePath, tidy.tidy(text, { preamble: !args.keepPreamble }));
  }

  if (!devirtOn && !job.debug) {
    writeTrace();
  }

  if (strings) job.write(job.path('.strings.txt'), strings);

  const dpath = job.path('.devirt.luau');
  if (protosJson) {
    const ppath = job.path('.protos.json');
    if (protosJson.startsWith('error:')) {
      process.stderr.write(`[!] proto capture failed: ${protosJson}\n`);
    } else {
      job.write(ppath, protosJson);
      if (devirtOn) {
        const chunkPaths = Object.entries(rawChunks).map(([k, src]) =>
          job.write(job.path(`.chunk_${k}.luau`), src, 'latin1')
        );

        const cfgData = {
          input: job.input,
          source: job.source,
          source_path: job.sourcePath,
          trace_path: job.tracePath,
          debug: job.debug,
          obfuscator: job.obfuscator,
          luau_exe: runner.luau,
          patched: patched,
          cfg: cfg,
          chunks: chunks,
          run_text: runText,
          ppath: ppath,
          dpath: dpath,
          chunk_paths: chunkPaths,
          args: {
            budget: args.budget,
            timeout: args.timeout,
            devirt_rounds: args.devirtRounds || 200,
            studio: false,
            no_fold: args.noFold || false,
            strings: args.strings || false,
            executor: args.executor || 'Wave',
          },
        };
        const cfgPath = job.path('.cfg.json');
        fs.writeFileSync(cfgPath, JSON.stringify(cfgData), 'utf8');

        const { execFileSync } = require('child_process');
        const { getPythonBin } = require('./pyenv');
        const pythonBin = getPythonBin();
        const bridgePy = path.join(__dirname, 'devirt_bridge.py');
        const coreDir = path.join(__dirname, '..', 'core');
        try {
          execFileSync(pythonBin, [bridgePy, 'pipeline', cfgPath], {
            env: Object.assign({}, process.env, { PYTHONPATH: coreDir }),
            stdio: 'inherit',
          });
        } finally {
          try { fs.unlinkSync(cfgPath); } catch {}
        }
      }
    }
  }

  runner.finish();
  trace.statusLine(body);

  if (devirtOn && fs.existsSync(dpath)) {
    const lifted = fs.readFileSync(dpath, 'utf8');
    const nilCalls = (lifted.match(/\(nil\)\(/g) || []).length;
    const lines = lifted.split('\n').length;
    if (nilCalls < 50 || nilCalls * 100 < lines) {
      return dpath;
    }
    process.stderr.write(`[!] the devirtualized output is broken (${nilCalls} calls of nil); writing behaviour trace instead\n`);
    if (!job.debug) { try { fs.unlinkSync(dpath); } catch {} }
    writeTrace();
    return job.tracePath;
  }

  if (devirtOn) {
    process.stderr.write('[!] devirtualization produced no output; writing behaviour trace\n');
    if (!fs.existsSync(job.tracePath)) writeTrace();
  }
  return job.tracePath;
}

async function liftWithRounds(job, runner, patched, cfg, chunks, runText, ppath, dpath, chunkPaths) {
  const { args } = job;
  const rounds = args.devirtRounds || 200;
  const requested = new Set();
  let lastBufs = '';
  let text = null;
  let quick = true;

  for (let rnd = 1; rnd <= rounds; rnd++) {
    const t1 = Date.now();
    let full = !quick;

    if (quick) {
      let res;
      try {
        res = devirt.collectRequests(job.sourcePath, ppath, chunkPaths);
      } catch (e) {
        process.stderr.write(`[!] collect failed: ${e.message}\n`);
        break;
      }
      const { stats, reqs, bufs } = res;
      const newReqs = [...reqs].filter(x => !requested.has(x));
      process.stderr.write(
        `[*] devirt round ${rnd}: ${stats.functions} functions (${stats.walked} walked), ${stats.errors} unlifted blocks, ${newReqs.length} new constant requests (${((Date.now() - t1) / 1000).toFixed(1)}s)\n`
      );

      if (newReqs.length === 0 || rnd === rounds) {
        full = true;
      } else {
        newReqs.forEach(r => requested.add(r));
        lastBufs = bufs;

        const c = Object.assign({}, cfg, {
          force_req: [...requested].sort().join(';'),
          force_buf: bufs,
        });
        const runRes = await runner.run(patched, c, chunks);
        if (!runRes.body) {
          process.stderr.write('[!] constant request run failed\n');
          break;
        }
        const m = /\x00PROTOS ([^\n]*)\n/.exec(runRes.body);
        if (!m || m[1].startsWith('error:')) {
          process.stderr.write('[!] constant request run gave no protos\n');
          break;
        }
        fs.writeFileSync(ppath, m[1], 'utf8');
      }
    }

    if (full) {
      process.stderr.write(`[*] devirtualizing (round ${rnd})...\n`);
      const tFull = Date.now();
      let res;
      try {
        res = devirt.liftProgram(job.sourcePath, ppath, chunkPaths, dpath);
      } catch (e) {
        process.stderr.write(`[!] lift failed: ${e.message}\n`);
        break;
      }
      const { text: liftedText, stats, reqs } = res;
      text = liftedText;
      const newReqs = [...reqs].filter(x => !requested.has(x));
      process.stderr.write(
        `[*]   ${stats.functions} functions, ${stats.errors} unlifted blocks, ${stats.fallbacks} unstructured jumps, ${newReqs.length} new constant requests (${((Date.now() - tFull) / 1000).toFixed(1)}s)\n`
      );

      if (newReqs.length === 0 || rnd === rounds) break;
      if (quick) {
        process.stderr.write('[*]   the full lift needs more constants: continuing with full lifts\n');
        quick = false;
      }
      newReqs.forEach(r => requested.add(r));
    }
  }

  if (text) {
    const header = job.creditHeader();
    const prefix = header ? header + '\n' : '';
    job.write(dpath, prefix + text + '\n');
  }
}

async function runGeneric(job) {
  const { args } = job;
  const cachePath = harness.loadP2dCache(job.input);
  const runner = new harness.Runner(job);
  const cfg = {
    time_budget: args.budget,
    executor: args.executor,
    dump_strings: args.strings,
  };
  if (args.inputText) cfg.input_text = args.inputText;
  if (args.noFold) cfg.fold = false;

  process.stderr.write(`[*] tracing ${job.input}...\n`);
  const res = await runner.run(job.source, cfg);
  if (!res.body) {
    runner.finish();
    throw new Error(res.err || 'Trace failed without output');
  }
  runner.finish();
  let body = harness.takeP2d(res.body);
  body = harness.p2dMiss(body, cachePath);
  const { body: cleanBody } = harness.takeChunks(body);
  body = cleanBody;
  const [b2, strings] = trace.takeStrings(body);
  body = b2;

  const text = trace.header(job.input) + body;
  job.write(job.tracePath, tidy.tidy(text, { preamble: false }));
  if (strings) job.write(job.path('.strings.txt'), strings);
  trace.statusLine(body);
  return job.tracePath;
}

module.exports = { run, runGeneric };
