'use strict';
/* Patch a primed Luarmor input the way the driver does (entry tags + spin
 * rewrite) so serve-mode runs behave like run_raw runs.
 * Usage: node scripts/patch_primed.js <input.lua>  -> writes <input>.patched.lua */
const fs = require('fs');
const path = require('path');
const vmmap = require(path.join(__dirname, '..', 'src', 'vmmap'));
const harness = require(path.join(__dirname, '..', 'src', 'harness'));

const p = process.argv[2];
let s = fs.readFileSync(p, 'utf8');
s = vmmap.patchEntries(s, p, harness.chunkKey(s));
s = vmmap.patchSpin(s);
fs.writeFileSync(p + '.patched.lua', s, 'latin1');
console.log('patched ->', p + '.patched.lua');
