'use strict';

const { execFileSync } = require('child_process');
const { luauAst } = require('./harness');
const fs = require('fs');

function loadAst(filePath) {
  const exe = luauAst();
  let stdout;
  try {
    stdout = execFileSync(exe, [filePath], { encoding: 'latin1', maxBuffer: 256 * 1024 * 1024 });
  } catch (e) {
    const msg = e.stderr || e.message || '';
    throw new SyntaxError('not valid Luau: ' + msg.trim().split('\n').slice(0, 3).join(' | '));
  }
  return JSON.parse(stdout).root;
}

function loc(node) {
  const [a, b] = node.location.split(' - ');
  const [l1, c1] = a.split(',').map(Number);
  const [l2, c2] = b.split(',').map(Number);
  return [l1, c1, l2, c2];
}

function textOf(lines, node) {
  const [l1, c1, l2, c2] = loc(node);
  if (l1 === l2) return lines[l1].slice(c1, c2);
  return [lines[l1].slice(c1), ...lines.slice(l1 + 1, l2), lines[l2].slice(0, c2)].join('\n');
}

function walkAst(node, fn) {
  if (!node || typeof node !== 'object') return;
  if (Array.isArray(node)) { node.forEach(v => walkAst(v, fn)); return; }
  fn(node);
  Object.values(node).forEach(v => walkAst(v, fn));
}

function localName(expr) {
  if (expr && expr.type === 'AstExprLocal') return expr.local.name;
  return null;
}

const OPS = {
  CompareLt: (a, b) => a < b,
  CompareLe: (a, b) => a <= b,
  CompareGt: (a, b) => a > b,
  CompareGe: (a, b) => a >= b,
  CompareEq: (a, b) => a === b,
  CompareNe: (a, b) => a !== b,
};
const FLIP = {
  CompareLt: 'CompareGt', CompareLe: 'CompareGe',
  CompareGt: 'CompareLt', CompareGe: 'CompareLe',
  CompareEq: 'CompareEq', CompareNe: 'CompareNe',
};

function evalCond(cond, varName, value) {
  if (!cond || cond.type !== 'AstExprBinary' || !OPS[cond.op]) return null;
  const l = cond.left, r = cond.right;
  const op = cond.op;
  if (localName(l) === varName && r.type === 'AstExprConstantNumber')
    return OPS[op](value, r.value);
  if (localName(r) === varName && l.type === 'AstExprConstantNumber')
    return OPS[FLIP[op]](value, l.value);
  return null;
}

function findDispatchers(root) {
  const found = [];
  walkAst(root, n => {
    if (n.type !== 'AstStatWhile') return;
    const cond = n.condition;
    if (!cond || cond.type !== 'AstExprConstantBool' || !cond.value) return;
    const body = n.body.body;
    if (body.length < 2) return;
    const st = body[0];
    if (!['AstStatLocal', 'AstStatAssign'].includes(st.type)) return;
    if ((st.values || []).length !== 1) return;
    let opname;
    if (st.type === 'AstStatLocal') {
      opname = st.vars[0].name;
    } else {
      opname = localName(st.vars[0]);
      if (!opname) return;
    }
    const v = st.values[0];
    if (!v || v.type !== 'AstExprIndexExpr') return;
    const arr = localName(v.expr), pc = localName(v.index);
    if (!arr || !pc || body[1].type !== 'AstStatIf') return;
    found.push({ node: n, op: opname, arr, pc, tree: body[1], rest: body.slice(2) });
  });
  return found;
}

function resolveOp(tree, varName, value) {
  let node = tree;
  while (true) {
    if (!node) return null;
    if (node.type === 'AstStatBlock') {
      if (node.body && node.body.length >= 1 && node.body[0].type === 'AstStatIf' &&
          evalCond(node.body[0].condition, varName, value) !== null) {
        node = node.body[0];
        continue;
      }
      return node;
    }
    if (node.type === 'AstStatIf') {
      const r = evalCond(node.condition, varName, value);
      if (r === null) return node;
      node = r ? node.thenbody : (node.elsebody || null);
      continue;
    }
    return node;
  }
}

function _makerParams(maker) {
  const args = maker.args || [];
  const visible = {};
  args.forEach((a, i) => { visible[a.name] = i; });
  const counts = {}, kcounts = {}, used = new Set();

  function visit(n) {
    if (!n || typeof n !== 'object') return;
    if (Array.isArray(n)) { n.forEach(visit); return; }
    if (n.type === 'AstExprLocal') used.add(n.local.location);

    if (n.type === 'AstExprIndexExpr' && n.expr?.type === 'AstExprLocal' &&
        n.index?.type === 'AstExprIndexExpr' && n.index?.expr?.type === 'AstExprLocal' &&
        n.index.expr.local.location === n.expr.local.location) {
      const k = n.expr.local.location;
      counts[k] = (counts[k] || 0) + 1;
    }

    if (n.type === 'AstExprIndexExpr' && n.expr?.type === 'AstExprLocal' &&
        n.index?.type === 'AstExprConstantNumber') {
      const k = n.expr.local.location;
      kcounts[k] = (kcounts[k] || 0) + 1;
    }
    Object.values(n).forEach(visit);
  }
  visit(maker.body);

  const cands = Object.values(visible).filter(i => i > 0);
  let pi = cands.length
    ? cands.reduce((best, i) => {
        const bc = counts[args[best]?.location] || 0;
        const ic = counts[args[i]?.location] || 0;
        return ic > bc ? i : (ic === bc && i === 1 ? i : best);
      }, cands[0])
    : 1;
  if (!counts[args[pi]?.location]) {
    pi = 1;
    const kc = cands.filter(i => kcounts[args[i]?.location]);
    if (kc.length) pi = kc.reduce((best, i) => (kcounts[args[i].location] > kcounts[args[best].location] ? i : best), kc[0]);
  }
  const others = Object.values(visible).filter(i => i !== 0 && i !== pi && used.has(args[i]?.location)).sort();
  const ui = others.length ? others[0] : pi + 1;
  return [pi, ui];
}

function closureEntries(root) {
  const dispNodes = findDispatchers(root).map(d => d.node);
  const seen = new Map();

  function walk(n, stack) {
    if (!n || typeof n !== 'object') return;
    if (Array.isArray(n)) { n.forEach(v => walk(v, stack)); return; }
    if (n.type === 'AstExprFunction') stack = [...stack, n];
    if (n.type === 'AstStatWhile' && dispNodes.includes(n)) {
      const inner = [...stack].reverse().find(f => f.vararg && (!f.args || f.args.length === 0));
      const outer = [...stack].reverse().find(f => f.args && f.args.length >= 2);
      if (inner && outer) {
        const firstStmt = inner.body.body[0];
        if (firstStmt) {
          const [l1, c1] = loc(firstStmt);
          const [pi] = _makerParams(outer);
          seen.set(`${l1},${c1}`, { l: l1, c: c1, name: outer.args[pi].name });
        }
      }
    }
    Object.values(n).forEach(v => walk(v, stack));
  }
  walk(root, []);
  return [...seen.values()].map(({ l, c, name }) => [l, c, name]);
}

function _declsIn(fn) {
  const keys = {};
  function visit(n) {
    if (!n || typeof n !== 'object') return;
    if (Array.isArray(n)) { n.forEach(visit); return; }
    const t = n.type;
    if (t === 'AstExprFunction' && n !== fn) return;
    if (t === 'AstStatLocal') (n.vars || []).forEach(v => { keys[v.location] = v.name; });
    else if (t === 'AstStatLocalFunction') keys[n.name.location] = n.name.name;
    else if (t === 'AstStatFor') keys[n.var.location] = n.var.name;
    else if (t === 'AstStatForIn') (n.vars || []).forEach(v => { keys[v.location] = v.name; });
    Object.values(n).forEach(visit);
  }
  (fn.args || []).forEach(a => { keys[a.location] = a.name; });
  visit(fn.body);
  return keys;
}

function _captures(info) {
  const makerDecls = _declsIn(info.maker);
  const used = {};
  function visit(n) {
    if (!n || typeof n !== 'object') return;
    if (Array.isArray(n)) { n.forEach(visit); return; }
    if (n.type === 'AstExprLocal') {
      const k = n.local.location;
      if (makerDecls[k]) used[k] = makerDecls[k];
    }
    Object.values(n).forEach(visit);
  }
  visit(info.vm);
  const names = {};
  Object.entries(used).forEach(([k, name]) => { (names[name] = names[name] || []).push(k); });
  const dup = new Set(Object.entries(names).filter(([, ks]) => ks.length > 1).map(([n]) => n));
  const byName = {};
  Object.entries(makerDecls).forEach(([k, nm]) => { (byName[nm] = byName[nm] || []).push(k); });
  return Object.keys(names).filter(nm => !dup.has(nm) && (byName[nm] || []).length === 1).sort();
}

function makerInfo(root) {
  const dispNodes = findDispatchers(root).map(d => d.node);
  const out = new Map();

  function walk(n, stack, stmts) {
    if (!n || typeof n !== 'object') return;
    if (Array.isArray(n)) { n.forEach(v => walk(v, stack, stmts)); return; }
    const t = n.type;
    if (t === 'AstExprFunction') stack = [...stack, n];
    if (t && t.startsWith('AstStat')) stmts = [...stmts, [n, stack.length]];
    if (t === 'AstStatWhile' && dispNodes.includes(n)) {

      let oi = -1;
      for (let i = stack.length - 1; i >= 0; i--) {
        if ((stack[i].args || []).length >= 2) { oi = i; break; }
      }
      if (oi >= 0 && oi + 1 < stack.length) {
        const clo = stack[oi + 1];
        const makerStmts = stmts.filter(([, d]) => d === oi + 1).map(([s]) => s);
        const st = makerStmts[makerStmts.length - 1];
        if (st && st.type === 'AstStatAssign') {
          (st.vars || []).forEach((v, idx) => {
            const e = (st.values || [])[idx];
            if (e === clo && localName(v)) {
              const [, , l2, c2] = loc(st);
              const key = `${l2},${c2}`;
              if (!out.has(key)) {
                const [pi, ui] = _makerParams(stack[oi]);
                out.set(key, {
                  at: [l2, c2], var: localName(v),
                  proto: stack[oi].args[pi].name,
                  proto_index: pi, upvals_index: ui,
                  pf_key: stack[oi].args[pi].name,
                  maker: stack[oi], vm: clo, stmt: st,
                });
              }
            }
          });
        }
      }
    }
    Object.values(n).forEach(v => walk(v, stack, stmts));
  }
  walk(root, [], []);
  const results = [...out.values()];
  results.forEach(info => { info.captures = _captures(info); });
  return results;
}

function patchEntries(source, filePath, chunkTag) {
  const root = loadAst(filePath);
  const lines = source.split('\n');
  const tag = chunkTag;
  const edits = [];

  for (const [l1, c1, name] of closureEntries(root)) {
    const k = `(${name} or __PID)`;
    edits.push([l1, c1,
      `if not __PID[${k}] then __PID.n=__PID.n+1;__PID[${k}]=__PID.n;end;` +
      `__ENT.n=__ENT.n+1;__ENT[__ENT.n%64]=__PID[${k}];__PLAST[__PID[${k}]]=__ENT.n;` +
      `if __SKIPP[__PID[${k}]] then return end;`
    ]);
  }

  for (const info of makerInfo(root)) {
    const [l2, c2] = info.at;
    const pv = info.proto;
    const v = info.var;
    const pfKey = info.pf_key || pv;
    let code = ` __PF[${v}]=${pfKey} `;
    const cap = info.captures.map(nm => `__PA[${pv}].${nm}=${nm};`).join('');
    code += `if __PA and not __PA[${pv}] then __PA[${pv}]={};__PA.n=__PA.n+1;__PA[${pv}].__seq=__PA.n;` +
            `__PA[${pv}].__maker="${tag}@${l2},${c2}";__PK[${pfKey}]=${v};${cap} end `;
    edits.push([l2, c2, code]);
  }

  edits.sort((a, b) => b[0] !== a[0] ? b[0] - a[0] : b[1] - a[1]);
  for (const [l, c, code] of edits) {
    lines[l] = lines[l].slice(0, c) + code + lines[l].slice(c);
  }
  return lines.join('\n');
}

function patchSpin(src) {
  return src.replace(
    /while true do (?:local )?[A-Za-z_]+(?:,[A-Za-z_]+)*=[A-Za-z_]+\[[A-Za-z_]+\];/g,
    m => m + '__SPIN.n=__SPIN.n+1;if __SPIN.n>=__SPIN.step then __SPIN.f()end;'
  );
}

module.exports = {
  loadAst, loc, textOf, walkAst, localName,
  findDispatchers, resolveOp, evalCond,
  closureEntries, makerInfo, patchEntries, patchSpin,
};
