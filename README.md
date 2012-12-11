Pandoras-Box
============

An accumulation of script files for the "Pandora's Box" internet radio player (based on a Raspberry Pi)

See the Instructable for information on setting up a system to run this code

Interested in how the code works? 
 - Start with the "PandorasBox.sh" script. This is run at startup, and checks for a
 - high state on the "Shutdown" button. If it reads a high state, this script runs "ButtonPiper.sh", the main
- script. If it reads a low state, it exits without starting the button's functions. 

"What's the point of checking the button?"
 - If you have these scripts installed on your Raspberry Pi but don't have the buttons connected (for whatever reason)
 - then the Pi will automatically shut down after it boots. This is very frustrating!

"What else?"
 - After that, take a look at the "ButtonPiper.sh" script. It continuously polls the pushbuttons for a change.
 - If a button is pressed, this script pipes commands to Pianobar (through fifo) and calls an appropriate
 - Python script to display a message on the LCD. 

"...I'm a programmer. Your programming is bad, and you should feel bad."
 - Great! I am not a true programmer. I am an electrical engineer. A lot of my programming probably makes you
 - cringe. You are welcome to help me improve this system, if that's how you like to spend your time.
 - I can be reached at amcginnis02 (at) gmail (dot) com. No Male Enhancement emails please.

Thanks for reading!