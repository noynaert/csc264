/* 
   Demonstrates use of cmp and associated jump instructions

   This code determines if the age is equal to 21.

   In the future we may expand this so it checks for other things, such
   as being from a certain state

   file: is18.s
   Compile with GNU as assembler

   Registers:  
     r8 will hold the age being tested
     r9b will hold the flag indicating the result.  

*/

.globl _start
.data
   age: .quad 20
   yes: .ascii "Yes"   # Y is ascii code 89
   no:  .ascii "No"    # N is ascii code 78
   allowedIn: .byte 0  # set to either Y or No


.text
_start:

   #setup:  
   # set the age 
   movq age, %r8

   # initially, no one is allowed in.
   movb   no, %r9b  #set the label in r9

   #do the age comparison
   cmpq   $21, %r8    #club only allows in 21 year olds.
   jne     _not21
   movb   yes, %r9b   #set approval status
   jmp _saveOutput    #we have a solution; jump to save solution.
   _not21:

   # other criteria would be tested here

   _saveOutput:
   movb   %r9b, allowedIn

_exit:
   movq $60, %rax
   movb %r9b, %dil
   syscall

