# This program just exits with a return code

.section .data
.section .text
.globl _start
_start:
    movq $60, %rax   #System call for exit
    movq $7, %rdi    #The return code
    syscall
