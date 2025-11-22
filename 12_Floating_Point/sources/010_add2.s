/* 
file: 010_add2.s

This program illustrates adding 2 floating point numbers.

The program uses SSE technology.  Compile and link with gcc

*/
.globl main
.data
    a: .double 1.5  # first operand
    b: .double 2.75 # second operand 
    format:  .asciz "Result is %f\n"

.text
main:
    # Alternative way to align the stack to a 16-bit boundary.
    # The %rbp is often used as a temporary base for the stack.
    # pushing the old %rsp onto the stack and then using the %rpb adds the needed 8 bytes
    pushq %rbp
    movq  %rsp, %rbp

   #set up for the add
   movsd a, %xmm0   # move first operand into xmm0 register
   addsd b, %xmm0   # adding second operand into xmm0, and saving the results in xmm0

   # set up the printf
   movq $format, %rdi
   # the first parameter is in the xmm0
   movl $1, %eax  # put the number of parameters into 32 bits of the rax register
   call printf

   #restore the %rbp and realign the stack
   popq %rbp
_exit:
   movq $60, %rax
   movq $0, %rdi
   syscall
