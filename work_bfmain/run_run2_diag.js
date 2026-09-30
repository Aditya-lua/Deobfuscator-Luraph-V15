'use strict';
/* Replicate deob.js run 2 (vmmap-patched original + chunk instrumented) and
 * capture the FULL envlog incl. the script-error stacktrace. */
const fs = require('fs');
const harness = require('../src/harness');
const vmmap = require('../src/vmmap');

(async () => {
  const input = 'work_bfmain/input.lua';
  let source = fs.readFileSync(input, 'utf8');
  let patched = vmmap.patchEntries(source, input, harness.chunkKey(source));
  patched = vmmap.patchSpin(patched);

  const job = {
    input, sourcePath: input, outdir: '/tmp', path: () => '/tmp/run_diag2',
    args: { timeout: 120, keepHarness: true },
  };
  const runner = new harness.Runner(job);
  const cfg = { time_budget: 120, devirt: false, spin: 60, trace_globals: true };
  cfg.prelude = fs.readFileSync('work_bfmain/bsdata0_prelude.lua', 'latin1');
  const res = await runner.run(patched, cfg, {});
  fs.writeFileSync('work_bfmain/run2_raw.txt', harness.getLastRaw() || '');
  process.stderr.write('[*] run status: ' + (res.body ? harness.traceText(res.body).split('\n')[0] : (res.err || 'no output')) + '\n');
  runner.finish();
})().catch(e => { console.error(e); process.exit(1); });
