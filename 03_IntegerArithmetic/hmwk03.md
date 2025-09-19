# Hmwk03

There are times when we end up with a number that is in ASCII, and we need to convert it to an integer.  

There is an algorithm for converting a series of ASCII digits into the equivalent base 10 number. 

The algorithm is:

1. Clear the sum
2. Take the most significant digit that has not yet been processed.
   1. Multiply the sum times 10
   2. Subtract 48 from the ASCII code to get the value of the digit
   3. Add the value of the digit to the sum
3. Repeat for all of the digits in the ASCII string

We have not yet done looping, but we will adapt the above algorithm to sequential operation on 3 a 3-digit number.  

## Program development hidden agenda

Some people in the class need to work on program attack skills.  In computer science, this usually means breaking a large problem down into small parts.  Write one part at a time and make sure it is working before moving on to the additional steps.

Right now our only output is via debugging or return codes.  Running dbg or kdbg is bulky, so I will set up this program to be easier to test and debug using just the exit code for most of the testing.

Exit codes must be in the range of 0 through 255.  We will decode the string "219" to stay under the 255 limit.  

I strongly suggest that you develop the program one digit at a time.  Do not move on until you have the current section working correctly.

Another problem attack skill is to begin by deciding what variables you will use.  For Assembler, this involves also picking the registers.  It becomes useful documentation to add to the top of your program.  Here is my suggested use:

```text
    .data
    hundreds  --  Represent the first digit in the hundreds position.
    tens      -- Represent the second digit in the 10s position
    ones      -- Represent the third digit in the ones position.
    result    -- Holds the final answer.  It will also hold intermediate results for debugging

Register usage:

RAX -- Accumulator.  Holds the results of multiplication and added digits
RBX -- Conversion of the ASCII code to decimal value
RDX -- Will not be used, but it will be cleared after every multiplication.
R10 -- Holds 10.  The mul command does not allow immediate literals, so the value 10 must go in a register.  R10 seemed the logical choice.

```