#!/bin/bash

#Tikrina ir raso i loga GPU ir CPU temp ir GPU power


FAILAS=$(date +%Y%m%d%H%M)
while true
do
	echo -e "$(date +%H:%M:%S)\tCPU: $(sensors | grep Tctl | awk '{print $2}')\tGPU: $(nvidia-smi -q -d  Power | grep Draw | awk '{print $4}')W\t +$(nvidia-smi -q -d TEMPERATURE | grep "GPU Current Temp" | awk '{print $5}')°C" >> /var/log/gpumoni/gpumoni-$FAILAS.log
	sleep 1
done
