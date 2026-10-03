/* Client-side Luraph detector.
 *
 * A faithful port of the engine's src/detect.js so the browser gives the same
 * verdict as the server without an upload round-trip. Detection is pure string
 * analysis -- it never executes the script -- so it is safe to run in-page.
 * Keep this in sync with src/detect.js if the heuristics change.
 */
(function (global) {
  'use strict';

  var LURAPH_HEADER = /This file was protected using Luraph Obfuscator v(\d+)(?:\.(\d+))?/;
  var VM_CHUNK_START = /[\s\]]*return setmetatable\(\{/;

  function findHeader(src) { return LURAPH_HEADER.exec(src); }

  function detectV15(src) {
    var m = findHeader(src);
    if (m) return m[1] === '15' ? 1.0 : 0.3;
    var head = src.slice(0, 65536);
    var vm = VM_CHUNK_START.exec(head);
    if (vm) {
      var at = vm.index + vm[0].length - 'return setmetatable({'.length;
      var chunkHead = src.slice(at, at + 2000);
      if (/\[\d+\]=(bit32|buffer|string|table|math)\.\w+/.test(chunkHead) ||
          src.slice(at, at + 200000).indexOf('LPH') !== -1) {
        return 0.8;
      }
    }
    return 0.0;
  }

  function detectV14(src) {
    var m = findHeader(src);
    if (!m) {
      var head = src.slice(0, 131072);
      if (/(?:^|\n)[ \t]*return\(function\(\)/.test(head) && /loadstring/.test(head)) return 0.8;
      if (/(?:^|\n)[ \t]*return\(\{/.test(head) && /bit32|loadstring/.test(src.slice(0, 200000))) return 0.8;
      if (/(?:^|\n)[ \t]*local init = \(function\(\.\.\./.test(head) && src.indexOf('return({') !== -1) return 0.4;
      return 0.0;
    }
    if (m[1] === '14') {
      if (m[2] === '7' || m[2] === '8' || m[2] === '9') return 1.0;
      return 0.5;
    }
    return 0.0;
  }

  var LUARMOR_SIGS = [
    /luarmor\.net|Luarmor/i,
    /\bluraph_runtime1\s*\(/,
    /writefile\(\s*"luarmor-error-log\.txt"/,
    /Kick\(\s*"\[Luarmor\]/,
  ];
  function detectLuarmor(src) {
    var hits = 0;
    for (var i = 0; i < LUARMOR_SIGS.length; i++) if (LUARMOR_SIGS[i].test(src)) hits++;
    if (hits >= 3) return 0.9;
    if (hits >= 2) return 0.7;
    return 0.0;
  }

  var PLUGINS = [
    { name: 'luraph_v15', label: 'Luraph v15', detect: detectV15 },
    { name: 'luraph_v14', label: 'Luraph v14.x', detect: detectV14 },
    { name: 'luarmor_client', label: 'Luarmor whitelist client (loader)', detect: detectLuarmor },
  ];

  function detect(src) {
    var best = { plugin: null, confidence: 0 };
    for (var i = 0; i < PLUGINS.length; i++) {
      var c = PLUGINS[i].detect(src);
      if (c > best.confidence) best = { plugin: PLUGINS[i], confidence: c };
    }
    if (best.confidence < 0.5) {
      return { name: 'generic', label: 'Unknown / not Luraph (behaviour trace only)', confidence: 0 };
    }
    // Refine the human-facing version string from the header when present.
    var m = findHeader(src);
    var version = m ? ('v' + m[1] + (m[2] !== undefined ? '.' + m[2] : '')) : null;
    return { name: best.plugin.name, label: best.plugin.label, confidence: best.confidence, version: version };
  }

  global.LuraphDetect = { detect: detect };
})(window);
