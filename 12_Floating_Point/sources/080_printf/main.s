/* 
file: main.s

This program illustrates multiplying 2 floating point numbers and printing the results
The program calculates the circumference of a circle.

The program uses SSE technology.

compile and link with gcc on Linux

*/
.globl main
.data
   radius:   .double 100.0   # first operand
   pi:       .double 3.141592653589793  # second operand
   circumference: .double 0.0  # the product
   format: .asciz "Radius: %f, Pi: %lf, Circumference: %e\n"

   .text
   main:
      #Alternate way to align the stack
      #Many programs use the rpb as a stable point for the stack pointer
      pushq %rbp
      movq  %rsp, %rbp


      # load the radius and pi into xmm registers
      movsd radius, %xmm0
      movsd pi, %xmm1

      # set up and do the multiplication
      movsd %xmm0, %xmm2 #copy the radius into xmm2 to set up multiplication
      mulsd %xmm1, %xmm2 #multiply PI * radius, store results in xmm2

      #finish setting up printf
      movq $format, %rdi    #load the format string
      movl $3, %eax         #3 floating point parameters
      call printf


      popq %rbp #pop the stack 
_exit:
      movq $60, %rax
      movq $0, %rdi
      syscall
