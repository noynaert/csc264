# 12.020 Decimal vs Binary Floating Point

Integers represent whole numbers exactly.  Binary and decimal integers represent exactly the same values, they are just expressed in different bases.

With floating point numbers, all the wheels come off.  Decimal floating point numbers and binary floating point numbers represent different sets of values, and many decimal fractions cannot be represented exactly as binary fractions.

Some numbers that are simple decimal fractions have no exact binary representation.  For example, the decimal number 0.1 cannot be represented exactly as a binary fraction.  In binary, 0.1 is represented as an infinite repeating fraction: 0.00011001100110011... and so on.

Decimal Value|Binary Value
:---:|:---:
$0.1$|$0.00011001100110011...$
$0.2$|$0.0011001100110011...$
$0.3$|$0.0100110011001100...$
$0.4$|$0.0110011001100110...$
$0.5$|$0.1$
$0.6$|$0.10011001100110011...$
$0.7$|$0.1011001100110011...$
$0.8$|$0.1100110011001100...$
$0.9$|$0.1110011001100110...$   

This means that when you try to represent decimal fractions in binary floating point format, you may encounter rounding errors and precision issues.  This is particularly important in financial calculations where exact decimal representation is required.
