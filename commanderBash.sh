# Homework 5 Question 1
# This code invokes the application "led-hw4.sh" in the following manner:
# a. The first invocation will turn the LED on.
# b. The second invocation will turn the LED off.
# c. The third invocation will read status.
# d. The fourth invocation will flash the LED.
# e. The fifth invocation will blink the LED 3 times.
# Example Invocation:
# All invocations are done in script

#!/bin/bash

echo "Beginning Script"

echo "Turning LED on"
./led-hw4.sh on

 echo "Turning LED off"
./led-hw4.sh off

 echo "Reading status"
./led-hw4.sh status

 echo "Flashing LED"
sudo ./led-hw4.sh flash

 echo "Blinking LED 3 times"
./led-hw4.sh blink 3 

echo "End of script"
