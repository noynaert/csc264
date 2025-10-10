/*
Illustrates .skip
*/
.globl _start
.data
     info:    .asciz "Hi"
     blank:   .skip 50      #reserves 50 bytes
     nothing: .skip 50, 0   #reserves 50 bytes and initializes to  "0"
     lotsOfA: .skip 50, 10  #reserves 50 bytes and intitializes to "10"
.text
_start:

_exit:
  movq $60, %rax
  movq $0,  %rdi
  syscall
