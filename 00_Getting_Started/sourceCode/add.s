/******************************************************************************************
This program adds two integers and returns the sum to the operating system as the exit code.

File: add.s
Programmer: J. Evan Noynaert
Begun:  August, 2025

Assemble with GNU "as" assembler under Linux

*******************************************************************************************/

.globl _start

.data
  num1: .quad 15
  num2: .quad 6
  sum:  .quad 0

.text
_start:

  # add two quad integers and store the result in sum  sum = num1 + num2
  movq num1, %rax   # move the value stored in num1 into the rax register
  addq num2, %rax   # add the value stored in num2 to the value alread in the rax register.
  movq %rax, sum    # moves the contents of the rax register into sum

  # use syscall to exit and return sum as an exit code.  System.exit(sum)  sys.exit(sum)
  movq $60, %rax
  movq sum, %rdi
  syscall
