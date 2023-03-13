#!/bin/bash
#
# Author: 			Martynas J. https://github.com/f5AFfMhv
# Modified:			2023-03-13
# Description:	Focuses firefox window which has youtube tab opened.

# Dependencies
DEP="wmctrl"
# Window name containing youtube
YOUTUBE_WIN_NAME="YouTube — Mozilla Firefox"

# Function prints script description and usage
usage() {
cat<<EOF
Usage: ./$(basename "${BASH_SOURCE[0]}") [-h]
Description:
	Focuses firefox window which has youtube tab opened.

Options:
	-h, --help		Print this help and exit
EOF
}

# Print help message if any parameter is passed
if [ $1 ]; then usage; fi

# Check if dependencies are installed
for app in $DEP; do
	if [ -z $(command -v $app) ]; then
			echo "$app is not installed"
			exit 1
	fi
done

# Get youtube window id
youtube_win_id=$(wmctrl -li | grep "${YOUTUBE_WIN_NAME}" | awk '{print $1}')
if [ -z $youtube_win_id ]; then
		echo "youtube window was not found"
		exit 1
fi
# Switch to youtube and execute shortcut
wmctrl -ia $youtube_win_id
