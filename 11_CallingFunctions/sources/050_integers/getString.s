/*
    getString.s
    Reads a string of digits from standard input.
    Reading stops when a non-digit character is encountered or the maximum length is reached.
    
    Inputs:
      %rdi - pointer to buffer to hold string
      %rsi - maximum length of string to read (including null terminator)
    
    Outputs:
      %rax - number of characters read (excluding null terminator)
      buffer pointed to by %rdi is filled with the string read, null-terminated
    
    Clobbers:
      %rax, %rcx, %rdx, %rdi, %rsi, %r8
    
    Register Usage (internal):
      %r8  - pointer to current position in return buffer
      %rcx - loop counter (number of digits read)
      %rsi - pointer to localBuffer (temporary read buffer)
      %rax, %rdi, %rdx - used for syscall and printf parameters
    */

.globl getString


.data 
    returnBufferPointer: .quad 0
    localBuffer: .skip 10
    maxLength: .quad 6
    prompt: .asciz "Enter an integer: "
.text
getString:
  nop 
  pushq %rdi
  pushq %rsi
  movq %rdi, returnBufferPointer
  movq %rsi, maxLength

  #print the prompt
  #movq $prompt, %rdi     
  leaq prompt, %rdi  #move the prompt into the rdi
  call puts

  #recover from puts and setup for reading digits loop
  popq %rsi    #recover from puts
  popq %rdi    #recover from puts
  movq %rdi, %r8   # r8 will be incremented each time a character is read
  xorq %rcx, %rcx  # initialize the loop counter
  movq $localBuffer, %rsi #initialize localBuffer into the rsi

  # Loop to read one character at a time from stdin
  readLoop:
    movq $0, %rax   #syscal for sys_read
    movq $0, %rdi   #sycall, file descriptor
    #rsi is already pointing to the buffer
    movq $1, %rdx   # read 1 byte at a time
    pushq %rcx      #save the rcx across syscall
    syscall
    popq %rcx

    # if the character is not a digit, then exit the loop
    movb (%rsi),%al   #load the character we just read
    cmpb $48, %al     #compare the character to '0' (ascii code 48)
    jl readLoopEnd
    cmpb $'9', %al    #compare the character to '9'
    jg readLoopEnd

    #if we get here, the character is a digit
    movb %al, (%r8)
    incq %r8     #point to the next character position
    incq %rsi
    incq %rcx     #increment the loop counter
    
    #are we beyond max length?
    cmpq %rcx, maxLength
    jg readLoop  

  readLoopEnd:
  movb $0,(%r8)   #Null terminate the string
  movq %rax, %rax 
  # rdi was never changed after the pop
  
  ret
