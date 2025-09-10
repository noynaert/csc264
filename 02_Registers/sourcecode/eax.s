/*

This program illustates copying the Least Significant Bits between registers

file: eax.s

*/

.globl _start

.data
  num1:   .quad 0xfedcba9876543210  # A big number filling the bits
  result: .word 0

.text
_start:

  # Move the 64-bit number into RAX, then move only 32 bits to the EBX
  movQ num1, %rax   # move the value stored in num1 into the rax register
  mov  %eax, %ebx   # move 8 LSB to the ebx
  mov  %ebx, result  # send ebx to memory
_exit:
  # use syscall to exit and return sum as an exit code.  System.exit(sum)  sys.exit(sum)
  movq $60, %rax
  mov  $0, %rdi
  syscall
