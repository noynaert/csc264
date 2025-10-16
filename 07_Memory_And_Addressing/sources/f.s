/*
     Demonstrates use of printf

     Use gcc to assemble and link
     */

.globl main

.data
     number: .quad 65
     message: .asciz "Hola"
     format:  .asciz "The number is %d. In hex, this would be 0x%x.\n%s.\n"

.text
main:
    #printf("The number is %d.\n", number);
    xor %rax, %rax
    movq $format, %rdi
    movq number, %rsi
    movq number, %rdx
    movq $message, %rcx
    call printf

_exit:
  movq $60, %rax
  movq $0, %rdi
  syscall

