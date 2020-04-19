#!/bin/bash

# Displays notification with cpu, gpu load information


CPU_TEMP=$(sensors | grep Tctl | awk '{print $2}')
CPU_UTIL=$(mpstat 2 1 | grep Average | awk '$12 ~ /[0-9.]+/ { print 100 - $12"%" }')
GPU_TEMP=$(nvidia-smi -q -d TEMPERATURE | grep "GPU Current Temp" | awk '{print $5}')
GPU_UTIL=$(nvidia-smi -q -d UTILIZATION | grep Gpu | awk '{print $3 $4}')
notify-send "PC Load Info" -u normal -t 10000 -i /home/mint/Pictures/icons/fire.png "CPU:\t$CPU_UTIL\t\t$CPU_TEMP\nGPU:\t$GPU_UTIL\t\t+$GPU_TEMP°C"

