/*
* file: stringToInt.s
*
* Converts a null-terminated string of digits to a 16-bit integer.
*
* Assemble with gcc.
*
* The function processes each digit character in the string, multiplying
* the accumulated result by 10 and adding the next digit value.
*
* Inputs:
*   %rdi - pointer to null-terminated string of digits
*
* Outputs:
*   %ax - 16-bit integer value of the string
*
* Clobbers:
*   %rax, %rcx
*   (%rbx is preserved via push/pop)
*
* Register Usage (internal):
*   %rax - accumulates the resulting integer
*   %rcx - index into the string
*   %rbx - holds the current character being processed
*
*/
.globl stringToInteger
.data
.text
stringToInteger:
   nop
   pushq %rbx
   xorq  %rax, %rax   #clear the rax to act as an accumulator to hold the integer
   xorq  %rcx, %rcx   #index of the string
   convertLoop:
   movb (%rdi,%rcx,1),%bl  #Load 1 byte from the buffer
   cmpb $0, %bl           #If the byte is null, then we are done
   je convertLoopEnd
   subw $'0', %bx         #subtract 48 from the ascii code to get the value
   imulq $10,%rax        #mutiply current contents of the %rax by 10 and store in the %rax
   addw %bx, %ax
   incq %rcx             # advance the index
   jmp convertLoop
  convertLoopEnd:

   popq %rbx
   ret
