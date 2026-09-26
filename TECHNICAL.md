# Luraph v15 Deobfuscation & Devirtualization Internals

This document covers the technical architecture and reverse-engineering pipeline used by this engine to deobfuscate scripts protected with **Luraph v15**.

---

## 1. How Luraph v15 Works

Luraph v15 transforms original Luau scripts into an interpreted virtual machine:

1. **Virtual Instruction Set**: Original Luau bytecode is compiled into a custom register/stack machine with dynamic opcodes and encrypted dispatch tables.
2. **Flattened Control Flow**: Jump targets are flattened into a large state loop (`while true do local op = ARR[PC]; if-tree ... end`), masking the original high-level control structures (`while`, `repeat`, `for`, `if/else`).
3. **Lazy Constant Encryption**: String constants, numeric values, and jump destinations are encrypted in memory buffers (`LPH_ENCSTR`, `LPH_ENCFUNC`). They are only decrypted in-place when execution branches hit them.
4. **Anti-Tamper & Environment Traps**: The VM includes active probes against hook functions, stack depth alteration, and metatable inspection. If tampering is detected, it enters `LPH_CRASH()` (corrupting its own bytecode and spinning in an infinite loop).

---

## 2. Devirtualization Pipeline

To reconstruct valid, clean Luau source code, the engine executes a multi-pass pipeline:

```
[Target Script]
       │
       ▼
1. AST Analysis & Entry Hooking (vmmap)
       │
       ▼
2. Dynamic Sandbox Simulation (harness + envlog)
       │
       ▼
3. Anti-Tamper Isolation & Trap Attribution
       │
       ▼
4. Multi-Round Symbolic Execution & Live REPL Constant Decryption (SCCP)
       │
       ▼
5. Control Flow Graph (CFG) Reconstruction (structure)
       │
       ▼
6. Variable Scoping & Register Web Analysis (variables / codegen)
       │
       ▼
7. AST Polish & Name Restoration (names / localfuncs)
       │
       ▼
[Clean Luau Code]
```

### Stage 1: Static AST Parsing & Hooking (`vmmap.js`)
- The input script is parsed into a Luau AST using `luau-ast`.
- The engine identifies VM dispatch loops and closure maker functions.
- Non-invasive hooks are inserted into each closure maker to capture proto metadata, instruction arrays, and closure environments without changing execution behavior.

### Stage 2: Sandboxed Simulation & Trap Handling (`driver.js`, `harness.js`)
- The hooked script executes inside a sandboxed Luau runtime (`envlog.luau`).
- If an execution path hits an anti-tamper trap (`\0TRIGGER <pid>`), the engine identifies the responsible function, isolates it, and re-executes along stable code paths.

### Stage 3: Symbolic Execution & Live Memory Decryption (`devirt.js`, `luasym.py`)
- Each proto is analyzed using **Sparse Conditional Constant Propagation (SCCP)**.
- When the walker reaches lazy-encrypted constants, it queries the running Luau REPL server in memory (`harness.fetch`) via an IPC pipe.
- The REPL decrypts the values on-the-fly and returns them in milliseconds, resolving thousands of constants in a few fast rounds.

### Stage 4: Control Flow Graph (CFG) Reconstruction (`structure.py`, `loops.py`)
- The basic blocks identified during symbolic walking are assembled into a directed CFG.
- Dominator tree analysis identifies loops (`while true`, `for i = a, b, c`, `for k, v in pairs`) and conditionals (`if / elseif / else`).
- Unreachable dead blocks created by opaque predicates are pruned.

### Stage 5: Register Web Analysis & Local Naming (`variables.py`, `codegen.py`)
- Virtual registers are mapped across basic block boundaries using Static Single Assignment (SSA) web analysis.
- Variables are assigned clean local names inferred from Roblox API and global usage context (e.g., `Players`, `ReplicatedStorage`, `TweenService`).

### Stage 6: Polish & Formatting (`backend.py`, `tidy.js`)
- Function assignments are converted into idiomatic Luau (`local function name(...) ... end`).
- Code is formatted with proper indentation and verified through `compile_check` to ensure 100% executable syntax.

---

## 3. Fast-Path Optimization

In standard devirtualization, the final verification pass often repeats the entire analysis over all functions. This engine implements a **Fast-Path Controller**:
- Once all constants are resolved live with 0 unlifted blocks, the engine skips redundant collection passes and immediately triggers code generation.
- This cuts 40–60 seconds off the total execution time for massive scripts (500+ functions).
