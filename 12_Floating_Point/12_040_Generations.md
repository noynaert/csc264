# 12.040 Generations

Floating point operations have gone through a series of changes and improvements over the years.  If you get involved in an open source project or you end up trying to understand some bit of virus or malware code, you may run into some older floating point code that uses older techniques.  In this section we will look at some of the older floating point techniques that were used before the IEEE 754 standard was widely adopted.

A major change in floating point processing came with the introduction of the Intel 8087 coprocessor in 1980.  This Floating Point Unit (FPU) or "coprocessor" was designed to work alongside the Intel 8086 CPU and provided hardware support for floating point arithmetic.  

# Before the FPU Coprocessor

Before the introduction of the FPU coprocessor, floating point arithmetic was typically handled in software.  This meant that floating point operations were implemented using a series of integer operations, which were much slower and less efficient than hardware implementations.  

Most early manufacturers would release library routines that programmers could use to perform floating point operations.  These routines would handle the conversion of floating point numbers to and from their binary representations, as well as the actual arithmetic operations.  The quality varied from manufacturer to manufacturer, and some were much better optimized than others.  Sometimes it made sense to use a third-party library that provided better performance or accuracy. Also, there were some cases where programmers would write their own floating point routines to meet specific needs.

Another approach was to avoid doing floating point arithmetic altogether.  For example, financial calulations would be done representing pennies as integers rather than dollars as floating point numbers.  This avoided the pitfalls of floating point arithmetic, such as rounding errors, but required careful handling of scaling and formatting.

Example of avoiding floating point arithmetic:

$sqrt{((iy)^2 + x^2)} < 2$

## The Intel 8087 Coprocessor

The 8087 was a coprocessor.  It was a chip that looked like the CPU and usually was mounted on the motherboard next to the CPU.  When a CPU instruction was encountered, the main CPU acted like it was a function call, and it was passed off to the other chip to handle the floating point operation.  Once the coprocessor finished the operation, it would return the result back to the main CPU.

The Intel 8087 coprocessor introduced hardware support for floating point arithmetic, which significantly improved performance and accuracy.

The 8087 had 8 floating point registers in a stack.  It supported 32-bit single precision, 64-bit double precision, and 80-bit extended precision floating point formats.

The 8087 worked with the 8086 CPU.  The 80286 and 80386 CPUs which could be added to the motherboard.

The 80486 CPU had the CPU integrated into the main CPU chip.  This simplified the board design, and it greatly improved performance since the CPU and FPU could communicate more quickly.

Pentium processors added pipeling which was a further improvement in performance.

### Floating Point Bugs 

The Intel 8087 coprocessor had a famous bug known as the "Pentium FDIV bug."  This bug was discovered in 1994 and affected the division operation of the floating point unit.  The bug caused certain division operations to produce incorrect results, which could lead to significant errors in calculations.

The bug was traced back to a flaw in the lookup table used by the division algorithm.  Intel eventually recalled the affected processors and replaced them with corrected versions.

## SSE and SSE2

Pentium III processors introduced the Streaming SIMD Extensions (SSE) instruction set, which provided support for single-precision floating point operations using SIMD (Single Instruction, Multiple Data) techniques.  This allowed for parallel processing of multiple floating point values in a single instruction, significantly improving performance for certain types of calculations.

The Pentium 4 processors introduced SSE2, which extended the SSE instruction set to include support for double-precision floating point operations.  This further improved performance for applications that required high-precision calculations.

## Modern Floating Point (2011 to present)

The current generation of processors, including Intel's Core series and AMD's Ryzen series, continue to support and enhance floating point operations.  Modern processors include advanced features such as AVX (Advanced Vector Extensions) and AVX2, which provide even greater parallelism and performance for floating point calculations.  The current standard is AVX-512, which supports 512-bit wide vector operations.

