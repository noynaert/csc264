# 02.010 Recap about Registers

## Textbook -- Chapters 4 (first part), Appendix C


## Recap
We have been talking about registers.  Let's do a quick recap of what we know so far:

* Registers are part of the CPU.
* Registers are extremely fast because they are in the CPU itself.
* Registers have a width.  This width has changed on the different generations of x86 processors
  * On original IBM PC's with 8086 and 80286 processors, the registers were 16 bits wide.
    * They also had a way to use 8-bit registers
  * On 80386, 80486, and some other CPUs, the registers were 32 bits wide.
  * On most systems since 2005, most PCs and laptops have 64 bit registers.
  * If we are programming on x86-64 systems, we can access the 64-, 32-, or 16/8-bit registers.  I will use theh AX register as an example
    * AX  -- The original 16-bit register
      * AH and AL are the two 8-bit registers within the AX
    * EAX -- The 32-bit register
    * RAX -- The 64-bit register
  * The number of registers has also grown over time.
    * 8086 has eight general-purpose registers.
    * x86-64 has 16 general-purpose registers.
    * There are several other registers that serve special purposes.
    * "General Purpose" is somewhat misleading.  Most of them have some special use.  The programmer can freely read and write to them, but only if the register is not being used for one of its unique purposes.

## Advice for this unit

Don't get lost in the weeds.  The special purposes of the registers include concepts like
stack pointers and base-offset registers.  Those terms have no meaning yet.  For now, keep the general structure of pointers in mind, but don't try to memorize all the purposes right now.  On the first exam, I will not expect you to remember what all the registers do.  We will add those as the course goes on.

## Digress into Debugging

I am an experimental learner.  Many programmers seem to learn by working with programs and seeing what happens.

We will digress to using debuggers to try to see what is going on with registers.