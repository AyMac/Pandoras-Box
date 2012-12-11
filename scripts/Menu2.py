# Outputs the local IP address of the Pi for easy SSH access

import sys, serial, time, socket

global serialport
global IPaddr
LCD = serial.Serial('/dev/ttyAMA0', 9600)

s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
s.connect(('google.com', 0))
IPaddr = s.getsockname()[0]

LCD.open()
LCD.write('\xFE\x01')
LCD.write('\xFE\x80')
LCD.write("IP Address: ")
LCD.write('\FE\xC0')
LCD.write(IPaddr)

LCD.close()
