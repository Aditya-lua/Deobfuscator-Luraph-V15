'use strict';

const { execFileSync } = require('child_process');
const path = require('path');
const fs = require('fs');
const { getPythonBin } = require('./pyenv');

const HERE = __dirname;
const BRIDGE_PATH = path.join(HERE, 'devirt_bridge.py');
const CORE_DIR = path.join(HERE, '..', 'core');

function runBridge(cmd, args) {
  const pythonBin = getPythonBin();
  const env = Object.assign({}, process.env, {
    PYTHONPATH: CORE_DIR,
  });
  const stdout = execFileSync(pythonBin, [BRIDGE_PATH, cmd, ...args], {
    env,
    encoding: 'utf8',
    maxBuffer: 512 * 1024 * 1024,
  });
  return JSON.parse(stdout);
}

function collectRequests(sourcePath, protosPath, chunkPaths = []) {
  const res = runBridge('collect', [sourcePath, protosPath, ...chunkPaths]);
  return {
    stats: res.stats,
    reqs: new Set(res.requests),
    bufs: res.bufs,
  };
}

function liftProgram(sourcePath, protosPath, chunkPaths = [], outputPath = null) {
  const outPath = outputPath || (protosPath + '.devirted.luau');
  const res = runBridge('lift', [sourcePath, protosPath, outPath, ...chunkPaths]);
  let text = '';
  if (fs.existsSync(outPath)) {
    text = fs.readFileSync(outPath, 'utf8');
    if (!outputPath) {
      try { fs.unlinkSync(outPath); } catch {}
    }
  }
  return {
    text,
    stats: res.stats,
    reqs: new Set(res.requests),
    bufs: res.bufs,
  };
}

module.exports = { collectRequests, liftProgram };
