# 08.040 Memory Addressing Modes

"Memory" is only one of the three modes. For memory modes we must calculate the address.  It is expressed different ways.  The formula below uses the format in Chapter 6, page 67 of the Bartlett textbook

$address = VALUE(BASEREG, IDXREG, MULTIPLIER)$

The above statement is syntax, not math.  Mathematically, the adress is calculated as follows:

$address = VALUE + BASEREG + (IDXREG \times MULTIPLIER)$

- VALUE is an integer value.  Some other sources call it "OFFSET"
- BASEREG is a register
- IDXREG is a register
- MULTIPLIER is 1, 2, 4, or 8. 

## We have been using the above formula all semester.

Not all elements of the formula are required.  We have been using the VALUE.  When we used a variable label, we were using the VALUE.

The second form we used involved putting the register in parenthesis, such as `(%rdi)`

Those work alone because the Value, BaseReg and IdxReg are all assumed to be zero if they are not stated.  The Multiplier is assumed to be 1 if not stated.

## Examples
Assumes "number" is a label, perhaps the base of an array.
- number
- (%rbx)
- number(%rbx)
- 7(%rbx)
- (%rbx,%rsi,4)
- (%rbx,%rsi)
- number(%rbx, %rsi)
- number(%rbx, %rsi, 8)
- number(%rip)

