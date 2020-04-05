#!/bin/bash

#################################################
#Redaguota:		2020-01-23						#
#Paskirtis:		Ijungti antra ekrana			#
#################################################

DISPLAY_FLAG=$(xrandr --listactivemonitors | grep -o "+HDMI-0")
if [[ -z $DISPLAY_FLAG ]]
then
	xrandr --output HDMI-0 --right-of DP-0 --mode 1920x1080 #Ijungti antra ekrana
else
	# Patirinti ar teisingas monitoriu isdestymas
	DISPLAY_FLAG2=$(xrandr --listactivemonitors | grep -o "336+2560+0")
	if [[ -z $DISPLAY_FLAG2 ]]
	then
		xrandr --output HDMI-0 --right-of DP-0 --mode 1920x1080 #Ijungti antra ekrana
	else
		echo "doing nothing"
	fi
fi