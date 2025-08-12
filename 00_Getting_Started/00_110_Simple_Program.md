# 00.110 Running a Simple Program

We will recycle our "exit" program.

Use a text editor to type in the following x86-64 program:

```asm
# This program just exits with a return code
#
# Programmer:  YOUR NAME HERE
# Original date:  20yy-mm  (insert year and month)

.section .data
.section .text
.globl _start
_start:
    movq $60, %rax   #System call for exit
    movq $7, %rdi    #The return code
    syscall
```

## Go to the command line.  

- If you are in Windows, make sure it is a Linux command line.  Make sure things are working with `as --version`
- Use whatever editor you want to type in the above code and save the file.  For this assignment, I will save it under the name `hmwk00.s'
- Assemble the program with the following command
  - `as -al -o hmwk00.o hmwk00.s`
- If the program compiles successfully, link it with the following command:
  - `ld -o hmwk00.exe hmwk00.o`
- If the above command works, execute it with the command:
  - `./hmwk00.exe`
- Check the return code with the following command:
  - `echo $?`