#!/bin/bash

# Starts application passed in first argument. If it's already started brings window(s) to focus

if [ -z $1 ] || [ $1 == "-h" ] || [ $1 == "--help" ]
then
	echo -e "Script starts only one instance of application. If running instance is found, script brings application to focus.\n\nUsage: start_only_one_app.sh <Application Name>\n\nExample: start_only_one_app.sh thunar"
else
	#Find application windows IDs
	mapfile -t ALL_WINDOWS < <(xdotool search --maxdepth 2 --class "$1" | grep -v "$(xdotool search --maxdepth 1 --class "$1")")

	if [[ -z $ALL_WINDOWS ]]; then
		$1 &
	else
		# Bring all windows to focus
		for (( i=0; i<${#ALL_WINDOWS[@]}; i++ )); do	
			xdotool windowactivate --sync ${ALL_WINDOWS[i]}
		done	
	fi
fi

