# This program just exits with a return code
# Using 8086, 16-bit assembler

.section .data
.section .text
.globl _start
_start:
    mov $60, %ax   #System call for exit
    mov $7,  %di   #The return code
    syscall	   #Do the system call
