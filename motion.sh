#!/bin/bash
# Executed by the motion daemon. Saves video file with motion and sends video via signal

TEL_NR="XXXXXXXXXX"

echo "motion detected $(date); video file - $1" >> /var/lib/motion/motion.txt
ffmpeg -i $1 -acodec libfaac -b:a 128k -vcodec mpeg4 -b:v 1200k -flags +aic+mv4 /var/lib/motion/output.mp4
signal-cli --dbus-system send -m "motion detected $(date)" $TEL_NR -a /var/lib/motion/output.mp4
rm -f $1
rm -f /var/lib/motion/output.mp4
