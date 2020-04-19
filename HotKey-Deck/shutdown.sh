#!/bin/bash

# Shutdowns computer after specified time with notifications for user.
# To work correctly we need to download improved notify-send from
# https://github.com/vlevit/notify-send.sh
# and create symbolic links for scripts e.g.
#
# sudo ln -s /path/to/notify-send.sh /usr/bin/notify-send.sh
# sudo ln -s /path/to/notify-action.sh /usr/bin/notify-action.sh


shutdown -h 1
NID=$(notify-send.sh "Shutdown in 1 min" -p -u normal -i /home/mint/Pictures/icons/shutdown.png "To cancel press the button")

for x in  {1..60}
do
	notify-send.sh --replace=$NID "Shutdown in $(( 60 - $x )) s" \
		"To cancel run:\nshutdown -c" \
		-u normal -i /home/mint/Pictures/icons/shutdown.png \
		-l "kill $BASHPID"
	sleep 1
done