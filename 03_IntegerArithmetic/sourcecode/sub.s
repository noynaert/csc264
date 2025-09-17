
/* Exploring Integer Subtraction
   file: sub.s
   Assemble with GAS assembler
 */

.globl _start
.data
  num1: .quad 14
  num2: .quad  6
  sum:  .quad  0

.text
_start:
    # register-to-register add
    movq num1, %rax   #load the rax with the first number


_exit:
    #Exit the program, returning the sum
    movq $60, %rax
    movq sum,   %rdi
    syscall
