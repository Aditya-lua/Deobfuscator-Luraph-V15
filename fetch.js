#!/usr/bin/env node
'use strict';

const fs = require('fs');
const path = require('path');
const https = require('https');
const http = require('http');

const USER_AGENTS = [
  'Roblox/WinInet',
  'okhttp/3.10.0',
  'ExploitExecutor',
  'Synapse',
  'Krnl',
];

function fetchWithHeaders(url, customHeaders = {}) {
  return new Promise((resolve, reject) => {
    const parsed = new URL(url);
    const client = parsed.protocol === 'https:' ? https : http;

    const headers = Object.assign({
      'User-Agent': USER_AGENTS[0],
      'Accept': '*/*',
      'Accept-Language': 'en-US,en;q=0.9',
      'Connection': 'close',
    }, customHeaders);

    const req = client.get(url, { headers }, (res) => {
      if (res.statusCode >= 300 && res.statusCode < 400 && res.headers.location) {
        const nextUrl = new URL(res.headers.location, url).href;
        return resolve(fetchWithHeaders(nextUrl, customHeaders));
      }

      const chunks = [];
      res.on('data', chunk => chunks.push(chunk));
      res.on('end', () => {
        const body = Buffer.concat(chunks).toString('latin1');
        resolve({
          statusCode: res.statusCode,
          headers: res.headers,
          contentType: res.headers['content-type'] || '',
          body,
        });
      });
    });

    req.on('error', reject);
    req.setTimeout(15000, () => {
      req.destroy();
      reject(new Error(`Timeout fetching ${url}`));
    });
  });
}

async function fetchBypass(url) {
  for (const ua of USER_AGENTS) {
    try {
      const res = await fetchWithHeaders(url, { 'User-Agent': ua });
      if (res.contentType.includes('text/html') && res.body.includes('<!doctype') && !url.endsWith('.html')) {
        continue;
      }
      if (res.statusCode === 200 && res.body.length > 0) {
        return res;
      }
    } catch {}
  }
  return await fetchWithHeaders(url);
}

function extractChainedUrls(code) {
  const urls = [];
  const re = /(?:game:HttpGet|game:HttpGetAsync|readfile|loadstring)\s*\(\s*["'](https?:\/\/[^"'\\]+)["']/g;
  let m;
  while ((m = re.exec(code)) !== null) {
    if (!urls.includes(m[1])) urls.push(m[1]);
  }
  const urlRe = /"((?:https?:\/\/)[^"\\]+)"|'((?:https?:\/\/)[^'\\]+)'/g;
  while ((m = urlRe.exec(code)) !== null) {
    const u = m[1] || m[2];
    if (u && !urls.includes(u) && !u.includes('discord.gg') && !u.includes('github.com/luau-lang')) {
      urls.push(u);
    }
  }
  return urls;
}

async function main() {
  const args = process.argv.slice(2);
  let targetUrl = null;
  let outputPath = null;

  for (let i = 0; i < args.length; i++) {
    if (args[i] === '-o' || args[i] === '--output') {
      outputPath = args[++i];
    } else if (!args[i].startsWith('-')) {
      targetUrl = args[i];
    }
  }

  if (!targetUrl) {
    console.error('Usage: node fetch.js <url> [-o <output.lua>]');
    process.exit(1);
  }

  console.log(`[*] Fetching: ${targetUrl}`);
  const res = await fetchBypass(targetUrl);

  if (res.statusCode !== 200) {
    console.error(`[!] Server responded with status ${res.statusCode}`);
    process.exit(1);
  }

  console.log(`[+] Received ${res.body.length} bytes (Content-Type: ${res.contentType})`);

  let finalScript = res.body;
  const stageUrls = extractChainedUrls(res.body);

  if (stageUrls.length > 0) {
    console.log(`[*] Detected ${stageUrls.length} secondary URL(s) in loader:`);
    for (const u of stageUrls) {
      console.log(`    -> ${u}`);
    }

    const nextStage = stageUrls.find(u => u.includes('cdn.luarmor.net') || u.includes('raw.githubusercontent') || u.includes('pastebin.com/raw'));
    if (nextStage) {
      console.log(`[*] Automatically fetching next stage payload: ${nextStage}`);
      const nextRes = await fetchBypass(nextStage);
      if (nextRes.statusCode === 200 && nextRes.body.length > 100) {
        console.log(`[+] Stage 2 payload received: ${nextRes.body.length} bytes`);
        const stage2Path = outputPath
          ? outputPath.replace(/\.lua$/, '') + '_stage2.lua'
          : path.join(__dirname, 'output', 'stage2_payload.lua');
        fs.mkdirSync(path.dirname(stage2Path), { recursive: true });
        fs.writeFileSync(stage2Path, nextRes.body, 'latin1');
        console.log(`[+] Stage 2 saved to: ${stage2Path}`);
      }
    }
  }

  if (!outputPath) {
    const outDir = path.join(__dirname, 'output');
    fs.mkdirSync(outDir, { recursive: true });
    const urlMatch = targetUrl.match(/\/([^/?#]+\.lua)/i);
    const fname = urlMatch ? urlMatch[1] : 'fetched_script.lua';
    outputPath = path.join(outDir, fname);
  } else {
    fs.mkdirSync(path.dirname(path.resolve(outputPath)), { recursive: true });
  }

  fs.writeFileSync(outputPath, finalScript, 'latin1');
  console.log(`[+] Successfully saved to: ${outputPath}`);
}

main().catch(err => {
  console.error('[!] Fetch error:', err.message || err);
  process.exit(1);
});
