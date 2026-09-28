'use strict';
/* Run a script through the envlog harness and dump the RAW harness output
 * (header includes run status + debug.traceback of script errors).
 * Usage: node scripts/run_raw.js <input.lua> [out.raw.txt] [--prelude FILE]
 */
const fs = require('fs');
const harness = require('../src/harness');
const vmmap = require('../src/vmmap');

(async () => {
  const args = process.argv.slice(2);
  const input = args[0];
  const out = args[1] || input + '.raw.txt';
  let source = fs.readFileSync(input, 'utf8');
  let patched = vmmap.patchEntries(source, input, harness.chunkKey(source));
  patched = vmmap.patchSpin(patched);

  const job = {
    input, sourcePath: input, outdir: '/tmp', path: () => '/tmp/run_raw_job',
    args: { timeout: 120, keepHarness: true },
  };
  const runner = new harness.Runner(job);
  const cfg = { time_budget: 120, devirt: false, spin: 60, trace_globals: true };
  // optional canned FS: argv[3] = virtual path, argv[4] = real file to serve
  if (args[2] && args[3]) {
    cfg.readfile_map = { [args[2]]: fs.readFileSync(args[3], 'latin1') };
    process.stderr.write(`[*] canned file: ${args[2]} <- ${args[3]}\n`);
  }
  // optional extra CFG: argv[4] = path to a JSON file merged into cfg
  // (http_map canned responses, real_json, trace flags, ...)
  if (args[4]) {
    Object.assign(cfg, JSON.parse(fs.readFileSync(args[4], 'utf8')));
    process.stderr.write(`[*] extra cfg: ${args[4]}\n`);
  }
  fs.writeFileSync(input + ".patched.lua", patched, "latin1");
  const res = await runner.run(patched, cfg, {});
  fs.writeFileSync(out, harness.getLastRaw() || '');
  process.stderr.write('[*] run status: ' + (res.body ? harness.traceText(res.body).split('\n')[0] : (res.err || 'no output')) + '\n');
  process.stderr.write('[+] raw output: ' + out + '\n');
  runner.finish();
})().catch(e => { console.error(e); process.exit(1); });
