/******************************************************************************************
This program illustrates incq and decq commands.

File: inc.s
Programmer: J. Evan Noynaert
Begun:  August, 2025

Assemble with GNU "as" assembler under Linux

*******************************************************************************************/

.globl _start

.data
  num1: .quad 15
  num2: .quad 0x40
.text
_start:

  # Increment a register
  movq num1, %rax   # move the value stored in num1 into the rax register
  incq %rax

  # Increment a memory location
  incq num2

_exit:
  # use syscall to exit and return sum as an exit code.  System.exit(sum)  sys.exit(sum)
  movq $60, %rax
  movq num2, %rdi
  syscall
