08.050 Print a byte with indexing

```
.data
    format:.asciz "The char is \'%c\'.\n"
    animal:.ascii "skunk","\0"


.text
main:

   #do the printing with index of 2
   movq $animal, %r15
   movq $0, %r14
   _printAnimal:
   cmpq $0,(%r15,%r14)
   je  _endPrintAnimal
   xor %rax, %rax
   movq $format, %rdi
   movb (%r15,%r14), %sil
   call printf

```