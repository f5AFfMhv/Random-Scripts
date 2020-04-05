#!/bin/bash

echo "motion detected $(date); video file - $1" >> /var/lib/motion/motion.txt
ffmpeg -i $1 -acodec libfaac -b:a 128k -vcodec mpeg4 -b:v 1200k -flags +aic+mv4 /var/lib/motion/output.mp4
signal-cli --dbus-system send -m "motion detected $(date)" 37062960470 -a /var/lib/motion/output.mp4
rm -f $1
rm -f /var/lib/motion/output.mp4
