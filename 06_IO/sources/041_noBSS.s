/*
Illustrates .skip
*/
.globl _start
.data
     info:      .asciz "Hi"
     bigBuffer: .skip 4096, 0x0B

.text
_start:


_exit:
  movq $60, %rax
  movq $0,  %rdi
  syscall
