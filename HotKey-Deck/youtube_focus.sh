#!/bin/bash
#
# Author: 			Martynas J. https://github.com/f5AFfMhv
# Modified:			2024-01-16
# Description:		Focuses browser window which has youtube opened.
#
# NOTE: Script only works with applications that runs on X11.

# Dependencies
DEP="wmctrl"
# Window name search keyword
WIN_NAME="YouTube"

# Function prints script description and usage
usage() {
cat<<EOF
Usage: ./$(basename "${BASH_SOURCE[0]}") [-h]
Description:
	Focuses Browser window which has youtube tab opened.

Options:
	-h, --help		Print this help and exit
EOF
}

# Print help message if any parameter is passed
if [ $1 ]; then usage; exit 0; fi

# Check if dependencies are installed
for app in $DEP; do
	if [ -z $(command -v $app) ]; then
			echo "$app is not installed"
			exit 1
	fi
done

# Get youtube window id
youtube_win_id=$(wmctrl -li | grep "${WIN_NAME}" | awk '{print $1}')
if [ -z $youtube_win_id ]; then
		echo "error: window was not found"
		exit 1
else
	echo "Window ID: $youtube_win_id"
	# Switch to youtube and execute shortcut
	wmctrl -ia $youtube_win_id
fi
