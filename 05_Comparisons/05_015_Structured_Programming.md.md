
# 05.015 Structured Programming

## What is structured programming?

Structured programming is a programming paradigm that emphasizes the use of clear, well-defined control structures to improve the readability, maintainability, and reliability of code. 

* Code should have one entry point and one exit point.
* No `goto` statements. (or minimal use of goto in languages where it is necessary)
* Use control structures like `if...else`, `while`, `for`, and `switch` to manage the flow of the program.
* Maintainability is almost always more important than saving a few bytes of memory or extra instructions.
	* Modern compilers (and even interpreters) produce highly optimized code that overcomes most inefficiencies introduced by structured programming.

## Can Assembler be done with Structured Programming?

Assembler does not have instructions for while loops and if..else structures.  In fact, the `jmp` and comparison instructions are just instructions, there are no programming structures like while loops.

That said, some principles of structured programming can apply.
