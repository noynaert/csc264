# 05.020 Masking with `and`

## What is masking?

Masking is a technique used in programming to manipulate specific bits within a binary number. It involves using bitwise operations, particularly the AND operation, to isolate or modify certain bits while leaving others unchanged. This is often done by applying a mask, which is a binary number that has specific bits set to 1 (to keep those bits) and others set to 0 (to clear those bits).
## Bitwise AND operation

A|B|A AND B
:---:|:---:|:---:
0|0|0
0|1|0
1|0|0
1|1|1

The important thing to remember is that all the 0 bits will be set to 0.  The 1 bits will be unchanged.

## Example of masking for even/odd
```asm
/*
   masks.s illustrates simple masking
*/
.globl _start
.data  
   number: .quad 6
   eoMask: .quad 0x01

.text
_start:
     movq number, %r8
     andq eoMask, %r8

_exit:
    movq $60, %rax
    mov %r8,  %rdi
    syscall

```
