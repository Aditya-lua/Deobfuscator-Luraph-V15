# Luraph v15 Deobfuscator

[![CI](https://github.com/Aditya-lua/Deobfuscator-Luraph-V15/actions/workflows/ci.yml/badge.svg)](https://github.com/Aditya-lua/Deobfuscator-Luraph-V15/actions/workflows/ci.yml)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![Platform](https://img.shields.io/badge/Node.js-18%2B-green.svg)](https://nodejs.org/)
[![Target](https://img.shields.io/badge/Target-Luraph%20v15-red.svg)](https://lura.ph/)

A standalone, high-performance deobfuscator for Roblox Luau scripts protected by **Luraph v15**.

---

## Overview

Luraph v15 compiles Luau scripts into an interpreted virtual machine (VM) with flattened dispatch loops, encrypted memory buffers (`LPH_ENCSTR`, `LPH_ENCFUNC`), and anti-tamper crash traps (`LPH_CRASH()`).

This tool acts as a reverse compiler:
- Recovers original control flow structures (`if/else`, `while`, `for`, `repeat/until`) from low-level VM dispatchers.
- Decrypts lazy in-memory constants using a live sandboxed Luau runtime.
- Isolates and bypasses anti-tamper traps to discover hidden code paths.

---

## How It Works

The deobfuscator operates across 5 stages:

```
┌────────────────────────┐
│ Protected Luraph Script│
└───────────┬────────────┘
            │
            ▼
┌────────────────────────┐
│ 1. AST Hooking         │ ➔ Discovers VM dispatchers & hooks closure makers
└───────────┬────────────┘
            │
            ▼
┌────────────────────────┐
│ 2. Sandboxed Simulation│ ➔ Runs in offline Roblox VM; isolates anti-tamper traps
└───────────┬────────────┘
            │
            ▼
┌────────────────────────┐
│ 3. Live REPL Decryption│ ➔ Queries in-memory Luau VM to decrypt lazy constants
└───────────┬────────────┘
            │
            ▼
┌────────────────────────┐
│ 4. CFG & SSA Lifting   │ ➔ Reconstructs control flow graph & loop structures
└───────────┬────────────┘
            │
            ▼
┌────────────────────────┐
│ 5. Polish & Naming     │ ➔ Infers local variable names from Roblox API usage
└───────────┬────────────┘
            │
            ▼
┌────────────────────────┐
│ Clean Luau Source Code │
└────────────────────────┘
```

1. **AST Analysis & Hooking (`vmmap`)**:
   Parses the input script with `luau-ast` to map out the VM interpreter loop and closure constructors. Injects non-destructive telemetry hooks to track proto execution and register states.

2. **Sandboxed Simulation (`harness`)**:
   Executes the script inside an isolated, offline Roblox engine emulator (`envlog.luau`). If execution encounters an anti-tamper trap (`LPH_CRASH()`), the engine identifies the responsible function, disables the trap path, and reruns along stable branches.

3. **Live REPL Memory Decryption (`devirt`)**:
   Luraph's lazy encryption requires dynamic decryption keys. The engine communicates directly with an active Luau REPL process via IPC to decrypt string and numerical constants live in memory.

4. **Control Flow Graph (CFG) Reconstruction (`structure`, `loops`)**:
   Uses Sparse Conditional Constant Propagation (SCCP) to trace virtual register values. Basic blocks are assembled into a control flow graph, restoring nested loops (`while`, `for`, `for-in`) and branching logic (`if/elseif/else`).

5. **Polish & Variable Naming (`backend`, `names`)**:
   Virtual registers are analyzed across basic blocks using Static Single Assignment (SSA) web analysis. Variables are assigned context-aware names based on Roblox API usage (e.g. `Players`, `TweenService`, `ReplicatedStorage`), and the output is verified through syntax compilation.

> For compiler theory, opcode mechanics, and detailed analysis passes, see [TECHNICAL.md](TECHNICAL.md).

---

## Features

- **Full Devirtualization**: Recovers high-level control flow, closures, and scoping instead of simple trace logging.
- **Optimized Symbolic Engine**: Shared mode-dispatch cache, iterative AST traversal, and declaration memoization deliver up to 2.1x faster devirtualization.
- **Robust Table Lifting**: Handles `table.pack`-style packed lists (`{n = count}`) in VM registers, plus symbolic indexing, comparison, and boolean coercion on packed values.
- **Fast-Path Engine**: Skips redundant verification passes once all constants are decoded live.
- **Offline Roblox Sandbox**: Includes offline models for Roblox services, `Path2D`, `UDim2`, `Vector3`, `CFrame`, and executor globals. No Roblox client needed.
- **Self-Contained**: Luau binaries, runtime emulators, and analysis modules are bundled directly inside this repository.
- **Fail-Loud Error Handling**: Per-function error isolation during devirtualization — a function that cannot be lifted becomes an explicit `error("...")` stub with a report instead of crashing the whole run or silently emitting wrong code. Unknown control-flow blocks raise a loud `SError` rather than being guessed.
- **Hardened Instrumentation Sandbox**: The live Luau probe runs behind a `getfenv`/`loadstring` shield with a per-run nonce protocol, so protected scripts cannot spoof or tamper with the telemetry the lifter relies on. Subprocesses are hard-timeout guarded on every platform.
- **Cross-Platform**: Windows and Linux out of the box, verified by CI on both operating systems.
- **Tested & CI-Verified**: A fast unit + cross-language protocol suite (`npm test`) plus a byte-for-byte golden regression against committed reference outputs run automatically on every push via GitHub Actions.

---

## Quick Start

### Prerequisites
- **OS**: Windows or Linux (the CI suite runs on both)
- **Node.js**: v18.0.0 or higher
- **Python**: 3.10 or higher (powers the backend symbolic execution engine)

### Installation
Clone the repository and install dependencies:
```bash
git clone https://github.com/Aditya-lua/Deobfuscator-Luraph-V15.git
cd Deobfuscator-Luraph-V15
npm install
```

### Basic Commands
```bash
# Deobfuscate a single script (saves to ./output/<filename>)
node deob.js input.lua

# Save to a specific output path
node deob.js input.lua -o output.lua

# Batch mode: process a whole folder of scripts
node deob.js ./my_scripts_folder/

# Batch mode: process multiple files at once
node deob.js file1.lua file2.lua file3.lua

# Fast trace-only mode (~2 seconds, skips bytecode lifting)
node deob.js input.lua --no-devirt

# Detect if a script is protected by Luraph without running it
node deob.js input.lua --detect
```

> **Note:** If your system uses a different Python command (`py`, `python3`, or a virtual environment binary), set the `PYTHON_BIN` environment variable:
> ```bash
> set PYTHON_BIN=py        # Windows
> export PYTHON_BIN=python3   # Linux / macOS
> ```

### Development & Tests
```bash
# Fast test suite: unit tests + cross-language protocol consistency (no Luau build needed)
npm test

# Full regression: rebuild the pipeline for the benchmark samples and compare
# byte-for-byte with the committed reference outputs (needs python build_luau.py first)
python test/run_all.py --golden
```
Harness-protocol constants shared between the Python core, the Node driver and the Luau runtime live in `protocol.json`; `test/protocol_test.py` fails when any copy drifts. See [TECHNICAL.md](TECHNICAL.md) for the environment-variable reference and CI details.

CI (`.github/workflows/ci.yml`) runs the fast suite on Ubuntu **and** Windows on every push, then builds the patched Luau runtime (with binary caching) and runs the full golden regression on Ubuntu — so the committed reference outputs can never silently rot.

---

## FlowAuth Crack (moved)

The FlowAuth loader-chain toolkit (live loader emulator, v3 protocol crack, payload
capture + devirtualization probes) now lives in its own repo:
**[Aditya-lua/FlowAuth-Deobfuscator](https://github.com/Aditya-lua/FlowAuth-Deobfuscator)**
— split out to keep this repo focused on the generic Luraph devirtualizer. The
sandbox harness (`runtime/envlog.luau`), the patched Luau runtime and the devirt
core (`src/vmmap`, `core/devirt.py`) used by that pipeline remain here.

## Performance

The engine has been heavily optimized (symbolic AST caching, iterative tree walks, single-pass state analysis, shared dispatch-loop cache, and a bounded SCCP walk). Measured on the bundled `sample/` scripts, the current build is **1.6x to 1.8x faster** than the previous release, and scripts that previously crashed now lift completely. A subsequent profile-driven pass over the hot paths added another **~25% end-to-end** speedup on top of the numbers below:

| Benchmark | Size | Functions | Before | After | Speedup |
|---|---|---|---|---|---|
| `Blox Fruit.lua` | 646 KB | 520 | 2m 04s | **1m 02s** | **2.0x** |
| `+1 Speed Keyboard Escape.lua` | 543 KB | 316 | 1m 17s | **37s** | **2.1x** |
| `Grow A Garden 2 (1).lua` | 645 KB | 545 | 3m 51s | **2m 25s** | **1.6x** |
| `Grow a Garden.lua` | 804 KB | 767 | 1m 54s | **1m 51s** | **1.0x** |
| `9eccab05cff67267.lua` | 222 KB | 36 | *crashed* | **4m 02s** | fixed |
| `5ae248d6527b5c01.lua` | 170 KB | 1 | 3.7s | **3.7s** | — |

Additional stress tests on fresh scripts (run once with the current build, no baseline):

| Stress Test | Size | Functions | Time | Result |
|---|---|---|---|---|
| `StealAnEgg.lua` | **1.62 MB** | 1,723 | **12m 21s** | 32,435 lines (1.8 MB) |
| `Steal-a-Brainrot.lua` | **1.07 MB** | 1,138 | **6m 59s** | 19,407 lines (463 KB) |
| `JumpForAnimals.lua` | 503 KB | 457 | **1m 38s** | 7,217 lines (160 KB) |
| `RideAPet.lua` | 397 KB | 328 | **55s** | 5,170 lines (113 KB) |

Every input and its reference deobfuscated output is committed in `sample/` and `sample/output/`. All outputs pass `luau-ast` syntax validation (`COMPILE OK`). `StealAnEgg.lua` lifts 99.97% of its 1,723 functions; the remaining 46 blocks (0.03%) are guarded with an explicit `error("devirt: unexplored successor ...")` marker instead of silently emitting wrong code.

**Reproduce it yourself** — every input in the table above ships in [`sample/`](sample/) and the expected deobfuscated result for each one is committed in [`sample/output/`](sample/output), so you can verify both the timings and the output quality on your own machine:

```bash
node deob.js "sample/Blox Fruit.lua" -o "output/Blox Fruit.lua"
node deob.js "sample/9eccab05cff67267.lua" -o "output/9eccab05cff67267.lua"
```

Hardware used for the table: consumer Windows machine, Node.js 24, Python 3.12. Exact times vary with CPU and background load; the relative speedup holds.

---

## Frequently Asked Questions (FAQ)

### Q: How long does deobfuscation take?

| Script Size | Function Count | Average Time | Mode |
|---|---|---|---|
| **Small / Micro Script** | 1 – 20 functions | **1 – 5 seconds** | Full Devirtualize |
| **Medium Script (Hubs)** | 50 – 200 functions | **15 – 35 seconds** | Full Devirtualize |
| **Large Script (Full Games / Complex)** | 500 – 750+ functions | **1 – 2 minutes** | Full Devirtualize |
| **Any Script** (Trace Mode) | Any size | **1 – 3 seconds** | `--no-devirt` |

### Q: Why do large scripts take 1 to 2 minutes?
Luraph v15 is a **virtual machine obfuscator**, not simple encryption. The deobfuscator performs full compiler-grade reverse compilation:
1. It symbolically simulates virtual registers across thousands of instruction paths.
2. It sends requests to an in-memory Luau VM to decrypt 2,000–2,600 constants on-the-fly.
3. It performs dominator tree analysis to reconstruct nested control flow loops.
4. It analyzes register lifetimes to assign clean local variables across 10,000+ lines of code.

The current build cuts this cost with a shared dispatch-loop cache (mode resolution is computed once per VM instead of once per function), iterative AST walkers with declaration caching, a single-pass state-variable analysis, and a converged SCCP walk limit that keeps CFG minimization proportional to real code size.

### Q: How can I deobfuscate in just a couple of seconds?
If you only need to see what a script does (URLs fetched, remotes fired, UI setup, webhooks) without needing the full lifted source code, use the `--no-devirt` flag:
```bash
node deob.js input.lua --no-devirt
```
This runs the script in the sandboxed Luau runtime and extracts the complete execution trace in ~2 seconds.

---

## Command Line Options

| Option | Short | Default | Description |
|---|---|---|---|
| `--output <file>` | `-o` | `./output/<name>` | Custom destination path for the deobfuscated file |
| `--no-devirt` | | `false` | Fast execution trace only (skips VM bytecode lifting) |
| `--no-hooks` | | `false` | Disable VM closure entry instrumentation |
| `--no-fold` | | `false` | Disable loop and helper folding in trace mode |
| `--timeout <sec>` | | `90` | Hard timeout per Luau execution pass |
| `--budget <sec>` | | `30` | Soft execution budget for script runtime |
| `--max-runs <n>` | | `12` | Maximum reruns allowed for anti-tamper traps |
| `--devirt-rounds`| | `200` | Maximum constant decryption rounds |
| `--detect` | | `false` | Detect and print obfuscator type, then exit |
| `--debug` | | `false` | Keep intermediate disassembly files in output folder |

---

## Technical Details

For in-depth explanations of the reverse-engineering methodology, SCCP symbolic evaluation, opcode dispatcher mapping, and SSA register renaming, see [TECHNICAL.md](TECHNICAL.md).

---

## License

This project is open-source under the [MIT License](LICENSE).

## Credits
Thanks source to **ccjvwsod** on Discord
This version was rebuilt by me using Node so that multiple Deobf instances can run simultaneously
## Support / Donate

<div align="center">
  <img src="assets/donate/donate_header.png" width="520" alt="Buy me a coffee — fund future projects">
</div>

If these tools are useful to you, you can help fund future projects by sending
crypto to the addresses below. Thank you for the support. — **@adi.codz** (Discord)

| Network | Address | Scan |
|---|---|---|
| **Bitcoin** (BTC) | `bc1q3nprh6e0y4fz88ft4uu5dad7xsx629z498dkay` | <img src="assets/donate/btc.png" width="120" alt="Bitcoin QR"> |
| **Ethereum** (ERC-20) | `0x11369a1d18eb442581D1e675dAdD94eBA1c4bE52` | <img src="assets/donate/eth.png" width="120" alt="Ethereum QR"> |
| **BNB Smart Chain** (BEP-20) | `0x11369a1d18eb442581D1e675dAdD94eBA1c4bE52` | <img src="assets/donate/bnb.png" width="120" alt="BNB Smart Chain QR"> |
| **Solana** (SOL) | `AVKBDNT2PzYDJ7njVrjt7MoVZ1tY4DvNSsADdujiGKTC` | <img src="assets/donate/sol.png" width="120" alt="Solana QR"> |
| **Litecoin** (LTC) | `ltc1qu4ahsjff622xqjlqwafhlgmacd5ea477sqpx9z` | <img src="assets/donate/ltc.png" width="120" alt="Litecoin QR"> |

> Send each asset only on its own network. ETH and BNB share one EVM address —
> use it for ERC-20 on Ethereum and BEP-20 on BNB Smart Chain. Assets sent on the
> wrong network may be lost.
