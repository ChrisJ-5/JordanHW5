#!/bin/bash
# A small Bash script to set up User LED3 to be turned on or off from
# Linux console. Written by Derek Molloy (derekmolloy.ie) for the
# book Exploring BeagleBone
# Edits made by Chris Jordan:
#   Added 2 command line arguments:
#       blink - This argument will turn the LED on and off for 1 second each
#       n - This argument determines how many times the LED is blinked
# For example: sudo ./led-hw4.sh blink 5
#     This invocation will blink the LED 5 times

LED3_PATH=/sys/class/leds/beaglebone:green:usr3

# Example bash function
function removeTrigger 
{
echo "none" >> "$LED3_PATH/trigger" 
}

echo "Starting the LED Bash Script"

if [ $# -eq 0 ]; 
then
echo "There are no arguments. Usage is:"
echo -e "bashLED Command \n where command is one of "
echo -e " on, off, flash, blink, or status \n e.g. bashLED on"
exit 2
fi
echo "The LED Command that was passed is: $1"
if [ "$1" == "on" ]; then
echo "Turning the LED on"
removeTrigger
echo "1" >> "$LED3_PATH/brightness"
elif [ "$1" == "off" ]; then
echo "Turning the LED off"
removeTrigger
echo "0" >> "$LED3_PATH/brightness"
elif [ "$1" == "flash" ]; then
echo "Flashing the LED"
removeTrigger
echo "timer" >> "$LED3_PATH/trigger"
sleep 1
echo "100" >> "$LED3_PATH/delay_off"
echo "100" >> "$LED3_PATH/delay_on"
# HW4---------------------------------------
# Blink LED "n" times
n=$2
elif [ "$1" == "blink" ]; then
  echo "Blinking the LED $2 times"

for ((i = 1; i <= $2; i++)); do
  echo "1" >> "$LED3_PATH/brightness"
  sleep 1
  echo "0" >> "$LED3_PATH/brightness"
  sleep 1
done
#--------------------------------------------
elif [ "$1" == "status" ]; then
cat "$LED3_PATH/trigger";
fi
echo "End of the LED Bash Script"
#debian@beagliebone:~/JordanHW4/led-hw4.sh
