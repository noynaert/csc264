# This program just exits with a return code
.globl main
.section .text
main:
    movq $60, %rax   #System call for exit
    movq $7, %rdi    #The return code
    syscall
