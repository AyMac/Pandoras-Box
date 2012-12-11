# Opens the Menu screen for more options

import sys, serial, time

global serialport
LCD = serial.Serial('/dev/ttyAMA0', 9600)
LCD.open()

LCD.write('\xFE\x01')
LCD.write('\xFE\x80')
LCD.write("Menu:           ")
time.sleep(1)
LCD.write('\xFE\x80')
LCD.write("1:Like 2:Dislike")
LCD.write('\xFE\xC0')
LCD.write("3:IP      6:Exit")

LCD.close()
