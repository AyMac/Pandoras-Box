# Prints a welcome message
# to the LCD display

import sys, serial, time

global serialport
LCD = serial.Serial('/dev/ttyAMA0', 9600)
LCD.open()

LCD.write('\xFE\x01')
LCD.write('\xFE\x80')
LCD.write("Connecting to")
LCD.write('\xFE\xC0')
LCD.write("Pandora Radio...")

