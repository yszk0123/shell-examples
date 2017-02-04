#!/bin/bash -e
array=(123 "foo bar" baz)
echo "array[0]: ${array[0]}"
echo "array[1]: ${array[1]}"
echo "array[2]: ${array[2]}"
echo "array[3]: ${array[3]}"
echo "length: ${#array[*]}"

index=1
echo "array[index=$index]: ${array[$index]}"
