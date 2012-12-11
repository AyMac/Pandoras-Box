#!/bin/bash

gpio -g mode 22 in

if [ $(gpio -g read 22) = 1 ]
then
	bash /home/pi/.config/pianobar/scripts/ButtonPiper.sh
fi
