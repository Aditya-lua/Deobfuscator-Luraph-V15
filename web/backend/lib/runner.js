'use strict';

// Runs one deobfuscation as an isolated, resource-limited subprocess.
//
// The engine *executes* the uploaded payload in the luau sandbox to trace it,
// so every run is treated as hostile: its own temp dir, a wall-clock timeout, a
// ulimit cap on memory and CPU, its own process group (so a hung child tree is
// killed in one shot), and no inherited ambient state beyond what it needs.

const { spawn } = require('child_process');
const fs = require('fs');
const path = require('path');
const os = require('os');
const crypto = require('crypto');
const config = require('../config');

function newJobId() {
  return crypto.randomBytes(12).toString('hex');
}

function jobDir(id) {
  return path.join(config.WORK_ROOT, id);
}

// Build the argv that runs the engine under ulimit. We go through `bash -c` so
// the rlimits apply to node *and* the python/luau children it spawns (rlimits
// are inherited across fork/exec). `exec` keeps the pid we track as the group
// leader rather than leaving a bash wrapper in between.
function buildCommand(inputPath, outputPath) {
  const parts = [];
  if (config.JOB_MEM_KB > 0) parts.push(`ulimit -v ${config.JOB_MEM_KB}`);
  if (config.JOB_CPU_SECONDS > 0) parts.push(`ulimit -t ${config.JOB_CPU_SECONDS}`);
  // shell-quote the three paths we control; they are server-generated temp
  // paths, but quote defensively anyway.
  const q = (s) => `'${String(s).replace(/'/g, `'\\''`)}'`;
  const node = process.execPath;
  const timeoutS = Math.ceil(config.JOB_TIMEOUT_MS / 1000);
  parts.push(
    `exec ${q(node)} ${q(config.DEOB_ENTRY)} ${q(inputPath)} -o ${q(outputPath)} ` +
    `--timeout ${timeoutS}`
  );
  return parts.join('; ');
}

// Run a deobfuscation. Resolves with { ok, detect, output, stderr, timedOut }.
// `output` is the path to the deobfuscated file on success. Never rejects for a
// tool-level failure -- only for a programmer error setting the job up.
function runDeob(id, originalName, buffer) {
  return new Promise((resolve) => {
    const dir = jobDir(id);
    fs.mkdirSync(dir, { recursive: true });

    // Preserve a sane extension so the detector/engine treat it correctly; the
    // basename is server-generated, never the user's filename.
    const ext = /\.(lua|luau|txt)$/i.test(originalName)
      ? originalName.slice(originalName.lastIndexOf('.'))
      : '.lua';
    const inputPath = path.join(dir, `input${ext}`);
    const outputPath = path.join(dir, 'output.luau');
    fs.writeFileSync(inputPath, buffer);

    const cmd = buildCommand(inputPath, outputPath);
    const child = spawn('bash', ['-c', cmd], {
      cwd: config.REPO_ROOT,
      detached: true, // own process group, so we can kill the whole tree
      env: {
        PATH: process.env.PATH,
        HOME: os.tmpdir(),
        PYTHON_BIN: config.PYTHON_BIN,
        DEOB_STACK_BUDGET: String(config.STACK_BUDGET_SECONDS),
        // No network, no secrets, nothing else inherited.
      },
      stdio: ['ignore', 'pipe', 'pipe'],
    });

    let stdout = '';
    let stderr = '';
    const CAP = 256 * 1024; // keep logs bounded
    child.stdout.on('data', (d) => { if (stdout.length < CAP) stdout += d.toString('utf8'); });
    child.stderr.on('data', (d) => { if (stderr.length < CAP) stderr += d.toString('utf8'); });

    let timedOut = false;
    let settled = false;

    const killTree = (signal) => {
      try { process.kill(-child.pid, signal); } catch { /* already gone */ }
    };

    const timer = setTimeout(() => {
      timedOut = true;
      killTree('SIGKILL');
    }, config.JOB_TIMEOUT_MS);

    const finish = (result) => {
      if (settled) return;
      settled = true;
      clearTimeout(timer);
      // Delete the raw upload immediately; keep only the output for download.
      try { fs.unlinkSync(inputPath); } catch {}
      resolve(result);
    };

    child.on('error', (err) => {
      finish({ ok: false, error: `failed to start engine: ${err.message}`, stderr });
    });

    child.on('close', (code) => {
      const haveOutput = fs.existsSync(outputPath) && fs.statSync(outputPath).size > 0;
      if (timedOut) {
        finish({ ok: false, timedOut: true, error: 'deobfuscation timed out', stderr });
        return;
      }
      if (!haveOutput) {
        finish({ ok: false, error: 'engine produced no output', code, stderr });
        return;
      }
      // Pull the detected obfuscator label out of the engine's stderr banner.
      const m = /\[\*\] obfuscator: ([^\n(]+)\(detected, ([0-9.]+)\)/.exec(stderr);
      finish({
        ok: true,
        output: outputPath,
        detect: m ? { label: m[1].trim(), confidence: parseFloat(m[2]) } : null,
        stderr,
      });
    });
  });
}

function cleanupJob(id) {
  const dir = jobDir(id);
  fs.rm(dir, { recursive: true, force: true }, () => {});
}

module.exports = { runDeob, newJobId, jobDir, cleanupJob };
