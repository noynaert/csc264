
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
.data
   age: .quad 21
   yes: .ascii "Yes"
   no:  .ascii "No"
   allowedIn: .byte 0

.text
_start:
   mov age, %r8   #set the age in r8

   movb   yes, %r9b  #set the label in r9

   #do the comparison
   cmpq   $21, %r8    #club only allows in 21 year olds.
   je     _output
   movb   no, %r9b

   _output:
   movb   %r9b, allowedIn
```

- If the club allows people in who are 18 and over, the code would be:

```
   compq $21, $r8
   jae _output
```