/*
   Illustrates picking variables
*/

.globl main
.data
    char0: .byte 64
    char1: .byte 65
    char2: .byte 66
    char3: .byte 67
    char4: .byte 68
    number: .quad 0x60616263
.text
main:
    movq $char0, %rbx

_exit:
   movq $60, %rax
   movq 6(%rbx), %rdi
   syscall

