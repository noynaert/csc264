

There are many registers.  Many of them are used by the system and are not of much interest to the assembly language programmer.  There is an entire bank of registers dedicated to floating point operations.

In this unit we will be interested in the General Purpose Registers and a couple of other specialized registers.

## General Purpose Registers (GPR)

The registers available in both 32-bit and 64-bit systems are:

* `RAX`: accumulator for arithmetic results and return values from functions.
* `RBX`: often used as a base register.
* `RCX`: loop counter and parameter passing.
* `RDX`: I/O pointer and multiplication/division.
* `RSI`/`RDI`: source/destination in memory operations.
* `RSP`: stack pointer.
* `RBP`: base/frame pointer.

64-bit systems have the following additional GPR:

* `R8–R15`: additional registers mainly used for parameters in 64-bit calling conventions.

## Special Purpose Registers of interest to us soon:

 **Instruction Pointer (RIP)**

   * Holds the address of the next instruction to execute.
   * Key for control flow: branches, calls, and returns.

3. **Flags Register (RFLAGS)**

   * Contains condition flags (e.g., Zero Flag, Sign Flag, Carry Flag, Overflow Flag) that reflect results of operations.
   * Also holds control flags (e.g., Interrupt Enable).
