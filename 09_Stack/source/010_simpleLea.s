/* 
   Illustrates LEA vs MOV
*/
.globl main
.data
    numbers: .quad 0, 16, 32, 48, 64, 80 , 96 
    size: .quad .-numbers
    format: .asciz "Element [%d] is %d\n"

.text
main:

  # MOV vs LEA commands
  movq size, %r11    # move 56 into r11
  leaq size, %r12    # move the address of where 56 is stored into r1

  # equivalent operations, LEA MOV.
  #  (we are really exploring the $ hack in GAS assembler)
  movq $numbers, %r13     #stores the address of the base of the array
  leaq numbers, %r14      #stores the address of the base of the array
  leaq numbers(%rip), %r15#stores the address using explicit RIP Relative addressing

_exit:
    movq $60, %rax
    xorq %rdi, %rdi
    syscall
