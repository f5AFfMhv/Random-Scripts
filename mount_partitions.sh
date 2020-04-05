#!/bin/bash

######################################################
# Redaguota:	2018-02-25			     			 #
# Paskirtis:	Istaiso particiju mount klaidas ir   #
#				uzmountina particijas		   		 #
# Saltinis:	goo.gl/u6p			     				 #
######################################################


ldmtool create all # randa windows raid0 diskus
mount -t ntfs-3g -o remove_hiberfile /dev/sdb1 /media/mint/DATA
mount -t ntfs-3g -o remove_hiberfile /dev/nvme0n1p2 /media/mint/windows
mount -t ntfs-3g -o remove_hiberfile /dev/mapper/ldm_vol_DESKTOP-0A332TG-Dg0_Volume1 /media/mint/SSD_raid0

