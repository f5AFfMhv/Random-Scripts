#!/bin/bash

# Script finds which window is active and executes specific shortcut depending on application

ACTIVE_WINDOW=$(xdotool getactivewindow getwindowname)

if ! [[ -z $(echo $ACTIVE_WINDOW | grep -o -s "Terminal") ]]; then
	sleep 0.1
	if [ "$1" = "plus" ]; then
 		xdotool key --clearmodifiers ctrl+plus
 	elif [ "$1" = "minus" ]; then
 		xdotool key --clearmodifiers ctrl+minus
 	elif [ "$1" = "tab" ]; then
 		xdotool key --clearmodifiers ctrl+t
 	elif [ "$1" = "close" ]; then
 		xdotool key --clearmodifiers ctrl+w
 	fi
elif ! [[ -z $(echo $ACTIVE_WINDOW | grep -o -s "Sublime Text") ]]; then
 	sleep 0.1
 	if [ "$1" = "plus" ]; then
 		xdotool key --clearmodifiers ctrl+equal
 	elif [ "$1" = "minus" ]; then
 		xdotool key --clearmodifiers ctrl+minus
 	elif [ "$1" = "tab" ]; then
 		xdotool key --clearmodifiers ctrl+n
 	elif [ "$1" = "close" ]; then
 		xdotool key --clearmodifiers ctrl+w
 	fi
elif ! [[ -z $(echo $ACTIVE_WINDOW | grep -o -s "Chromium") ]]; then
 	sleep 0.1
 	if [ "$1" = "plus" ]; then
 		xdotool key --clearmodifiers ctrl+equal
 	elif [ "$1" = "minus" ]; then
 		xdotool key --clearmodifiers ctrl+minus
 	elif [ "$1" = "tab" ]; then
 		xdotool key --clearmodifiers ctrl+t
 	elif [ "$1" = "close" ]; then
 		xdotool key --clearmodifiers ctrl+w
 	fi
elif ! [[ -z $(echo $ACTIVE_WINDOW | grep -o -s "Dolphin") ]]; then
 	sleep 0.1
 	if [ "$1" = "plus" ]; then
 		xdotool key --clearmodifiers ctrl+plus
 	elif [ "$1" = "minus" ]; then
 		xdotool key --clearmodifiers ctrl+minus
 	elif [ "$1" = "tab" ]; then
 		xdotool key --clearmodifiers ctrl+t
 	elif [ "$1" = "close" ]; then
 		xdotool key --clearmodifiers ctrl+w
 	fi
elif ! [[ -z $(echo $ACTIVE_WINDOW | grep -o -s "Pix") ]]; then
 	sleep 0.1
 	if [ "$1" = "plus" ]; then
 		xdotool key --clearmodifiers equal
 	elif [ "$1" = "minus" ]; then
 		xdotool key --clearmodifiers minus
 	elif [ "$1" = "close" ]; then
 		xdotool key --clearmodifiers ctrl+q
 	fi
elif ! [[ -z $(echo $ACTIVE_WINDOW | grep -o -s "Arduino") ]]; then
 	sleep 0.1
 	if [ "$1" = "plus" ]; then
 		xdotool key --clearmodifiers ctrl+plus
 	elif [ "$1" = "minus" ]; then
 		xdotool key --clearmodifiers ctrl+minus
 	fi
elif ! [[ -z $(echo $ACTIVE_WINDOW | grep -o -s "Thunderbird") ]]; then
 	sleep 0.1
 	if [ "$1" = "plus" ]; then
 		xdotool key --clearmodifiers ctrl+equal
 	elif [ "$1" = "minus" ]; then
 		xdotool key --clearmodifiers ctrl+minus
 	elif [ "$1" = "close" ]; then
 		xdotool key --clearmodifiers ctrl+q
 	fi
elif ! [[ -z $(echo $ACTIVE_WINDOW | grep -o -s ".pdf") ]]; then
 	sleep 0.1
 	if [ "$1" = "plus" ]; then
 		xdotool key --clearmodifiers ctrl+plus
 	elif [ "$1" = "minus" ]; then
 		xdotool key --clearmodifiers ctrl+minus
 	elif [ "$1" = "close" ]; then
 		xdotool key --clearmodifiers ctrl+w
 	fi
elif ! [[ -z $(echo $ACTIVE_WINDOW | grep -o -s "DesktopEditors") ]]; then
 	sleep 0.1
 	if [ "$1" = "plus" ]; then
 		xdotool key --clearmodifiers ctrl+equal
 	elif [ "$1" = "minus" ]; then
 		xdotool key --clearmodifiers ctrl+minus
 	elif [ "$1" = "close" ]; then
 		xdotool key --clearmodifiers ctrl+w
 	fi
fi
