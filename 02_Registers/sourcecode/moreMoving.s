/*

This program illustates copying the Least Significant Bits between registers

It will emphasize themovement of LSB to the R8-R15 registers

file: moreMoving.s

*/

.globl _start

.data
  num1:       .quad   0xfedcba9876543210  # A big number filling the bits
  sixtyFour:  .quad   0
  thiryTwo:   .long   0
  sixteen:    .word   0
  eight:      .byte   0

.text
_start:

  # Move the 64-bit number into RAX, then move different groups of LSB to registers
  movq  num1, %rax   # move the value stored in num1 into the rax register
  movq  %rax, %r12   # move 64 LSB to the ebx
  movl  %eax, %r13d  # move 32 LSB
  mov   %ax,  %r14w  # move 16 LSB
  movb  %al,  %r15b  # move 8 LSB

_toMemory:
  #dumpthe contents of r12 through r15 to memory.
  movq  %r12,sixtyFour
  movl  %r13d,thiryTwo
  mov   %r14w,sixteen
  movb  %r15b,eight

_exit:
  # use syscall to exit and return sum as an exit code.  System.exit(sum)  sys.exit(sum)
  movq $60, %rax
  mov  $0, %rdi
  syscall
