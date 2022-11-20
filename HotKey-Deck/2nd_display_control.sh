#!/bin/bash
#
# Author: 		Martynas J. https://github.com/f5AFfMhv
# Modified:		2021-11-27
# Description:	Turns on/off second display depending on current display configuration.
#				Determine your monitors with:
#					xrandr --listmonitors | tail -n +2 | awk '{print $4}'

# Monitor configuration
MAIN="HDMI-1"
SEC="DP-2"

# Function prints script description and usage
usage() {
cat<<EOF
Usage: ./$(basename "${BASH_SOURCE[0]}") [-h]
Description:
	Turns on/off second display ddepending on current display configuration.
	Determine your monitors with:
		xrandr --listmonitors | tail -n +2 | awk '{print $4}'
Options:
	-h		Print this help and exit
EOF
exit
}

# Print help message if anay parameter is passed
if [ $1 ]; then usage; fi

# Check if dependencies is statisfied
if [ -z $(command -v xrandr) ]; then
    echo "xrandr could not be found"
    exit 1
fi

# Check if there is not more than 2 active monitors
if [ "$(xrandr --listactivemonitors | tail -n +2 | awk '{print $4}' | wc -l)" -gt "2" ]; then 
	echo "Unsuported display configuration: more than 2 monitors detected"
	exit 1
elif [ "$(xrandr --listactivemonitors | tail -n +2 | awk '{print $4}' | wc -l)" -eq "2" ]; then	
	echo "Turning off ${SEC} display"
	xrandr --output $SEC --off
else
	echo "Turning on ${SEC} display"
	xrandr --output $SEC --left-of $MAIN --mode 2560x1440
fi
