# 05.010 Spaghetti Bowl Programming

Up until the middle 1960's, the definition of a "good programmer" was someone who could write software that no one else could understand.


From page 48-49 of the book:

```asm
.globl _start

.text
_start:
  movq $25,%rax
  jmp thelabel

somewhere:
  movq %rax, %rdi
  jmp anotherlabel

label1:
  addq %rbx, %rax
  movq $5, %rbx
  jmp here

labellabel:
  syscall

anotherlabel:
  movq $60, %rax
  jmp labellabel

thelabel:
  movq %rax, %rbx
  jmp there

here:
  divq %rbx
  jmp somewhere

there:
  addq $5, %rbx
  jmp label

anywhere:
  jmp thelabel
``` 
## Software Crisis

 Software up through the 1960s were usually the work of one programmer because the programmer had to keep the entire program in their head at one time.

Programs tended to be:

* Expensive to develop
* Difficult to understand
  * Even by the original programmer
* Difficult or impossible to maintain
* Short, given to a single task
* Buggy
* Almost impossible to modify; major revisions required a complete rewrite.

## 1964 was a big year for the software crisis

* Major articles were released documenting the problems
* IBM 360 computer was released with a buggy operating system.


It took over a decade to overcome the problems of the software crisis.


