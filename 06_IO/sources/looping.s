/* 
   Illustrates looping through a buffer with counting
   Also, only processes a range.  In its final form, the loop 
   only prints the capital letters.

   file: looping.s

   compiles and links with gcc.  
   Change "main" to "_start" if using as and ld

          Registers: 
             r15 -- Loop counter
             rsi -- Used to point to the next character to print (Not just for syscalls)

*/

.globl main
.data
      buffer:  .ascii "(How), Now, \n[BrOwN] {CoW}ABZ!~@.123\n"
      
      #buffer: .ascii ""
      bufferN: .quad .-buffer

.text
main:

     /*
         The loop will count down from the bufferN to zero
     */

    #prep for the loop
    movq bufferN, %r15   #start at the length of the loop
    movq $buffer, %rsi   #load the address of the buffer into rsi
    addq $0, %r15        # Set the zero flag if r15 is zero

    _printloop:
    jz _endPrintLoop

    cmpb $'A', (%rsi)  #compare 'A' to the address pointed to by %rsi
    jb   _skipPrintingCharacter
    cmpb $'Z', (%rsi)  #compare 'Z' to the address pointed to by %rsi
    ja   _skipPrintingCharacter
    #print the current character pointed to by %rsi
    movq $1, %rax   # syscall for writing
    movq $1, %rdi   # 1 is the file descriptor for console
    #movq $buffer, %rsi   # not needed because the RSI is already loaded
    movq $1, %rdx    # print just 1 character
    syscall
    _skipPrintingCharacter:
    #prep for the next pass through the loop
    inc %rsi
    dec %r15
    jmp _printloop

    _endPrintLoop:


_exit:
  movq $60, %rax
  movq %r15, %rdi
  syscall

