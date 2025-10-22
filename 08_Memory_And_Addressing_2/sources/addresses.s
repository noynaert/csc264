/*
   Illustrates picking variables
*/

.globl main
.data
    char0: .byte 64  # same as 0x40
    char1: .byte 65  # same as 0x41
    char2: .byte 66  # same as 0x42
    char3: .byte 67  # same as 0x43
    char4: .byte 68  # same as 0x44

.text
main:
    movq $char0,%rbx    #load the address of char0 into rbx

_exit:
   movq $60, %rax
   movb (%rbx), %dil
   syscall

