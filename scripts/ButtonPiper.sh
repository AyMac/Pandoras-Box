#!/bin/bash

# This script runs continuously on the Pi. It polls for pushbuttons
# (by waiting for the GPIO lines to go LOW) and performs
# different actions depending on which button was pressed

gpio -g mode 2 in 	#Pin 0 on Revision 1 Board
gpio -g mode 3 in 	#Pin 1 on Revision 1 Board
gpio -g mode 4 in
gpio -g mode 17 in
gpio -g mode 27 in 	#Pin 21 on Revision 1 Board
gpio -g mode 22 in

n=68 			#Number of available stations in your account

for (( ; ; ))
do
	if [ $(gpio -g read 2) = 0 ] #Pin 0 on Revision 1 Board
	then
		#NEW SONG
		python /home/pi/.config/pianobar/scripts/SongChange.py
		echo 'n' >> /home/pi/.config/pianobar/ctl
		sleep 3
	fi

	if [ $(gpio -g read 3) = 0 ] #Pin 1 on Revision 1 Board
	then
		#NEW STATION
		python /home/pi/.config/pianobar/scripts/StationChange.py
		a=$RANDOM #Random seed value to pick the station with
		amodn=$(($a % ($n + 1)))
		foo='s'$amodn
		echo $foo >> /home/pi/.config/pianobar/ctl
		sleep 3
	fi

	if [ $(gpio -g read 4) = 0 ]
	then
		#VOLUME DOWN
		echo '((((' >> /home/pi/.config/pianobar/ctl
		sleep 0.5
	fi

	if [ $(gpio -g read 17) = 0 ]
	then
		#VOLUME UP
		echo '))))' >> /home/pi/.config/pianobar/ctl
		sleep 0.5
	fi

	if [ $(gpio -g read 27) = 0 ] #Pin 21 on Revision 1 Board
	then
		#PAUSE/PLAY
		echo 'p' >> /home/pi/.config/pianobar/ctl
		sleep 1
	fi

	if [ $(gpio -g read 22) = 0 ]
	then
		#SHUT DOWN IF HELD FOR 2 SECONDS
		sleep 2
		if [ $(gpio -g read 22) = 0 ]
		then
			python /home/pi/.config/pianobar/scripts/ShutDown.py
			echo 'q' >> /home/pi/.config/pianobar/ctl
			sudo shutdown -h now
		else 
			python /home/pi/.config/pianobar/scripts/Menu.py

			# Wait for a button to be pressed
			while [ $(gpio -g read 2) = 1 ] && [ $(gpio -g read 3) = 1 ] && [ $(gpio -g read 4) = 1 ]  && [ $(gpio -g read 22) = 1 ]
			do
			:
			done

			if [ $(gpio -g read 2) = 0 ]
			then
				echo '+' >> /home/pi/.config/pianobar/ctl
				python /home/pi/.config/pianobar/scripts/Like.py
				sleep 2
			elif [ $(gpio -g read 3) = 0 ]
			then 
				echo '-' >> /home/pi/.config/pianobar/ctl
				python /home/pi/.config/pianobar/scripts/Dislike.py
				sleep 2
			elif [ $(gpio -g read 4) = 0 ]
			then
				python /home/pi/.config/pianobar/scripts/Menu2.py
				sleep 8
			fi
			python /home/pi/.config/pianobar/scripts/ParseAndWrite.py
		fi
	fi
done
