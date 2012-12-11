# Opens the Menu screen for more options

import sys, serial, time

global serialport
LCD = serial.Serial('/dev/ttyAMA0', 9600)
LCD.open()

LCD.write('\xFE\x01')
LCD.write('\xFE\x80')
LCD.write("Liking Song     ")

LCD.close()
