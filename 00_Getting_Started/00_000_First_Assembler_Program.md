# 00.000 First Assembler Program

```asm
# This program adds two integers and returns
# the sum to the operating system

.globl _start

.data
  num1: .quad 3
  num2: .quad 9
  sum:  .quad 0

.text
start:
  movq num1, %rax  # Moves the data stored at num1 and stores it in the rax register
  addq num2, %rax  # Add data stored at num2 and add it to the rax register
  movq %rax,sum    # Save the contents of rax register to memory location sum

  #exit the system
  movq $60, %rax
  movq sum, %rdi
  syscall
```
