# 12.060 SSE2 Registers

## X86 Registers

- x86-32 has 8 floating point registers
  - xxm0 through xxm7
- x86-64 has 16 floating point registers
  - xxm0 through xxm15
- Registers are 128 bits wide.
- Each register can hold
  - 2 double-precision floats (2*64 bits)
  - 4 single-precision floats (4*32 bits)
  - Packed integers (16x8, 8x16, 4*32, 2*64)

## Least Significant, Lanes

If only one floating point number is used, it is in the least significant position.

The different positions within a register are sometimes called "Lanes"

# Scaler vs Vector

- Scaler -- Only the lowest lane is used
  - The upper lanes remain unchanged or are used, depending on the operation.
  - Correspond to floating point operations in C, Python, and Java
  - Used for
    - Standard float and double operations
    - Passing floating point arguments
    - Functions that operate on one value at a time
  - Vector -- Multiple floating point values are packed together in the register
    - I think of them as vector operations
    - Good for
      - multimedia
      - scientific computing
      - cryptography
    - Now, GPU has taken over many of these roles

## Caller saved

All floating point registers are caller saved.  If you want to use a value after a call, push it onto the stack.