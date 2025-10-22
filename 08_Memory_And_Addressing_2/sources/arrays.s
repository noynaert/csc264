/*
   Creating Arrays
*/

.globl main
.data
    char:  .byte 64  # same as 0x40
           .byte 65  # same as 0x41
           .byte 66  # same as 0x42
           .byte 67  # same as 0x43
           .byte 68  # same as 0x44
           .byte  0  # Null terminated
    charN: .quad .-char
    animal:.byte  99,97,'t',0
    animalN:.quad .-animal

    number:  .word   1492, 1066, 1776, 1945
    numberN: .word   .-number
    bigNum:  .quad   1066, 1492, 1945, 2020
    bigNumN: .quad   .-bigNum


.text
main:

_exit:
   movq $60,  %rax
   xor  %rdi, %rdi
   syscall

