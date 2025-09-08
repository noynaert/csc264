/*

Classic add.s program with debugging labels added

file: addWithDebug.s

*/

.globl _start

.data
  num1: .quad 65  # Would be an ACCII 'A'
  num2: .quad 5
  sum:  .quad 0

.text
_start:

  # add two quad integers and store the result in sum  sum = num1 + num2
  movq num1, %rax   # move the value stored in num1 into the rax register
  addq num2, %rax   # add the value stored in num2 to the value alread in the rax register.
  movq %rax, sum    # moves the contents of the rax register into sum

  # use syscall to exit and return sum as an exit code.  System.exit(sum)  sys.exit(sum)
  movq $60, %rax
  movq sum, %rdi

  syscall
