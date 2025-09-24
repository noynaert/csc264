/******************************************************************************************
This program illustrates conditional jump on the ZF

The program works by calculating  2^4 power.
If you change the base and exp values, you may
change the calculation

File: jz.s
Programmer: J. Evan Noynaert
Begun:  August, 2025

Assemble with GNU "as" assembler under Linux

  Registers:
     rax is the accumulator of the result.
     rcx will hold the exponent (controls the loop)
     r8  will hold the multiplier

*******************************************************************************************/

.globl _start

.data
  base: .quad 2   # The number being raised
  exp:  .quad 4   # The power  (MUST BE 1 or Greater)
  result: .quad 0 # b^e   or base^exp

.text
_start:

_setup:
    ### initialize some values
    movq exp, %rcx

    ### load the accumulator with 1
    movq $1, %rax

    ### stash the base in r8 because we will multiply by the base
    movq base, %r8

_top:
    mulq %r8
    decq %rcx
    jnz  _top

_saveResult:
    movq %rax, result

_exit:
  # use syscall to exit and return sum as an exit code.  System.exit(sum)  sys.exit(sum)
  movq $60, %rax
  movq result, %rdi
  syscall
