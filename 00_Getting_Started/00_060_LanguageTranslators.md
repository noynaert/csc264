# 00.060 Language Translators

## Hello, World

### Hello World in C (Compiled)

```c
#include <stdio.h>

int main(char **args){
   printf("Hello, World\n");
   return 0;
}
```

C is a compiled language.  The compiler translates C into machine language and produces an executable file.  

### Hello World in Python (Interpreted)

```python
print("Hello, World!")
print("Goodbye, World!")
```
Python is an interpreted language.  There is no executable file of machine language.  In an interpreter, each line of the program is translated to machine language each time it is executed.

### Hello World in Assembler

```asm
.global _start: 

.section .data
message: .ascii "Hello, World!\n"
len:  .quad  $14

.section .text
_start:
    # set up for sending message to STDOUT 
    movq $1, %rax        # System call number for sys_write
    movq $1, %rdi        # File descriptor for STDOUT
    lea message, %rsi    # Address of the message string
    movq $len, %rdx      # Length of the message
    syscall              # Execute the system call

    # sys_exit(status=0)
    movq $60, %rax       # System call number for sys_exit
    movq $0, %rdi        # Exit status 0 (success)
    syscall              # Execute the system call
```



## Returning an exit code

```asm
.global _start: 

.section .text
_start:
    movq $60, %rax       # System call number for sys_exit
    movq $7, %rdi        # Exit code
    syscall              # Execute the system call
```
