#!/bin/bash

# Suranda ir nuzudo veikiancius keepassx procesus ir paleidzia nauja instance
# skirtas darbui per shortcut

#sudo kill -9 $(ps -ef | grep -w [k]eepassx | awk -F ' ' '{print $2}')
/usr/bin/flatpak run --branch=stable --arch=x86_64 --command=keepassxc --file-forwarding org.keepassxc.KeePassXC &
