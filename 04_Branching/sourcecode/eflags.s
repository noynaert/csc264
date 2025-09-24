/******************************************************************************************
This program illustrates Eflags register
and jmp.

File: eflags.s
Programmer: J. Evan Noynaert
Begun:  August, 2025

Assemble with GNU "as" assembler under Linux

*******************************************************************************************/

.globl _start

.text
_start:

  # Set up RBX a number.  It does not change the eflags
  movq $5, %rbx
  movq $0, %rbx
  movq $0xabcdef,%rbx
  movq $0x0f, %rbx

  # Any arithmetic will set the Zero Flag
  xor %rbx, %rbx
  addq $5, %rbx
  addq $-5, %rbx

  # The AddQ trick
  # One way to set the ZF is to ADDQ $0 to thetarget.
  movq $99,%rbx
  addq $0, %rbx   # ZF is unset

  movq $0, %rbx
  addq $0, %rbx   # ZF is set

_exit:
  # use syscall to exit and return sum as an exit code.  System.exit(sum)  sys.exit(sum)
  movq $60, %rax
  movq %rbx, %rdi
  syscall
