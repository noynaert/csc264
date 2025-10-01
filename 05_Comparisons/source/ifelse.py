#!/usr/bin/python3

print("Enter a letter:")
number = int(input())
print(f"You entered: {number}")

label = ""
if number %2 == 0:
  label = "even"
else:
  label = "odd"

print (f"{number} is {label}")

