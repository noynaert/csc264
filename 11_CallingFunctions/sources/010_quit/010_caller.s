/*
 *file: caller.s
 * Illustrates calling a function
 *
 *Assemble and link with gcc
*/
.globl main
.data
   starting: .asciz "Start"

.text
main:
    # Print starting message
    movq $starting, %rdi     # puts the address of the message in the rdi
    call puts

_exit:
#     movq %rax, %rdi    # put the return value of address into the rdi
#     movq $60, %rax
#     syscall

movq %rax, %rdi
andq $-16, %rsp
call quitCustom

