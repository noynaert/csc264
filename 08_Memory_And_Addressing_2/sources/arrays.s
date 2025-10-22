/*
   Illustrates picking variables
*/

.globl main
.data
    char0: .byte 64  # same as 0x40
           .byte 65  # same as 0x41
           .byte 66  # same as 0x42
           .byte 67  # same as 0x43
           .byte 68  # same as 0x44
           .byte  0  # Null terminated
    char0N:.quad .-char0

.text
main:

_exit:
   movq $60,  %rax
   xor  %rdi, %rdi
   syscall

