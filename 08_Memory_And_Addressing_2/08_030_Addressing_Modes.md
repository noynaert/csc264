# 08.030 Addressing modes

These are modes for operands.  Some instructions allow certain types of operands

```
    movq $42, %rax
    inc  %rdi
```

- Immediate:   THE VALUE IS PLACED DIRECTLY IN THE INSTRUCTION
	- $42
	- $0x42
	- $label  # (address of label)
- Register  THE VALUE IS PLACED IN A REGISTER
	- %rax
	- %al
- Memory  THE VALUE IS IN MEMORY (and it is often calculated)
	- Many different forms.  
		- We have been using a couple of them already
			- number   # labels
			- (%rdi)      # pointer stored in memory
		- More in next unit