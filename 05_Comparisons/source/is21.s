/* 
   Demonstrates use of cmp and associated jump instructions

   This code determines if the age is equal to 21.

   In the future we may expand this so it checks for other things, such
   as being from a certain state

   file: is18.s
   Compile with GNU as assembler

   Registers:  
     r8 will hold the age being tested  (how old is the person)
     r9b will hold the flag indicating the result.  

*/

.globl _start
.data
   age: .quad 22
   yes: .ascii "Yes"   # Y is ascii code 89
   no:  .ascii "No"    # N is ascii code 78
   allowedIn: .byte 0  # set to either Y or No


.text
_start:

  #setup
  movq age, %r8         # move the age of the person into r8
  movb no, %r9b         # initially, the person is not allowed in.

  #check to see if the person is exactly 21
  cmpq $21, %r8        # is the person whose age is in r8 equal to 21?
  jne  _is21CheckComplete
  movb yes, %r9b       # stamp their hand and let them in.
  _is21CheckComplete:

  # TODO:  Add more checks

  #save the output as the return value
  _saveOutput:
  movb %r9b, allowedIn

_exit:
   movq $60, %rax
   movb allowedIn, %dil
   syscall

