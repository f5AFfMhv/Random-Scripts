#!/bin/bash

# Connect/disconnect to specific nordVPN server
export DISPLAY=:0.0 
export DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus
export XAUTHORITY=/home/mint/.Xauthority

CONFIG_FILE="/home/mint/Documents/VPN/servers/pl/pl143.nordvpn.com.udp1194.ovpn"
SCRIPT_PATH="/home/mint/skriptai/OpenVPN/call_notify_vpn.sh"
OPENVPN_PIDS=$(ps -ef | grep [o]penvpn | awk -F ' ' '{print $2}')

if ! [[ -z $OPENVPN_PIDS ]]; then
	sudo kill $OPENVPN_PIDS 
else
	sudo openvpn --script-security 2 --route-up "/bin/su - mint -c '$SCRIPT_PATH CONNECTED' " --down "/bin/su - mint -c '$SCRIPT_PATH DISCONNECTED'" --connect-retry-max 1 --config $CONFIG_FILE
fi
