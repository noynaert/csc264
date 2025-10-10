# 06.050 Read fixed length string

Reading a fixed length string is very similar to writing a fixed length string.  The main difference is that we will put a 0 in the `RAX` register.

```
.data
buffer: .skip 3,64  #fill 3 bytes with @@@
bufferN:.quad 3
prompt: .ascii "Enter three characters: "
promptN: .quad .-prompt

.text
_start:

#write the prompt
movq $1, %rax
movq $1, %rdi
movq $prompt,%rsi
movq promptN,%rdx
syscall

# Read 3 characters from the console
movq $0, %rax # 0 is the write function
movq $1, %rdi # 1 is the file descriptor for console
movq $buffer, %rsi
movq bufferN, %rdx
syscall

#write the buffer (echo what the user entered)
movq $1, %rax
movq $1, %rdi
movq $buffer,%rsi
movq bufferN,%rdx
syscall

```
