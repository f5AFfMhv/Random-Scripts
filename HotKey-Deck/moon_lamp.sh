#!/bin/bash

# Moon lamp control
# https://www.instructables.com/id/IoT-Moon-Lamp/

LAMP_IP="192.168.1.189"

RESPONSE=$(curl -s http://$LAMP_IP/light/5 | grep "ON")

if [[ -z $RESPONSE ]]; then
	curl -s http://$LAMP_IP/light/2
	notify-send "Moon Lamp ON"
else
	curl -s http://$LAMP_IP/light/4
	notify-send "Moon Lamp OFF"
fi
