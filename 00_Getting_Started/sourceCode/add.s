#This program adds two integers and returns the sum to the operating system.

.globl _start

.data
  num1: .quad 10
  num2: .quad 15
  sum:  .quad 0

.text
_start:
  movq num1, %rax # Moves data from num1 into the rax register
  addq num2, %rax # Adds data from num2 to the rax register
  movq %rax, sum  # Moves the contents of rax to sum

  # exit the program
  mov $60,  %rax  # instruction to exit for use by syscall
  movq sum, %rdi  # The value syscall will return to the operating system
  syscall
