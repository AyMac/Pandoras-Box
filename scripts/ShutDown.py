#Prints a shutdown message to the LCD, then disables the LCD module

import sys, serial, time

global serialport
LCD = serial.Serial('/dev/ttyAMA0', 9600)
LCD.open()

LCD.write('\xFE\x01')
LCD.write('\xFE\x80')
LCD.write("Shutting Down")
time.sleep(2)
LCD.write('\xFE\x08')

