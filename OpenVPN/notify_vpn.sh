#!/bin/bash

# Notifys successfull openvpn TUN/TAP open or close operation

export DISPLAY=:0.0 
export DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus
export XAUTHORITY=/home/$USER/.Xauthority

curl ipinfo.io > /tmp/publicIP.tmp
IP=$(grep '"ip"' /tmp/publicIP.tmp | awk '{print $2}' | tr -d '"',)
CITY=$(grep '"city"' /tmp/publicIP.tmp | awk '{print $2}' | tr -d '"',)
COUNTRY=$(grep '"country"' /tmp/publicIP.tmp | awk '{print $2}' | tr -d '"',)

if ! [[ -z $1 ]]; then
	notify-send.sh -i /home/mint/Pictures/icons/vpn.png -t 10000 "$1" "IP: $IP\nLOCATION: $COUNTRY, $CITY"
fi
