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

function postBody(url, body, contentType = 'text/plain') {
  return new Promise((resolve, reject) => {
    const parsed = new URL(url);
    const client = parsed.protocol === 'https:' ? https : http;
    const payload = Buffer.from(body, 'utf8');
    const req = client.request(url, {
      method: 'POST',
      headers: {
        'User-Agent': USER_AGENTS[0],
        'Content-Type': contentType,
        'Content-Length': payload.length,
        'Connection': 'close',
      },
    }, (res) => {
      const chunks = [];
      res.on('data', chunk => chunks.push(chunk));
      res.on('end', () => resolve({
        statusCode: res.statusCode,
        body: Buffer.concat(chunks).toString('latin1'),
      }));
    });
    req.on('error', reject);
    req.setTimeout(20000, () => {
      req.destroy();
      reject(new Error(`Timeout posting ${url}`));
    });
    req.end(payload);
  });
}

async function fetchJnkieChain(loaderCode) {
  const deliveryUrl = loaderCode.match(/https:\/\/api\.jnkie\.com\/api\/v1\/luascripts\/delivery\/[^\s"']+/);
  if (!deliveryUrl) return null;
  const keyVar = loaderCode.match(/getgenv\(\)\.SCRIPT_KEY\s+or\s+([A-Za-z_][A-Za-z0-9_]*)/);
  const key = keyVar ? (process.env[keyVar[1]] || process.env.JNKIE_KEY || '') : (process.env.JNKIE_KEY || '');
  console.log(`[*] JNKIE delivery chain detected (key var: ${keyVar ? keyVar[1] : 'none'}, key ${key ? 'provided' : 'empty'})`);
  const res = await postBody(deliveryUrl[0], key);
  console.log(`[*] Delivery API status: ${res.statusCode}`);
  if (res.statusCode !== 200) {
    console.error(`[!] Delivery denied: ${res.body.slice(0, 200)}`);
    process.exit(1);
  }
  const body = res.body.trim();
  if (!body.startsWith('https://cdn.jnkie.com/')) {
    console.error('[!] Unexpected delivery response');
    process.exit(1);
  }
  console.log(`[*] Following CDN payload: ${body}`);
  const payload = await fetchBypass(body);
  if (payload.statusCode !== 200 || payload.body.length < 100) {
    console.error(`[!] CDN fetch failed (status ${payload.statusCode})`);
    process.exit(1);
  }
  console.log(`[+] Luraph payload received: ${payload.body.length} bytes`);
  return payload.body;
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

  const jnkiePayload = await fetchJnkieChain(res.body);
  if (jnkiePayload) {
    finalScript = jnkiePayload;
    const payloadPath = outputPath
      ? outputPath.replace(/\.lua$/, '_payload.lua')
      : path.join(__dirname, 'output', 'jnkie_payload.lua');
    fs.mkdirSync(path.dirname(payloadPath), { recursive: true });
    fs.writeFileSync(payloadPath, finalScript, 'latin1');
    console.log(`[+] Payload saved to: ${payloadPath}`);
    outputPath = payloadPath;
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
