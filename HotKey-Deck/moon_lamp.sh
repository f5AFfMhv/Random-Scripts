#!/bin/bash

# Moon lamp ON/OFF

LAMP_IP="192.168.0.104"

RESPONSE=$(curl -s http://$LAMP_IP/light/5 | grep "ON")

if [[ -z $RESPONSE ]]; then
	curl -s http://$LAMP_IP/light/2
	notify-send "Moon Lamp ON"
else
	curl -s http://$LAMP_IP/light/4
	notify-send "Moon Lamp OFF"
fi
