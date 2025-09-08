# 02.010 Recap about Registers

## Textbook -- Chapters 4 (first part), Appendix C


## Recap
We have been talking about registers.  Let's do a quick recap of what we know so far:

* Registers are part of the CPU.
* Registers are extremely fast because they are in the CPU itself.
* Registers have a width.  This width has changed on the different generations of x86 processors
  * On original IBM PC's with 8086 and 80286 processors, the registers were 16 bits wide.
    * They also had a way to use 8-bit registers
  * On 80386, 80486, and some other CPUs, the registers were 32 bits wide.
  * On most systems since 2005, most PCs and laptops have 64 bit registers.
  * If we are programming on x86-64 systems, we can access the 64-, 32-, or 16/8-bit registers.  I will use theh AX register as an example
    * AX  -- The original 16-bit register
      * AH and AL are the two 8-bit registers within the AX
    * EAX -- The 32-bit register
    * RAX -- The 64-bit register
  * The number of registers has also grown over time.
    * 8086 has eight general-purpose registers.
    * x86-64 has 16 general-purpose registers.
    * There are several other registers that serve special purposes.
    * "General Purpose" is somewhat misleading.  Most of them have some special use.  The programmer can freely read and write to them, but only if the register is not being used for one of its unique purposes.

## Advice for this unit

Don't get lost in the weeds.  The special purposes of the registers include concepts like
stack pointers and base-offset registers.  Those terms have no meaning yet.  For now, keep the general structure of pointers in mind, but don't try to memorize all the purposes right now.  On the first exam, I will not expect you to remember what all the registers do.  We will add those as the course goes on.

## Digress into Debugging

I am an experimental learner.  Many programmers seem to learn by working with programs and seeing what happens.

We will digress to using debuggers to try to see what is going on with registers.

---

Here’s a complete summary of the **registers available in x86-64 microprocessors**, with both a narrative explanation and a structured table.

---

# Narrative Overview

In the **x86-64 architecture**, registers are small, fast storage locations inside the CPU. They hold data, addresses, and control information essential for computation. The architecture extends the classic 32-bit x86 register set to 64 bits, while maintaining backward compatibility.

### Categories of Registers (compiled by ChatGPT)

1. **General-Purpose Registers (GPRs)**

   * There are 16 general-purpose registers: `RAX`, `RBX`, `RCX`, `RDX`, `RSI`, `RDI`, `RBP`, `RSP`, and `R8–R15`.
   * Each can hold 64-bit values (with accessible sub-parts: 32-bit, 16-bit, and 8-bit halves).
   * While they are general purpose, many have conventional uses:

     * `RAX`: accumulator for arithmetic results and return values from functions.
     * `RBX`: often used as a base register.
     * `RCX`: loop counter and parameter passing.
     * `RDX`: I/O pointer and multiplication/division.
     * `RSI`/`RDI`: source/destination in memory operations.
     * `RSP`: stack pointer.
     * `RBP`: base/frame pointer.
     * `R8–R15`: additional registers mainly used for parameters in 64-bit calling conventions.

2. **Instruction Pointer (RIP)**

   * Holds the address of the next instruction to execute.
   * Key for control flow: branches, calls, and returns.

3. **Flags Register (RFLAGS)**

   * Contains condition flags (e.g., Zero Flag, Sign Flag, Carry Flag, Overflow Flag) that reflect results of operations.
   * Also holds control flags (e.g., Interrupt Enable).

4. **Segment Registers (CS, DS, ES, FS, GS, SS)**

   * Remnants of older x86 segmentation.
   * In 64-bit mode, mostly unused except for `FS` and `GS`, which are repurposed for thread-local storage and OS use.

5. **Control Registers (CR0–CR4, CR8)**

   * Control CPU modes and memory management.
   * Example: `CR3` holds the page table base for virtual memory translation.

6. **Debug Registers (DR0–DR7)**

   * Used for hardware breakpoints and debugging.

7. **SIMD / Floating-Point Registers**

   * **x87 FPU stack (ST0–ST7):** legacy floating-point registers.
   * **MMX (MM0–MM7):** integer SIMD registers (deprecated in favor of XMM/YMM).
   * **XMM (XMM0–XMM31):** 128-bit SIMD registers for SSE instructions.
   * **YMM (YMM0–YMM31):** 256-bit extensions (AVX).
   * **ZMM (ZMM0–ZMM31):** 512-bit extensions (AVX-512).
   * These registers accelerate vector math, multimedia, cryptography, and scientific computing.

---

# Register Table (x86-64)

| Register(s)            | Size                            | Category            | Typical / Special Use                                                                         |
|:---|---|:---:|---|
| **RAX, RBX, RCX, RDX** | 64-bit (with 32/16/8 sub-parts) | General Purpose     | `RAX`: accumulator, return value. `RBX`: base. `RCX`: counter/parameter. `RDX`: I/O, mul/div. |
| **RSI, RDI**           | 64-bit                          | General Purpose     | String/memory ops: source (`RSI`), destination (`RDI`).                                       |
| **RSP**                | 64-bit                          | Stack Pointer       | Points to top of stack.                                                                       |
| **RBP**                | 64-bit                          | Base Pointer        | Frame pointer for stack frames.                                                               |
| **R8–R15**             | 64-bit                          | General Purpose     | Extra registers, often used for function arguments.                                           |
| **RIP**                | 64-bit                          | Instruction Pointer | Holds address of next instruction.                                                            |
| **RFLAGS**             | 64-bit                          | Status/Control      | Holds condition & control flags.                                                              |
| **CS, DS, ES, SS**     | 16-bit                          | Segment Registers   | Mostly unused in 64-bit mode.                                                                 |
| **FS, GS**             | 16-bit                          | Segment Registers   | Used for thread-local storage and kernel data.                                                |
| **CR0–CR4, CR8**       | 64-bit                          | Control Registers   | Control CPU operation, memory management, interrupts.                                         |
| **DR0–DR7**            | 64-bit                          | Debug Registers     | Hardware breakpoints, debugging.                                                              |
| **ST0–ST7**            | 80-bit                          | x87 FPU Registers   | Floating-point stack. Legacy use.                                                             |
| **MM0–MM7**            | 64-bit                          | MMX Registers       | Integer SIMD (obsolete).                                                                      |
| **XMM0–XMM31**         | 128-bit                         | SIMD Registers      | SSE operations.                                                                               |
| **YMM0–YMM31**         | 256-bit                         | SIMD Registers      | AVX operations.                                                                               |
| **ZMM0–ZMM31**         | 512-bit                         | SIMD Registers      | AVX-512 operations.                                                                           |

---
