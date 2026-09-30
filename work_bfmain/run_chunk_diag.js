'use strict';
/* Run the ORIGINAL bf_main loader, but with the captured VM chunk pre-patched
 * to a diagnostic wrapper that logs the varargs the loader passes when it
 * calls the chunk. This reveals the hidden VM state (buffers/protos). */
const fs = require('fs');
const harness = require('../src/harness');
const vmmap = require('../src/vmmap');

(async () => {
  const input = 'work_bfmain/input.lua';
  const chunkPath = 'work_bfmain/chunk_diag.lua';
  const origChunkPath = 'work_bfmain/chunk_input.lua';
  let source = fs.readFileSync(input, 'utf8');
  const chunkSrc = fs.readFileSync(chunkPath, 'latin1');
  // the envlog gate indexes pre-patched chunks under the key of the chunk the
  // LOADER GENERATES (the original 435924-byte source), not the wrapper's
  const key = harness.chunkKey(fs.readFileSync(origChunkPath, 'latin1'));
  process.stderr.write('[*] chunk key: ' + key + '\n');

  let patched = vmmap.patchEntries(source, input, harness.chunkKey(source));
  patched = vmmap.patchSpin(patched);

  const job = {
    input, sourcePath: input, outdir: '/tmp', path: () => '/tmp/run_diag_job',
    args: { timeout: 120, keepHarness: true },
  };
  const runner = new harness.Runner(job);
  const cfg = { time_budget: 120, devirt: false, spin: 60, trace_globals: true };
  // arm env._bsdata0 before the loader runs (getgenv()/_G/shared writes by the
  // loader are NOT visible to the chunk's setfenv(ENV) globals in the harness)
  cfg.prelude = fs.readFileSync('work_bfmain/bsdata0_prelude.lua', 'latin1');
  const res = await runner.run(patched, cfg, { [key]: chunkSrc });
  fs.writeFileSync('work_bfmain/chunk_diag_raw.txt', harness.getLastRaw() || '');
  process.stderr.write('[*] run status: ' + (res.body ? harness.traceText(res.body).split('\n')[0] : (res.err || 'no output')) + '\n');
  runner.finish();
})().catch(e => { console.error(e); process.exit(1); });
