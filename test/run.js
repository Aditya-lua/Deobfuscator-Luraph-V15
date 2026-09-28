'use strict';
/* npm test entry: resolves Python the same way the driver does (src/pyenv.js)
 * and hands off to the Python test suite (test/run_all.py). */
const { spawnSync } = require('child_process');
const path = require('path');

const HERE = __dirname;

function findPython() {
  if (process.env.PYTHON_BIN) return process.env.PYTHON_BIN;
  for (const exe of process.platform === 'win32' ? ['python', 'python3'] : ['python3', 'python']) {
    const r = spawnSync(exe, ['--version'], { stdio: 'ignore' });
    if (r.status === 0) return exe;
  }
  process.stderr.write('[!] no Python found: the test suite (and the pipeline) needs one.\n' +
                       '    set PYTHON_BIN or install Python 3.9+\n');
  process.exit(1);
}

const args = process.argv.slice(2);
const res = spawnSync(findPython(), [path.join(HERE, 'run_all.py'), ...args], { stdio: 'inherit' });
if (res.error) {
  process.stderr.write(`[!] failed to run the test suite: ${res.error.message}\n`);
  process.exit(1);
}
process.exit(res.status ?? 1);
