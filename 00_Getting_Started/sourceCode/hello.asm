.global main

.section .data
message: .ascii "Hello, World!\n"
len =  14

.section .text
main:
    movq %rsp, %rbp #for correct debugging
    # set up for sending message to STDOUT 
    movq $1, %rax        # System call number for sys_write
    movq $1, %rdi        # File descriptor for STDOUT
    lea message, %rsi    # Address of the message string
    movq $len, %rdx      # Length of the message
    syscall              # Execute the system call

    # sys_exit(status=0)
    movq $60, %rax       # System call number for sys_exit
    movq $0, %rdi        # Exit status 0 (success)
    syscall              # Execute the system call

