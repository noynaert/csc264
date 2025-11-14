# 11.040 Stack Alignment

The x86-64 ABI requires that the stack be aligned to a 16-byte boundary at the point of a function call. This means that before calling a function, the caller must ensure that %rsp is a multiple of 16. This alignment is crucial for performance reasons and to comply with the calling convention.

When the stack is aligned, the hex address of the stack ends in a 0.

## Caller should align the stack
The caller is responsible for ensuring that the stack is properly aligned before making a function call. If the caller modifies the stack (e.g., by pushing data onto it), it must adjust %rsp accordingly to maintain the 16-byte alignment.

Sometimes the callee will also adjust the stack to maintain alignment, especially if it needs to allocate space for local variables.  The puts and printf functions do this, which is one reason we did not need to align the stack ourselves before calling them.

## In the callee function, the stack is automatically unaligned 

When a function is called, the return address is pushed onto the stack, which can cause the stack to become unaligned. Therefore, the callee function may need to adjust the stack pointer (%rsp) to ensure proper alignment for its local variables and operations.

### Leaf functions

A leaf function is a function that does not call any other functions. Since leaf functions do not make further function calls, they do not need to worry about maintaining stack alignment for subsequent calls. However, they may still need to ensure that the stack is aligned for their own local variable usage.

## Methods to align the stack

There are several methods to align the stack before a function call:

- push an appropriate sized register onto the stack as a filler
- Subtract the appropriate value from %rsp.  Often this is done with the command `sub $8, %rsp`
- Doing a bitwise AND operation on %rsp to clear the lower bits.  For example, `and $-16, %rsp` will align %rsp to a 16-byte boundary.  -16 is 0xfffffffffffffff0 in hex, which has the lower 4 bits cleared to 0.  This method is the safest, but it is less common because it can waste stack space.  It is best used in functions that are leaf functions, or at least do not call many other functions.