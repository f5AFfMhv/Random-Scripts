#!/bin/bash

# Script finds which window is active and executes specific shortcut depending on application
# Dependencies: xdotool

ACTIVE_WINDOW=$(xdotool getactivewindow getwindowname) # Get active window name
sleep 0.2 # Delay for more reliable shortcut execution

# Close active window
if [ "$1" = "close_all" ]; then
 	xdotool key --clearmodifiers Alt_L+F4
fi
#--------------------------------Terminal-----------------------------------
if ! [[ -z $(echo $ACTIVE_WINDOW | grep -o -s "Terminal") ]]; then
	if [ "$1" = "plus" ]; then
 		xdotool key --clearmodifiers Control_L+plus
 	elif [ "$1" = "minus" ]; then
 		xdotool key --clearmodifiers Control_L+minus
 	elif [ "$1" = "tab" ]; then
 		xdotool key --clearmodifiers Control_L+t
 	elif [ "$1" = "close" ]; then
 		xdotool key --clearmodifiers Control_L+w
 	fi
#--------------------------------Sublime Text-------------------------------
elif ! [[ -z $(echo $ACTIVE_WINDOW | grep -o -s "Sublime Text") ]]; then
 	if [ "$1" = "plus" ]; then
 		xdotool key --clearmodifiers ctrl+equal
 	elif [ "$1" = "minus" ]; then
 		xdotool key --clearmodifiers ctrl+minus
 	elif [ "$1" = "tab" ]; then
 		xdotool key --clearmodifiers ctrl+n
 	elif [ "$1" = "close" ]; then
 		xdotool key --clearmodifiers ctrl+w
 	fi
#--------------------------------Chromium-----------------------------------
elif ! [[ -z $(echo $ACTIVE_WINDOW | grep -o -s "Chromium") ]]; then
 	if [ "$1" = "plus" ]; then
 		xdotool key --clearmodifiers ctrl+equal
 	elif [ "$1" = "minus" ]; then
 		xdotool key --clearmodifiers ctrl+minus
 	elif [ "$1" = "tab" ]; then
 		xdotool key --clearmodifiers ctrl+t
 	elif [ "$1" = "close" ]; then
 		xdotool key --clearmodifiers ctrl+w
 	fi
#--------------------------------Dolphin-----------------------------------
elif ! [[ -z $(echo $ACTIVE_WINDOW | grep -o -s "Dolphin") ]]; then
 	if [ "$1" = "plus" ]; then
 		xdotool key --clearmodifiers ctrl+plus
 	elif [ "$1" = "minus" ]; then
 		xdotool key --clearmodifiers ctrl+minus
 	elif [ "$1" = "tab" ]; then
 		xdotool key --clearmodifiers ctrl+t
 	elif [ "$1" = "close" ]; then
 		xdotool key --clearmodifiers ctrl+q
 	fi
#----------------------------------Pix-------------------------------------
elif ! [[ -z $(echo $ACTIVE_WINDOW | grep -o -s "Pix") ]]; then
 	if [ "$1" = "plus" ]; then
 		xdotool key --clearmodifiers equal
 	elif [ "$1" = "minus" ]; then
 		xdotool key --clearmodifiers minus
 	elif [ "$1" = "close" ]; then
 		xdotool key --clearmodifiers ctrl+q
 	fi
#--------------------------------Arduino-----------------------------------
elif ! [[ -z $(echo $ACTIVE_WINDOW | grep -o -s "Arduino") ]]; then
 	if [ "$1" = "plus" ]; then
 		xdotool key --clearmodifiers ctrl+plus
 	elif [ "$1" = "minus" ]; then
 		xdotool key --clearmodifiers ctrl+minus
 	fi
#------------------------------Thunderbird---------------------------------
elif ! [[ -z $(echo $ACTIVE_WINDOW | grep -o -s "Thunderbird") ]]; then
 	if [ "$1" = "plus" ]; then
 		xdotool key --clearmodifiers ctrl+equal
 	elif [ "$1" = "minus" ]; then
 		xdotool key --clearmodifiers ctrl+minus
 	elif [ "$1" = "close" ]; then
 		xdotool key --clearmodifiers ctrl+q
 	fi
#-------------------------------PDF reader----------------------------------
elif ! [[ -z $(echo $ACTIVE_WINDOW | grep -o -s ".pdf") ]]; then
 	if [ "$1" = "plus" ]; then
 		xdotool key --clearmodifiers ctrl+plus
 	elif [ "$1" = "minus" ]; then
 		xdotool key --clearmodifiers ctrl+minus
 	elif [ "$1" = "close" ]; then
 		xdotool key --clearmodifiers ctrl+w
 	fi
#-------------------------------Only Office----------------------------------
elif ! [[ -z $(echo $ACTIVE_WINDOW | grep -o -s "DesktopEditors") ]]; then
 	if [ "$1" = "plus" ]; then
 		xdotool key --clearmodifiers ctrl+equal
 	elif [ "$1" = "minus" ]; then
 		xdotool key --clearmodifiers ctrl+minus
 	elif [ "$1" = "close" ]; then
 		xdotool key --clearmodifiers ctrl+w
 	fi
fi
