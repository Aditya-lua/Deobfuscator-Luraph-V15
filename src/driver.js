'use strict';

const fs = require('fs');
const path = require('path');
const vmmap = require('./vmmap');
const vmmap14 = require('./vmmap14');
const harness = require('./harness');
const trace = require('./traceout');
const tidy = require('./tidy');

const SPIN_CHECKS = 24;

// Luraph v14.x (job.obfuscator = the plugin label "Luraph v14.x") runs the
// v14 mapper and the v14-only stages below. Every v14 branch is gated on this,
// so a v15 job takes exactly the v15 path (same mapper object, same steps).
function isV14(job) {
  return !!(job.obfuscator && job.obfuscator.includes('v14'));
}

function mapperFor(job) {
  return isV14(job) ? vmmap14 : vmmap;
}

function patchChunk(job, src, tmpdir, chunkTag) {
  const p = path.join(tmpdir, `_chunk_${harness.chunkKey(src)}.luau`);
  fs.writeFileSync(p, src, 'latin1');
  try {
    return mapperFor(job).patchEntries(src, p, chunkTag);
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

  const v14 = isV14(job);
  const mapper = mapperFor(job);
  if (v14) process.env.DEOB_ENGINE = 'v14';

  let patched;
  try {
    patched = args.noHooks ? source : mapper.patchEntries(source, job.sourcePath, harness.chunkKey(source));
  } catch (e) {
    process.stderr.write(`[!] AST parse failed: ${e.message}\n`);
    throw e;
  }

  let spin = true;
  if (spin) patched = mapper.patchSpin(patched);

  const cachePath = harness.loadP2dCache(job.input);
  const runner = new harness.Runner(job);

  const skip = [];
  const chunks = {};
  const rawChunks = {};
  let body = null;
  let trapped = null;
  let cfg = null;

  for (let attempt = 1; attempt <= args.maxRuns; attempt++) {
    // v14 chunk pass: before any chunk is known a v14 payload VM runs
    // uninstrumented and silently for minutes, so the first pass only waits
    // for the loadstring'd chunk (envlog dumps it and aborts), then the
    // instrumented chunk is rerun. The blob decode before loadstring is
    // silent and roughly linear in the protected size: give it room.
    const chunkPass = v14 && devirtOn && attempt === 1 && Object.keys(chunks).length === 0;
    cfg = {
      time_budget: chunkPass ? Math.min(args.budget, 60) : args.budget,
      dump_strings: args.strings,
      executor: args.executor,
      skip_protos: skip,
      devirt: devirtOn,
    };
    if (chunkPass) {
      cfg.chunks_only = true;
      cfg.stall = Math.max(90, Math.min(900, Math.round(job.source.length / 3000)));
    }
    if (args.inputText) cfg.input_text = args.inputText;
    if (args.preludeFile) cfg.prelude = require('fs').readFileSync(args.preludeFile, 'latin1');
    if (args.noFold) cfg.fold = false;
    if (spin) cfg.spin = SPIN_CHECKS;
    if (args.cfgJson) Object.assign(cfg, args.cfgJson);

    process.stderr.write(`[*] tracing ${job.input} (run ${attempt})...\n`);
    const res = await runner.run(patched, cfg, chunks);
    body = res.body;

    if (!body && v14 && res.partial) {
      // a killed v14 pass still printed the loadstring'd chunk(s) before the
      // stall: recover them from the partial output and rerun instrumented
      const partial = res.partial.replace(/\r\n/g, '\n');
      const { chunks: partialFound } = harness.takeChunks(harness.takeP2d(partial));
      let recovered = 0;
      for (const [key, src] of partialFound) {
        if (!chunks[key]) {
          rawChunks[key] = src;
          chunks[key] = patchChunk(job, src, job.outdir, key);
          if (spin) chunks[key] = mapper.patchSpin(chunks[key]);
          recovered++;
        }
      }
      if (recovered > 0) {
        process.stderr.write(`[*] recovered ${recovered} VM chunk(s) from the interrupted run; instrumenting and re-running\n`);
        continue;
      }
    }

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
        chunks[key] = patchChunk(job, src, job.outdir, key);
        if (spin) chunks[key] = mapper.patchSpin(chunks[key]);
        added++;
      }
    }
    if (added > 0) {
      process.stderr.write(`[*] script loadstring'd ${added} new VM chunk(s); instrumenting and re-running\n`);
      continue;
    }

    const trig = new RegExp(harness.mark('TRIGGER ') + '(\\d+)').exec(body);
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
  body = body.replace(new RegExp(harness.mark('TRIGGER ') + '\\d+\\n?', 'g'), '');

  const [protosJson0, b1] = trace.takeLine(body, 'PROTOS');
  body = b1;
  let protosJson = protosJson0;
  if (v14 && devirtOn && protosJson && !protosJson.startsWith('error:')) {
    // v14's in-harness root_callee can be stale on large scripts: the
    // weighted runtime call-chain vote picks the payload root instead
    protosJson = applyRootHint(protosJson, body);
  }
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
          // Bound each lift unit on the v14 path so an oversized v14.9 function
          // that churns the codegen/structure passes degrades to the behaviour
          // trace instead of hanging. v15 runs never set this, so their joins
          // stay unbounded and their output is byte-for-byte unchanged.
          const childEnv = Object.assign({}, process.env, { PYTHONPATH: coreDir });
          if (v14 && !childEnv.DEOB_STACK_BUDGET) childEnv.DEOB_STACK_BUDGET = '150';
          execFileSync(pythonBin, [bridgePy, 'pipeline', cfgPath], {
            env: childEnv,
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
    if (v14 && v14ScaffoldScore(lifted) >= 24) {
      // the "lift" is still Luraph's VM/bootstrap scaffolding, not the
      // payload: recover what the payload did from the behaviour trace
      process.stderr.write('[!] rejected devirtualized output: still Luraph VM/bootstrap scaffolding\n');
      if (!job.debug) { try { fs.unlinkSync(dpath); } catch {} }
      const recover = (b) => {
        // the probe strip works line-wise on a trace: never emit a payload
        // that does not parse when the unstripped trace does
        const tb = tidy.tidy(b, { preamble: false });
        const s = payloadTraceSource(tb, true);
        if (s && !luauParses(job, s)) {
          const raw = payloadTraceSource(tb, false);
          if (raw && luauParses(job, raw)) {
            process.stderr.write('[!] probe-stripped payload did not parse; keeping the unstripped trace\n');
            return raw;
          }
        }
        return s;
      };
      let payload = recover(text);
      if (!payload || v14ScaffoldScore(payload) >= 24) {
        // the instrumented run can stop before the payload executes; a
        // trace-only pass (which runs the script further) usually sees more
        try {
          const tr = new harness.Runner(job);
          process.stderr.write('[*] re-tracing without devirtualization to reach the payload\n');
          const rr = await tr.run(patched, Object.assign({}, cfg, { devirt: false }), chunks);
          tr.finish();
          if (rr.body) {
            let rb = harness.takeP2d(rr.body);
            rb = harness.p2dMiss(rb, cachePath);
            const { body: cb } = harness.takeChunks(rb);
            const [b4r] = trace.takeStrings(cb);
            const alt = recover(trace.header(job.input) + b4r);
            if (alt && v14ScaffoldScore(alt) < v14ScaffoldScore(payload || '')) payload = alt;
          }
        } catch (e) {
          process.stderr.write(`[!] trace-only recovery pass failed: ${e.message}\n`);
        }
      }
      if (payload) {
        process.stderr.write('[+] payload-attributed recovery from trace (bootstrap lift rejected)\n');
        const payPath = job.path('.payload.lua');
        job.write(payPath, payload + '\n');
        return payPath;
      }
      if (!fs.existsSync(job.tracePath)) writeTrace();
      return job.tracePath;
    }
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
  if (args.cfgJson) Object.assign(cfg, args.cfgJson);

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

// ---- Luraph v14.x-only stages (gated by isV14 in run()) ----

function traceRootCandidates(body) {
  // Rank likely payload-root pids from the envlog call-chain markers: favour
  // an immediate child of the outermost frame that accounts for many
  // statements in few invocations, and penalize children that return to an
  // emitting parent (the fingerprint/probe shape).
  const scores = {}, hits = {}, invs = {}, lastSeen = {}, lastChild = {};
  let pos = 0;
  for (const line of body.split('\n')) {
    const m = /^\s*--@\d+\s*(.*)$/.exec(line);
    if (!m) continue;
    pos++;
    const chain = [];
    for (const part of m[1].split(',')) {
      const q = /^(\d+):([^,\s]*)/.exec(part.trim());
      if (q) chain.push([q[1], q[2]]);
    }
    if (chain.length >= 2) {
      const parent = chain[0][0], child = chain[1][0];
      let w = 5 + Math.min(3, chain.length - 2);
      if (chain.length === 2) w += 1;
      scores[child] = (scores[child] || 0) + w;
      hits[child] = (hits[child] || 0) + 1;
      (invs[child] = invs[child] || new Set()).add(chain[1][1]);
      lastSeen[child] = pos;
      lastChild[parent] = child;
    } else if (chain.length === 1) {
      const child = lastChild[chain[0][0]];
      if (child !== undefined) {
        scores[child] = (scores[child] || 0) - 18;
        delete lastChild[chain[0][0]];
      }
    }
  }
  for (const pid of Object.keys(invs)) {
    scores[pid] = (scores[pid] || 0) - Math.max(0, invs[pid].size - 2) * 5;
  }
  return Object.keys(scores).sort((a, b) =>
    (scores[b] - scores[a]) || ((hits[b] || 0) - (hits[a] || 0)) ||
    ((lastSeen[b] || 0) - (lastSeen[a] || 0)));
}

function applyRootHint(protosJson, body) {
  // v14: override the in-harness root_callee with the weighted call-chain
  // vote (traceRootCandidates); unknown pids / unparsable dumps pass through
  const ranked = traceRootCandidates(body);
  if (!ranked.length) return protosJson;
  let data;
  try { data = JSON.parse(protosJson); } catch { return protosJson; }
  const known = ranked.filter(p => String(p) in (data.protos || {})).slice(0, 8);
  if (!known.length) return protosJson;
  const hint = Number(known[0]);
  const old = data.root_callee;
  data.root_candidates = known.map(Number);
  data.root_callee = hint;
  if (old !== hint) {
    process.stderr.write(`[*] payload root proto #${hint} from weighted runtime call chain\n`);
  }
  return JSON.stringify(data);
}

function v14ScaffoldScore(text) {
  // Density-based scaffold detector: every marker is scaled by the number of
  // lines, so a large genuine payload lift with some unresolved helper stubs
  // is kept, while a compact Luraph bootstrap dump is rejected.
  if (!text) return 1e6;
  const lines = Math.max(1, text.split('\n').length);
  let score = 0;
  const callerRegs = (text.match(/the caller's registers/g) || []).length;
  const runtime = (text.match(/luraph_runtime/g) || []).length;
  const handlers = (text.match(/handlers\[/g) || []).length;
  const stateBranches = (text.match(/\b(?:if|elseif)\s+state\s*==/g) || []).length;
  const denseTable = (text.match(/^\s*\[\d+\]\s*=/gm) || []).length;
  const stubs = (text.match(/error\("Luraph runtime function/g) || []).length;
  const traceJunk = (text.match(/^\s*--\s{2,}(?:Script:|.*harness\.luau)/gm) || []).length;
  const guards = (text.match(/error\("devirt:/g) || []).length;
  if (callerRegs * 50 > lines) score += 40 + Math.min(60, callerRegs);
  if (runtime * 40 > lines) score += 40 + Math.min(60, runtime);
  if (handlers * 40 > lines) score += 40 + Math.min(40, handlers * 2);
  if (stateBranches * 40 > lines) score += 30;
  if (denseTable * 8 > lines) score += 30;
  if (text.includes('local ... = ...')) score += 40;
  if (stubs * 20 > lines) score += 40 + Math.min(60, stubs * 5);
  if (traceJunk * 10 > lines) score += 30 + Math.min(60, traceJunk * 2);
  if (guards * 20 > lines) score += 30 + Math.min(50, guards * 5);
  // context-less fragment: a script's root chunk has no upvalues, so a lift
  // dominated by unnamed upvalues (upvN) and nil receivers ((nil).Url,
  // v(nil)) is an inner helper closure picked as the root, not the payload.
  // Calibrated on the v14 references: real lifts stay <= 0.12 per line
  // (large v14.9 partial lifts included), fragments run 0.6+.
  const frag = (text.match(/\bupv\d+(?:_\d+)?\b/g) || []).length +
               (text.match(/\(nil\)[.:[(]|\bv\(nil\)/g) || []).length;
  if (frag >= 2 && frag * 10 >= lines * 3) score += 40;
  // Luraph's own VM interpreter lifted as the "payload": register-file soup
  // (`local r1 = (t1[2])[1]`). Payload lifts get inferred names -- every
  // committed v15 output and v14.7/14.8 reference has 0 raw rN, large v14.9
  // partial lifts ~0.3 per 100 lines; the interpreter lift runs 500+ at 1.5+.
  const regs = (text.match(/\br\d+\b/g) || []).length;
  if (regs >= 100 && regs * 100 >= lines) score += 40;
  return score;
}

const V14_PROBE_OBJECT = 'ScreenGui|Frame|Path2D|Folder|ImageButton|TextLabel';
const V14_PROBE_SIGNAL = 'Destroying|DescendantRemoving|DescendantAdded|ChildRemoved|ChildAdded|AncestryChanged|Changed';

function stripV14ProbeSuite(code) {
  // Remove Luraph v14's compact anti-analysis fingerprint: empty task
  // callbacks, throwaway ScreenGui/Frame/Path2D/Folder trees, and immediate
  // signal connect/disconnect pairs. Patterns stay narrow, so a light gate
  // suffices to leave ordinary user code alone.
  const lines = code.split('\n');
  const emptyTask = /^task\.(?:spawn|delay)\(.*function\([^)]*\)$/;
  const probeNew = new RegExp(`^local\\s+(\\w+)\\s*=\\s*Instance\\.new\\("(?:${V14_PROBE_OBJECT})"(?:,.*)?\\)$`);
  const collapsed = new RegExp(`^local\\s+(\\w+)\\s*=\\s*(.+?)\\.(?:${V14_PROBE_SIGNAL}):Connect\\(function\\([^)]*\\)\\s*end\\)\\s*;?\\s*\\1:Disconnect\\(\\)$`);
  const connectHead = new RegExp(`^local\\s+(\\w+)\\s*=\\s*(.+)\\.(?:${V14_PROBE_SIGNAL}):Connect\\(function\\([^)]*\\)$`);
  const isNoise = (t) => /^(?:--@|-- \[envlog\]|--)/.test(t);
  const skipNoise = (i) => { while (i < lines.length && isNoise(lines[i].trim())) i++; return i; };

  let sig = 0;
  for (let i = 0; i < lines.length && sig < 2; i++) {
    const t = lines[i].trim();
    if (emptyTask.test(t) || connectHead.test(t) || probeNew.test(t)) sig++;
  }
  if (sig < 2) return code;

  // Game-attached Instance.new trees are the script's real UI, not probes:
  // keep them whole. A probe is a THROWAWAY tree, never parented to a live
  // game object. Follow .Parent (and the 2nd Instance.new arg) up from each
  // instance var; a chain ending at a non-Instance.new token (a service /
  // game object) -- and not nil -- is attached. This is the only change from
  // the reference stripper: it stops it from deleting a CoreGui-parented UI
  // (and the handler attached to it), which left unbalanced, unparseable code.
  const newAny = /^local\s+(\w+)\s*=\s*Instance\.new\("(\w+)"\s*(?:,\s*([\w.]+))?\)/;
  const parentAssign = /^(\w+)\.Parent\s*=\s*([\w.]+)/;
  const instCls = {}, parentTok = {};
  for (const l of lines) {
    const t = l.trim();
    let mm = newAny.exec(t);
    if (mm) { instCls[mm[1]] = mm[2]; if (mm[3]) parentTok[mm[1]] = mm[3]; continue; }
    mm = parentAssign.exec(t);
    if (mm && mm[1] in instCls) parentTok[mm[1]] = mm[2];
  }
  const attached = (v) => {
    const seen = new Set();
    for (;;) {
      const p = parentTok[v];
      if (p === undefined || p === 'nil') return false;
      if (!(p in instCls)) return true;
      if (seen.has(v)) return false;
      seen.add(v); v = p;
    }
  };
  const liveVars = new Set();
  for (const v of Object.keys(instCls)) if (attached(v)) liveVars.add(v);

  const out = [];
  const probeVars = new Set();
  let i = 0;
  while (i < lines.length) {
    const t = lines[i].trim();
    if (emptyTask.test(t)) {
      const j = skipNoise(i + 1);
      if (j < lines.length && lines[j].trim() === 'end)') { i = j + 1; continue; }
    }
    let m = probeNew.exec(t);
    if (m) {
      if (liveVars.has(m[1])) { out.push(lines[i]); i += 1; continue; }  // real game UI
      probeVars.add(m[1]); i += 1; continue;
    }
    if (collapsed.test(t)) { i += 1; continue; }
    m = connectHead.exec(t);
    if (m) {
      const j = skipNoise(i + 1);
      if (j < lines.length && lines[j].trim() === 'end)') {
        const k = skipNoise(j + 1);
        if (k < lines.length && lines[k].trim() === `${m[1]}:Disconnect()`) { i = k + 1; continue; }
      }
    }
    const recv = /^(\w+)(?:\.|:)/.exec(t);
    if (recv && probeVars.has(recv[1])) { i += 1; continue; }
    out.push(lines[i]);
    i += 1;
  }

  code = out.join('\n');
  for (const decl of code.match(/^\s*local\s+(\w+)\s*=\s*game:GetService\("(?:HttpService|RunService)"\)\s*$/gm) || []) {
    const nm = (/local\s+(\w+)/.exec(decl) || [])[1];
    if (!nm) continue;
    const declRe = new RegExp(`^\\s*local\\s+${nm}\\s*=\\s*game:GetService\\("(?:HttpService|RunService)"\\)\\s*$`, 'gm');
    const rest = code.replace(declRe, '');
    if (!new RegExp(`\\b${nm}\\b`).test(rest)) code = rest;
  }
  return code.replace(/\n{3,}/g, '\n\n').trim();
}

function luauParses(job, text) {
  // syntax check with luau-ast (vmmap.loadAst throws SyntaxError on errors)
  const p = path.join(job.outdir || require('os').tmpdir(), `_parsecheck_${process.pid}.luau`);
  try {
    fs.writeFileSync(p, text, 'utf8');
    vmmap.loadAst(p);
    return true;
  } catch (e) {
    return false;
  } finally {
    try { fs.unlinkSync(p); } catch {}
  }
}

function payloadTraceSource(body, strip = true) {
  // Last-resort payload recovery: drop the statement markers, the internal
  // (NUL-prefixed) lines and (strip) the Luraph v14 probe suite. Statements the
  // runtime never marked -- a trailing `print`, for instance -- are kept this way.
  if (!body) return null;
  const body2 = body.split('\n')
    .filter((l) => !/^\s*--@\d+/.test(l))
    .filter((l) => !l.startsWith('\x00'))
    .filter((l) => !/^\s*-- \[envlog\]/.test(l))
    .join('\n');
  const code = strip ? stripV14ProbeSuite(body2) : body2;
  if (!code) return null;
  const kept = code.split('\n').filter((l) => {
    const t = l.trim();
    return t && !t.startsWith('--');
  });
  if (!kept.length) return null;
  return kept.join('\n').trim();
}

module.exports = { run, runGeneric };
