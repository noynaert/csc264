# 12.070 Floating Point Instructions

Only concerned with scalar instructions

## Scalar Single-precision (32-bit float)

These operate on the low lane only

- movss -- Load or store Scalar Single Precision
- addss -- Add single precision 
- subss -- Subtract single precision
- mulss -- Multiply single precision
- divss -- divide single precision

- cvtsi2ss --	Convert integer → float
- cvtss2si --	Convert float → integer
- cvtps2pd --	Convert packed single → packed double
- cvtss2sd --	Convert scalar float → scalar double
- cvtsd2ss --	Convert scalar double → scalar float

## Scalar Double Precision

- movsd -- Load or store double precision
- addsd -- Add scalar double
- subsd -- Subtract Scalar double
- mulsd -- Multiply Scalar double
- divsd -- Divide Scalar double

## How the operations work

### `addsd` and `subsd`

Use the normal src, dest syntax

- The src may be an XXM register or a memory address
- The dest must be an XXM register
- The constents of the src are added/subtracted from the dest, and the dest is replaced.
- Upper lanes remain unchanged

## `mulsd` and `subsd`

Multiplication and division work just like addition and subtraction.  

### Differences in multiplication operations between integers and floating point

In integer arithmetic, the multiply and divide instructions used the RAX and RDX registers.  

In floating point operations, the multiplication and division operations work just like add and subtract.

Division just produces the quotient, not the quotient and a remainder.