
/* Exploring suffixes with mov
   file: suffixes.s
   Assemble with GAS assembler
 */

.globl _start
.data
  num1:    .quad 0x7fffffffffffffff
  num2:    .quad 0x0123456789abcdef

.text
_start:
    # fill registers with markers
    movq num2, %rax
    movq %rax, %rbx
    movq %rax, %rcx
    movq %rax, %rdx

_break0:
   movq $0, %rax

_break1:
   xorq %rax, %rax
   xorl %ebx, %ebx
   xorw %cx,  %cx
   xorb %dl,  %dl

   xorq %rax,num1
_exit:
    #Exit the program, returning the sum
    movq $60, %rax
    movq $0,   %rdi
    syscall
