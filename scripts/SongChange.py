#Prints a simple notification to the LCD screen

import sys, serial, time

global serialport
LCD = serial.Serial('/dev/ttyAMA0', 9600)
LCD.open()

LCD.write('\xFE\x01')
LCD.write('\xFE\x80')
LCD.write("Changing        ")
LCD.write('\xFE\xC0')
LCD.write("Songs           ")
