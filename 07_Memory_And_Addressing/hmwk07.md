# Homework 07

## Overview

Read a series of digits from the keyboard and save them to a buffer.  Convert the string of digits to a number and save it to a variable.  Then use a `call printf` to print the number in both decimal and hex.  You may assume that there is at least one valid digit, although it is better if your code works properly if no digits are entered (it would produce a 0.)

The string may be up to 10 characters long.  You should top reading if you have more than 10 characters.

You will need to read characters and save them to a buffer if they are less than '0' or greater than '9'.  Stop reading if a non-digit is read.  (Optionally, you may discard the non-digits so the operating system does not try to execute them as a command.)

## Comments

Include comments in your code.  I will deduct points for lack of comments.

- At the top of your code:
	- Describe what your program does in a sentence or two.
	- Give the file name
	- Give your name
	- Give the start date (at least the month and year)
	- LIst the registers you use.   Do not list the registers you used for `syscall` or `call` because they are standardized
	- Explain what assembler and linker to use.  In this case, it will be `gcc`
- Group your code into blocks
	- Put a comment before each block explaining what that block does
	- Optionally, you may put a `_label:` before each block to act as a break point and some documentation.
- Most lines should have a very brief comment at the end of the line that gives a functional explanation.  Avoid just saying what the syntax says.

## Recommended steps.

* Figure out what registers and variables you need. you need (other than the standard `syscall` and `call` register).  
	- I used 3, although I could have gotten by without the third one:
    	* A counter for the length of the string
    	* A register to hold a 10 as a multiplier
    	* I used a temporary register to hold the character when I subtracted to 48, but I could have gotten by without it.
- I used the following variables:
	* A buffer in `.bss` area
	* bufferN contained the number of digits
	* maxLength held 10
	* prompt held the prompt "Enter a number: "
	* promptN The number of bytes in the prompt
	* format the format string stored as null-terminated ASCII (.asciz)  My string was "&bsol;nThe number is %d.  In hex, this would be 0x%x.&bsol;n"
* Print the prompt.  I used `syscall` for this output because I wanted the cursor to stay on the same line.
* Read the keyboard into the buffer.  This will be a loop.  Exit if a non-digit is entered or if there are more than 10 digits
* I used syscall to print the string.  This was just for debugging.  When I was done, I jumped around the code.
    
		```
		# write the string for debugging
        jmp _no_debug       
        movq $1, %rax       # 1 for syscall write
        movq $1, %rdi       # 1 for output to console
        movq $buffer, %rsi  # address to output from
        movq bufferN, %rdx  # Number of characters to print
        syscall
        _no_debug
		```

* Figure out what number is in the buffer.  This was one of the last things I did.  I will explain the algorithm below.
* `call Printf` the number.
 
### Algorithm for converting string in `buffer` to value in `number`.  I used `r13` to do the calculations

* Put  `bufferN` into the counting register  # We will count down to zero to control the loop.
* put address of the buffer into `%rsi`
* put a 10 (the multiplier) in a register
* clear the `%rax` with xor
* TOP OF LOOP GOES HERE
	1.  multiply `%rax` by 10
	2.  clear `%r13` with xor
	3.  move `(%rsi)` to `r13b` # move the character pointed to by %rsi to %r13b
	4.  subtract 48 from %r13b
	5.  add  `%r13` to the `%rax`
	6.  increment the `%rsi`
	7.  decrement the counting register
	8.  jump not zero to the top of the loop

## Suggested test data:

I stuck "pwd" at the end of each string to serve as a command to keep the operating system happy.  "pwd" prints the present working direction which is only one line of output.

- 123pwd
- 7pwd
- 01234pwd
- 1000pwd
- 999lpwd
- 000pwd
- 000123000pwd
- pwd
- 32768pwd
- 1234567890pwd
- 0123456789pwd
- 01234567899pwd  (produces a 9pwd as a bad command)

## For overachievers only:

Add a step that discards all the digits after an invalid number is added.  Then you don't need to append something lie pwd to each command.
