# Homework 5 Problem 2
# This script accepts an integer as a command line argument 
# And prints "Hello World!" as many times as given by the argument
# Example Invocation:
# ./HW5_P2.sh 5 --> This will print "Hello World!" 5 times

#!/bin/bash

n=$1

for (( i=0; i<n; i++ )) 
do
echo "Hello World!"
done
