#!/bin/bash

# gauti Kernel versija

KERNEL=$(uname -s)
VERSION=$(uname -r)
UPTIME=$(uptime -p)
SYSTEM=$(cat /etc/lsb-release | grep DISTRIB_DESCRIPTION | cut -f2 -d'=')
#TOP=$(ps aux | sort -nrk 3,3 | head -n 5)

echo "System: $SYSTEM"
echo " "
echo "Kernel: $KERNEL $VERSION"
echo "Uptime $UPTIME"
#echo "Top processes:"

#echo "$TOP"