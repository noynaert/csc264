# 08.020 Declaring Arrays (and other stuff)

"Array" is an abstraction used in high level languages. However, in Assembler, data is just data. We can impose our concept of arrays onto assembler.

```
..data
    char:  .byte 64  # same as 0x40
           .byte 65  # same as 0x41
           .byte 66  # same as 0x42
           .byte 67  # same as 0x43
           .byte 68  # same as 0x44
           .byte  0  # Null terminated
    charN: .quad .-char
    animal:.byte  99,97,'t',0
    animalN:.quad .-animal

    number:  .word   1492, 1066, 1776, 1945
    numberN: .word   .-number
    bigNum:  .quad   1066, 1492, 1945, 2020
    bigNumN: .quad   .-bigNum
```

The example illustrates that skipping labels is one way to create an array.  However, using commas generally works better.

Using `.-label` counts the number of bytes, not the number of elements in the array.  

| Type  | Bytes |
| :---: | :---: |
| .byte |   1   |
| .word |   2   |
|.dword|4
|.quad|8
