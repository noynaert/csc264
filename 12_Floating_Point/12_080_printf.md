# 12.080 `printf` with floating point

## printf with floats in GNU GAS assembly   

### Format specifiers for floating point numbers
In GNU GAS assembly, you can use the `printf` function to print floating point numbers by using specific format specifiers. The most commonly used format specifiers for floating point numbers are:
- `%f`: for printing floating point numbers in decimal notation.
- `%e`: for printing floating point numbers in scientific notation.
- `%g`: for printing floating point numbers in either decimal or scientific notation, depending on the value.

- lf is also used for double precision floating point numbers.

## Format String

The address string for the printf statement is still passed in the %rdi register.

## Values to be printed must be passed in the xmm registers

The first argument is passed in the %xmm0 register, the second in %xmm1, and so on.

Up to 8 floating point argument may be passed in the xmm registers.  After that, the stack is used.

## The EAX register

The %eax register must contain the number of floating point arguments being passed in the xmm registers.

## Example program

```
/* 
file: main.s

Calculates the circumference of a circle given the radius and pi.

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
