
# 05.050 Comparisons

We have seen how masking works.  The method we used destroyed the value being tested.

Let's look at the problem of telling whether two numbers are equal.   One way to do this would be to subtract one number from another.  For example, if we want to know whether someone's age is equal to 18, we could do the following:

```
subq $18, %r8
```
However, this would destroy the contents of the r8 register.

x86 has the `cmp`command.  It compares values without destroying the contents of the destination.  Flags are set.   We won't worry about the flags in this unit, but we will use the results.  The command would work as ***cmpq arg1, arg2***

The standard suffixes are required, so the actual commands are cmpq, cmpl, cmpw, and cmpb

The `cmp` command is used in conjunction with other commands to actually do the jumps

The options we will consider are:

- **je** Jumps if arg1 equals arg2
- **jne** Jumps if arg1 is not equal to arg2
- **ja** Jumps if arg2 is above (greater than) arg1.  Does it seem backwards to you?
- **jae** Jumps if arg2 is above or equal to arg1
- **jb** Jumps if arg2 is below arg1
- **jbe** jumps if arg2 is below or equal to arg1

Let's assume a club only lets people in if they are exactly 21 years old.  

```
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
   age: .quad 21
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


   #check to see if the person is 21
   cmpq  $21, %r8
   jne    _not21
   movb  yes, %r9b
   _not21:

   #check some other criteria

_saveOutput:
   movb   %r9b, allowedIn

_exit:
   movq $60, %rax
   movb allowedIn, %dil
   syscall
```

- If the club allows people in who are 21 and over, the code would be:

```
   cmpq  $21, %r8
   jb    _not21
```