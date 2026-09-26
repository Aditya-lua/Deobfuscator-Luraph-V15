#!/usr/bin/env node
'use strict';

const fs = require('fs');
const path = require('path');
const detectModule = require('./src/detect');
const driver = require('./src/driver');

function parseArgs(argv) {
  const args = {
    input: null,
    output: null,
    detect: false,
    noDevirt: false,
    noHooks: false,
    noFold: false,
    debug: false,
    strings: false,
    keepHarness: false,
    keepPreamble: false,
    timeout: 90,
    budget: 30,
    maxRuns: 12,
    devirtRounds: 200,
    executor: 'Wave',
    inputText: null,
  };

  const positional = [];
  for (let i = 0; i < argv.length; i++) {
    const a = argv[i];
    if (a === '--detect') { args.detect = true; }
    else if (a === '--no-devirt') { args.noDevirt = true; }
    else if (a === '--no-hooks') { args.noHooks = true; }
    else if (a === '--no-fold') { args.noFold = true; }
    else if (a === '--debug') { args.debug = true; }
    else if (a === '--strings') { args.strings = true; }
    else if (a === '--keep-harness') { args.keepHarness = true; }
    else if (a === '--keep-preamble') { args.keepPreamble = true; }
    else if (a === '-o' || a === '--output') { args.output = argv[++i]; }
    else if (a === '--timeout') { args.timeout = parseInt(argv[++i], 10); }
    else if (a === '--budget') { args.budget = parseInt(argv[++i], 10); }
    else if (a === '--max-runs') { args.maxRuns = parseInt(argv[++i], 10); }
    else if (a === '--devirt-rounds') { args.devirtRounds = parseInt(argv[++i], 10); }
    else if (a === '--executor') { args.executor = argv[++i]; }
    else if (a === '--input-text') { args.inputText = argv[++i]; }
    else if (!a.startsWith('-')) { positional.push(a); }
  }

  args.input = positional[0] || null;
  return args;
}

class Job {
  constructor(inputPath, source, args, tracePath, debug, obfuscator = '') {
    this.input = inputPath;
    this.source = source;
    this.sourcePath = inputPath;
    this.args = args;
    this.tracePath = tracePath;
    this.debug = debug;
    this.obfuscator = obfuscator;
  }

  creditHeader() {
    return '';
  }

  get base() {
    return this.tracePath.replace(/\.(deobf\.luau|luau)$/, '');
  }

  path(suffix) {
    return this.base + suffix;
  }

  wrote(p) {
    if (this.debug) process.stderr.write(`[+] wrote ${p}\n`);
  }

  write(p, text, encoding = 'utf8') {
    fs.writeFileSync(p, text, { encoding });
    this.wrote(p);
    return p;
  }

  get outdir() {
    return path.dirname(path.resolve(this.tracePath));
  }
}

async function main() {
  const args = parseArgs(process.argv.slice(2));

  if (!args.input) {
    console.error('Usage: node deob.js <input.lua> [-o <output.lua>] [--no-devirt] [--debug] [--detect]');
    process.exit(2);
  }

  const absInput = path.resolve(args.input);
  if (!fs.existsSync(absInput)) {
    console.error(`[!] file not found: ${args.input}`);
    process.exit(1);
  }

  const source = fs.readFileSync(absInput, 'latin1');
  const { plugin, confidence } = detectModule.detect(source);

  if (args.detect) {
    console.log(`${plugin.name}\t${confidence.toFixed(2)}\t${plugin.label}`);
    return;
  }

  process.stderr.write(`[*] obfuscator: ${plugin.label} (detected, ${confidence.toFixed(2)})\n`);

  const outdir = path.join(path.dirname(absInput), 'output');
  fs.mkdirSync(outdir, { recursive: true });

  const tracename = path.basename(absInput).replace(/(\.luau?|\.txt)?$/, '.deobf.luau');
  const os = require('os');
  const workdir = args.debug ? null : fs.mkdtempSync(path.join(os.tmpdir(), 'deobf_node_'));

  const tracePath = args.debug
    ? (args.output || path.join(outdir, tracename))
    : path.join(workdir, tracename);
  const final = args.output || path.join(outdir, path.basename(absInput));

  fs.mkdirSync(path.dirname(path.resolve(final)), { recursive: true });

  try {
    const fixed = detectModule.restoreHeaderNewline(source);
    let jobSource = source;
    let sourcePath = absInput;

    if (fixed !== source) {
      process.stderr.write('[*] header comment ran into the code: split it\n');
      jobSource = fixed;
      sourcePath = path.join(workdir || outdir, path.basename(absInput) + '.src.lua');
      fs.writeFileSync(sourcePath, fixed, 'latin1');
    }

    const job = new Job(absInput, jobSource, args, tracePath, args.debug, plugin.label);
    job.sourcePath = sourcePath;

    let result;
    if (plugin.name === 'luraph_v15') {
      result = await driver.run(job);
    } else {
      result = await driver.runGeneric(job);
    }

    if (final && result && fs.existsSync(result)) {
      let content = fs.readFileSync(result, 'utf8');

      content = content.replace(/^(\s*--(?:[ \t]*(?:Deobfuscated by|Detected obfuscation|Local names are inferred|source:|NOTE: reconstructed|during the trace)[^\n]*\n?|\s*\n))+/, '');
      fs.writeFileSync(final, content, 'utf8');
      process.stderr.write(`[+] result: ${final}\n`);
    } else {
      console.error('[!] no result');
      process.exit(1);
    }
  } finally {
    if (workdir && fs.existsSync(workdir)) {
      try { fs.rmSync(workdir, { recursive: true, force: true }); } catch {}
    }
  }
}

main().catch(err => {
  console.error('[!] Fatal error:', err.message || err);
  process.exit(1);
});
