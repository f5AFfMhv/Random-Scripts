#!/bin/bash

# on/off second display in correct orientation						


DISPLAY_FLAG=$(xrandr --listactivemonitors | grep "HDMI-0")
if [[ $DISPLAY_FLAG -eq "" ]]
then
	xrandr --output HDMI-0 --right-of DP-0 --mode 1920x1080 # Second display ON
else
	xrandr --output HDMI-0 --off # Second display OFF
fi