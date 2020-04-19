#!/bin/bash

# Notifys successfull openvpn TUN/TAP open or close operation

if ! [[ -z $1 ]]; then
	if [ $1 = "connected" ]; then
		DISPLAY=:0 sudo -u mint notify-send.sh "VPN CONNECTED"
	elif [ $1 = "disconnected" ]; then
		DISPLAY=:0 sudo -u mint notify-send.sh "VPN DISCONNECTED"
	fi
fi