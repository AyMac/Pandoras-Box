
#Read the file output from eventcmd.sh in the home/pi/.config/pianobar/scripts/out file
#and print to the LCD Display

import sys, serial

global serialport
LCD = serial.Serial('/dev/ttyAMA0', 9600)
LCD.open()


f=open('/home/pi/.config/pianobar/scripts/out', 'r')

song = f.readline()
artist = f.readline()

if len(song) > 16:
    choppedsong = song[0:12] + "..."
else:
    choppedsong = song[0:(len(song)-1)]
    
if len(artist) > 16:
    choppedartist = artist[0:12] + "..."
else:
    choppedartist = artist[0:(len(artist)-1)]

LCD.write('\xFE\x01')
LCD.write('\xFE\x80')
LCD.write(choppedsong)
LCD.write('\xFE\xC0')
LCD.write(choppedartist)

print choppedsong
print choppedartist

f.close()
LCD.close()
