#!/bin/bash

# Connect/disconnect to specific nordVPN server
CONFIG_FILE="/mnt/DATA/VPN/servers/Latvia/lv26.nordvpn.com.udp1194.ovpn"
SCRIPT_PATH="/home/mint/skriptai/OpenVPN/notify_vpn.sh"
OPENVPN_PIDS=$(ps -ef | grep [o]penvpn | awk -F ' ' '{print $2}')

if ! [[ -z $OPENVPN_PIDS ]]; then
	sudo kill $OPENVPN_PIDS 
else
	sudo openvpn --script-security 2 --up "$SCRIPT_PATH connected" --down "$SCRIPT_PATH disconnected" --connect-retry-max 1 --config $CONFIG_FILE
fi
