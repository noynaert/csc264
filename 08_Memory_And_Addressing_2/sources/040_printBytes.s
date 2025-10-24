/*
   calculating addresses
*/

.globl main
.data
    animal:.asciz "dog"
    format:.asciz "The char is \'%c\'.\n"


.text
main:
   #Print one char with the label (review)
   /*
   xor  %rax, %rax
   movq $format,%rdi
   movb animal, %sil
   call printf
   */
   #Print one character with a calculated address
   #Use r15 as the base address of the buffer
   #Use r14 as the index
   movq $animal, %r15
   movq $0, %r14

   #do the printing with index of 0
   xor %rax, %rax
   movq $format, %rdi
   movb (%r15,%r14), %sil
   call printf

   #do the printing with index of 2
   movq $animal, %r15
   movq $2, %r14
   xor %rax, %rax
   movq $format, %rdi
   movb (%r15,%r14), %sil
   call printf


_exit:
   movq $60,  %rax
   xor  %rdi, %rdi
   syscall

