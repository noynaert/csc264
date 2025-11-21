/* 
file: main.s

This program illustrates multiplying 2 floating point numbers.

The program uses SSE technology.

*/
.globl main
.data
   radius:   .double 10.0   # first operand
   pi:       .double 3.141592653589793  # second operand
   circumference: .double 0.0  # the product
   format: .asciz "Radius: %lf, Pi: %lf, Circumference: %lf\n"

   .text
   main:
      #Alternate way to align the stack
      #Many programs use the rpb as a stable point for the stack pointer
      pushq %rbp
      movq  %rsp, %rbp

        # load the radius and pi into xmm registers
      movsd radius(%rip), %xmm0  # load radius into xmm0
      movsd pi(%rip), %xmm1      # load pi into xmm1

      movsd %xmm0, %xmm2         # copy radius to xmm2 for multiplication
      mulsd %xmm1, %xmm2         # xmm2 = radius * pi    
      
      #set up for printf
      movq $format, %rdi         # first argument is format string
      movq $3, %rax              # There are three floating point arguments for printf
      call printf

      popq %rbp #pop the stack 
_exit:
      movq $60, %rax
      movq $0, %rdi
      syscall
