#!/bin/bash
# Update fedora and flatpak packages
# Regenerate initramfs/initrd and grub config.
# Needed for some sort of bug when after installing new kernel, os doesn't boot

dnf update -y
flatpak update -y
dracut --regenerate-all -force
grub2-mkconfig -o /boot/grub2/grub.cfg
