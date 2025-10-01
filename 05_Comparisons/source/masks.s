/*
   Demonstrates using a bitmask to determine if a number is even or odd.
*/
.globl _start
.data  
   number: .quad 8
   eoMask: .quad 0x01

.text
_start:
  
movq number, %r8
andq eoMask, %r8

_exit:
    movq $60, %rax
    mov  %r8, %rdi
    syscall
