
/* Exploring Integer Subtraction
   file: sub.s
   Assemble with GAS assembler
 */

.globl _start
.data
  num1: .quad 200
  num2: .quad  23
  sum:  .quad  0

.text
_start:
    # register-to-register add
    movq num1, %rax   #load the rax with the first number
    subq num2, %rax   #subtract num2
    movq %rax, sum

_exit:
    #Exit the program, returning the sum
    movq $60, %rax
    movq sum,   %rdi
    syscall
