#!/bin/bash

#########################################################
#Redaguota: 2018-07-10									#
#Paskirtis: Nuzudo visus openvpn procesus				#
#########################################################

sudo kill $(ps -ef | grep [o]penvpn | awk -F ' ' '{print $2}')

