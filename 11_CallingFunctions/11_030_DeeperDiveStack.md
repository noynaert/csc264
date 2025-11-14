# 11.030 Recap of Stack Information

# Two stack registers: %rsp and %rbp
The stack in x86-64 architecture is managed using two primary registers: the Stack Pointer (%rsp) and the Base Pointer (%rbp).

- **Stack Pointer (%rsp)**: This register points to the top of the stack. It is automatically adjusted (decremented or incremented) when data is pushed onto or popped off the stack. The stack grows downwards in memory, meaning that pushing data onto the stack decreases the value of %rsp, while popping data off the stack increases it.
- **Base Pointer (%rbp)**: This register is used to reference local variables and parameters within a function's stack frame. It is typically set to the value of %rsp at the beginning of a function and remains fixed throughout the function's execution, providing a stable reference point for accessing local data.
# Stack Frames
When a function is called, a new stack frame is created on the stack. This stack frame contains:
- The return address (the address to return to after the function call).
- The previous base pointer (%rbp) value.
- Space for local variables.
- Space for saved registers (if needed).
- The red zone (a 128-byte area below %rsp that is reserved for use by the called function in Linux, BSD, and Mac systems).

### Stack Growth Direction
The stack grows downwards in memory. This means that when data is pushed onto the stack, the value of %rsp decreases, and when data is popped off the stack, the value of %rsp increases.

This gives us the unsatisfying situation that subtracting from the %rsp increases the size of the stack.
