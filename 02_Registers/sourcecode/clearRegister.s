/*

Clears the MSB of a register

file: clearRegisters.s

*/

.globl _start

.data
  initials:
  trash: .long 0x12345678
  small: .word 0x000A
  result:.long 0
.text
_start:
  #Add junk to the full rdiregister
  movl trash, %ebx
  movq $0, %rbx
  movw small, %bx
  movl %ebx,  result
_exit:
  # use syscall to exit and return sum as an exit code.  System.exit(sum)  sys.exit(sum)
  movq $60, %rax
  movq result, %rdi

  syscall
