'use strict';

const LURAPH_HEADER = /This file was protected using Luraph Obfuscator v(\d+)(?:\.(\d+))?/;

// The Luraph header is the authoritative version marker, but real-world
// distributions wrap the payload in an anti-leak / telemetry preamble
// (a `pcall(function()` Discord-webhook guard, a `__panda_elc_` kill-switch,
// etc.) that pushes the header far past byte 0 -- observed up to ~120 KB in.
// The header string is unique enough that scanning the whole source cannot
// false-positive, so look for it everywhere, not just in a 500-byte window.
function findLuraphHeader(source) {
  return LURAPH_HEADER.exec(source);
}
const LURAPH_VM_SHAPE = /\[\d+\]=(bit32|buffer|string|table|math)\.\w+/;
// v15 chunks primed by loader stubs (Luarmor etc.) start with loader lines
// (script_key/_bsdata0/blob tables); the VM chunk starts later with
// `return setmetatable({` — usually at a line start, sometimes directly
// after the stub's closing long-bracket (`]]]]return setmetatable...`).
// Scan the first 64 KB for that boundary (the VM-shape check below is the
// real validator).
const VM_CHUNK_START = /[\s\]]*return setmetatable\(\{/;

function detectLuraph(source) {
  const m = findLuraphHeader(source);
  if (m) {
    return m[1] === '15' ? 1.0 : 0.3;
  }
  const head = source.slice(0, 65536);
  const vm = VM_CHUNK_START.exec(head);
  if (vm) {
    const at = vm.index + vm[0].length - 'return setmetatable({'.length;
    const chunkHead = source.slice(at, at + 2000);
    if (LURAPH_VM_SHAPE.test(chunkHead) || source.slice(at, at + 200000).includes('LPH')) {
      return 0.8;
    }
  }
  return 0.0;
}

const HEADER_LINE_RE = /\s*--[ \t]*This file was protected using Luraph Obfuscator v[\d.]+[ \t]*\[https?:\/\/lura\.ph\/?\]/;

function restoreHeaderNewline(source) {
  const m = HEADER_LINE_RE.exec(source);
  if (m) {
    const end = m.index + m[0].length;
    const next = source[end];
    if (next !== '' && next !== '\n' && next !== '\r') {
      return source.slice(0, end) + '\n' + source.slice(end).replace(/^[ \t]+/, '');
    }
  }
  return source;
}

// Luarmor whitelist client (see docs/LUARMOR_NOTES.md §9 for the rationale).
// These files are auth-gated loaders around a Luraph-VM constant layer; they
// are not devirtualizable, so detection exists to classify and route them.
const LUARMOR_SIGS = [
  /luarmor\.net|Luarmor/i,
  /\bluraph_runtime1\s*\(/,
  /GetTutorialState\(\s*"nil\s+nil\s+/,
  /getfenv\(\)\s*\[\s*tbl\w+\s*\]\s*=/,
  /writefile\(\s*"luarmor-error-log\.txt"/,
  /[a-z]{1,3}\d-roblox-auth\.luarmor\.net/,
  /ce_like_loadstring_fn/,
  /Kick\(\s*"\[Luarmor\]/,
];

function detectLuarmor(source) {
  let hits = 0;
  for (const rx of LUARMOR_SIGS) {
    if (rx.test(source)) hits += 1;
  }
  if (hits >= 4) return 1.0;
  if (hits >= 3) return 0.9;
  if (hits >= 2) return 0.7; // single-sig canaries live below the 0.5 gate
  return 0.0;
}

// Luraph v14.x: a different VM layout (repeat dispatchers, argument-0
// prototypes, initializer factories) handled by the luraph_v14 engine.
// v14.7-v14.9 are the supported builds; older v14.x routes here too (best
// effort, lower confidence). Headerless v14 shapes never start with v15's
// `return setmetatable({`, so they cannot steal v15 inputs.
function detectLuraph14(source) {
  const m = findLuraphHeader(source);
  if (!m) {
    // Headerless v14: the VM entry (`return(function()` / `return({`) may sit
    // behind a wrapper preamble, so match it line-anchored within a bounded
    // window instead of only at offset 0. A v15 chunk starts with
    // `return setmetatable({`, a shape these patterns never match; and on the
    // rare headerless tie, detect()'s strict-greater rule keeps v15 ahead.
    const head = source.slice(0, 131072);
    if (/(?:^|\n)[ \t]*return\(function\(\)/.test(head) && /loadstring/.test(head)) return 0.8;
    if (/(?:^|\n)[ \t]*return\(\{/.test(head) && /bit32|loadstring/.test(source.slice(0, 200000))) return 0.8;
    if (/(?:^|\n)[ \t]*local init = \(function\(\.\.\./.test(head) && source.includes('return({')) return 0.4;
    return 0.0;
  }
  if (m[1] === '14') {
    if (m[2] === '7' || m[2] === '8' || m[2] === '9') return 1.0;
    return 0.5;
  }
  return 0.0;
}

const PLUGINS = [
  {
    name: 'luraph_v15',
    label: 'Luraph v15',
    detect: detectLuraph,
  },
  {
    name: 'luraph_v14',
    label: 'Luraph v14.x',
    detect: detectLuraph14,
  },
  {
    name: 'luarmor_client',
    label: 'Luarmor whitelist client (loader; payload not devirtualizable)',
    detect: detectLuarmor,
  },
];

function detect(source) {
  let best = { plugin: null, confidence: 0 };
  for (const p of PLUGINS) {
    const c = p.detect(source);
    if (c > best.confidence) best = { plugin: p, confidence: c };
  }
  if (best.confidence < 0.5) {
    return { plugin: { name: 'generic', label: 'unknown obfuscator (behaviour trace only)' }, confidence: 0 };
  }
  return { plugin: best.plugin, confidence: best.confidence };
}

function byName(name) {
  const p = PLUGINS.find(x => x.name === name);
  if (!p) throw new Error(`Unknown obfuscator '${name}' (known: ${PLUGINS.map(x => x.name).join(', ')})`);
  return p;
}

module.exports = { detect, byName, restoreHeaderNewline, PLUGINS };
