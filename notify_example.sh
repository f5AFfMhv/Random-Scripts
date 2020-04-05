#!/bin/bash

# Notifikacijos pavyzdys

DISPLAY=:0.0 /usr/bin/notify-send "Testukas" -u normal -t 5000 -i /home/mint/Pictures/vpn.png
echo "connected" > /tmp/status.tmp

