/******************************************************************************************
This program adds two integers and returns the sum to the operating system as the exit code.

File: add.s
Programmer: J. Evan Noynaert
Begun:  August, 2025

*******************************************************************************************/

.globl _start

.data
   num1: .quad 6
   num2: .quad 5
   sum:  .quad 0

.text
_start:
    # Add num1 plus num2 and store the contents in sum.   sum = num1 + num2
    movq num1, %rax
    addq num2, %rax
    movq %rax, sum

    # exit the program     System.exit(sum)   sys.exit(sum)
    movq $60, %rax
    movq sum, %rdi
    syscall
