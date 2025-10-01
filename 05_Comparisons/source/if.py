#!/usr/bin/python3

print("Enter a number:")
number = int(input())
print(f"You entered: {number}")

label = "odd"
if number %2 == 0:
  label = "even"
print (f"{number} is {label}")

