# Luraph v15 Deobfuscator

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
- **Fast-Path Engine**: Skips redundant verification passes once all constants are decoded live.
- **Offline Roblox Sandbox**: Includes offline models for Roblox services, `Path2D`, `UDim2`, `Vector3`, `CFrame`, and executor globals. No Roblox client needed.
- **Self-Contained**: Luau binaries, runtime emulators, and analysis modules are bundled directly inside this repository.

---

## Quick Start

### Prerequisites
- **Node.js**: v18.0.0 or higher
- **Python**: 3.10 or higher (powers the backend symbolic execution engine)

### Installation
Clone the repository and install dependencies:
```bash
git clone https://github.com/caomod2077/Deobfuscator-Luraph-V15.git
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

---

## Frequently Asked Questions (FAQ)

### Q: How long does deobfuscation take?

| Script Size | Function Count | Average Time | Mode |
|---|---|---|---|
| **Small / Micro Script** | 1 – 20 functions | **1 – 5 seconds** | Full Devirtualize |
| **Medium Script (Hubs)** | 50 – 200 functions | **15 – 35 seconds** | Full Devirtualize |
| **Large Script (Full Games / Complex)** | 500 – 750+ functions | **1.5 – 2.5 minutes** | Full Devirtualize |
| **Any Script** (Trace Mode) | Any size | **1 – 3 seconds** | `--no-devirt` |

### Q: Why do large scripts take 1 to 2 minutes?
Luraph v15 is a **virtual machine obfuscator**, not simple encryption. The deobfuscator performs full compiler-grade reverse compilation:
1. It symbolically simulates virtual registers across thousands of instruction paths.
2. It sends requests to an in-memory Luau VM to decrypt 2,000–2,600 constants on-the-fly.
3. It performs dominator tree analysis to reconstruct nested control flow loops.
4. It analyzes register lifetimes to assign clean local variables across 10,000+ lines of code.

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
