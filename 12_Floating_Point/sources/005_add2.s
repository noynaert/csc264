/* 
file: 005_add2.s

This program illustrates adding 2 floating point numbers.

The program uses SSE technology.

*/
.globl main
.data
   a:   .double 1.5   # first operand
   b:   .double 2.75  # second operand
   sum: .double 0.0  # the sum
   format: .asciz "Result is %f\n"

   .text
   main:
      #Alternate way to align the stack
      #Many programs use the rpb as a stable point for the stack pointer
      pushq %rbp
      movq  %rsp, %rbp

      movsd a, %xmm0   #move double precision number into the %xmm0 register
      addsd b, %xmm0  #Add b to the contents of the xmm0 register and store the results in xmm0 register
      
      # set up for printf
      movq $format, %rdi   # same as leaq format, %rdi
      movl $1, %eax        # There is one argument for printf
      
      call printf

      popq %rbp #pop the stack 
_exit:
      movq $60, %rax
      movq $0, %rdi
      syscall
