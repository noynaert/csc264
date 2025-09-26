# hmwk04  

## New Rule for Homework:

Homework may not include any instructions that we have not covered in class.  I want people to be thinking these problems through themselves.  It is OK to get help, but remember that you are responsible for your own work.  

AI may be used as a tool to help through specific parts of the program, but it should not be used to write the majority of the program.  Further, you must be able to explain every line of code in your program.  

## The main assignment:

### Summing the first n integers

Here is some fancy math for you:

$\sum_{k=1}^n k = \frac{n(n+1)}{2} = \frac{n^2+n}{2}$

This means that if you add up all the integers from 1 to n, you get the same result as if you multiply n by (n+1) and then divide by 2.

For example, if n = 5:

$\sum_{k=1}^5 k = 1 + 2 + 3 + 4 + 5 = 15$

And using the formula:

$\frac{5(5+1)}{2} = \frac{5 \times 6}{2} = \frac{30}{2} = 15$

Of course, the order of the addition does not matter, so you could also write $15 = 5 + 4 + 3 + 2 + 1$.

### The Program

We will an assembler program that computes the sum of integers.  

The program will be based on the `jz.s` file at [https://github.com/noynaert/csc264/blob/main/04_Branching/sourcecode/jz.s](https://github.com/noynaert/csc264/blob/main/04_Branching/sourcecode/jz.s).

Hmwk04 will be very similar to `jz.s`.

I suggest the following:

Create two memory locations:

* `n` - a quad word.  This will represent n in the formula. I suggest that for debugging you set a small number like 3, 4, or 5.  
* `sum` - a quad word.  This will represent the sum of integers from 1 to n.

Use the following registers:

* `rax` will be initialized to 0.  It will be an accumulator for the sum.
* `rcx` will be initialized to n.  It will be decrements down to 0

The setup steps will be:

* Clear the `rax` register.
* Load `n` into `rcx`.

The loop will do the following tasks:

* Add `rcx` to `rax`
* Decrement `rcx`
* If `rcx` is not zero, jump back to the top of the loop

After the loop, move the `rax` to the `sum` memory location.

#### Some notes:  

We can only return values up to 255.  If n is 22, the sum is 253.  The program should return a correct value for n for any value up to 22.  If n is larger than 22, you could check the results in the debugger.

You are only eligible to do the bonus assigmments if all homework and video notes have been completed and turned in.

## Bonus Assignment #1

2 point bonus:

Write a program from scratch calculates $\frac{n(n+1)}{2}$

The only thing we have not covered is division.  In this case it is division by 2.  A "cheap" wat to divide by 2 is to shift the bits right by 1 bit.  The remainder is lost, but the quotient is correct.  

The `sar` command shifts the bits right, preserving the sign bit.  The following command shifts the bits in rax 1 to the right:

```
sar $1, %rax
```

## Bonus Assignment #2: The Collatz Conjecture

10 point bonus:

Watch the first three minutes of [this video on the Collatz Conjecture](https://youtu.be/094y1Z2wpJg?si=XYLe0tvxch1oJl5F).  You may watch more if you are interested.

Write a program that starts with n, and then counts how many steps it takes to reach 1.  

### Extra code you will need:

#### Dividing by 2  
  
   See the previous bonus assignment for how to do this.

#### Determining if a number is odd or even 

In binary, even numbers end in 0 and odd numbers end in 1.  We can use a bitwise AND operation to determine if a number is odd or even.  If we AND a number with 1, the result will be 0 if the number is even and 1 if the number is odd.  Here is the code:

```
    andq $1, %rbx  # results in 1 if odd, and 0 if even
    jz _even      # jump if even

    # process odd number by multiplying by 3 and adding 1 
