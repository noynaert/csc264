/* Messing with functions calls */

.section .text
.globl main


main:
    movq $42, %rax
    sub $8, %rsp      # make space on stack
    movq $98, %rdi
    call quitCustom
