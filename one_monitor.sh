#!/bin/bash

#################################################
#Redaguota:		2020-01-23						#
#Paskirtis:		Isjungti antra ekrana		 	#
#################################################

DISPLAY_FLAG=$(xrandr --listactivemonitors | grep "HDMI-0")
if [[ -z $DISPLAY_FLAG ]]
then
	echo "doing nothing"
else
	xrandr --output HDMI-0 --off #Isjungti antra ekrana
fi