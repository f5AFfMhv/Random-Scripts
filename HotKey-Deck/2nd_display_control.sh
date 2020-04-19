#!/bin/bash

#################################################
#Redaguota:		2019-03-28						#
#Paskirtis:		Isjungti/ijungti antra ekrana	#
#################################################

DISPLAY_FLAG=$(xrandr --listactivemonitors | grep "HDMI-0")
if [[ $DISPLAY_FLAG -eq "" ]]
then
	xrandr --output HDMI-0 --right-of DP-0 --mode 1920x1080 #Ijungti antra ekrana
else
	xrandr --output HDMI-0 --off #Isjungti antra ekrana
fi