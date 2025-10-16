# 07.050 Sections

This unit covers Chapter 06 from the textbook

## `.section` vs `.section .data`

The `.section` directive sets aside an area where you may create a custom section to declare data fields and reserve memory.   

```
.section .names
   firstName:  .asciiz "Bob"
   secondName: .asciiz "Ted"
   thirdName:  .asciiz "Carol"
   forthName:  .asciiz "Alice"
.section .flags
   .isUpperCase   .byte 0
   .isPunctuation .byte 0
```

The `.data` directive is a predefined section for holding data.  It is not necessary to precede it with `.section`, but it is often done.