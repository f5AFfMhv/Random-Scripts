#!/bin/bash

# Shutdowns PVE server and PC afterwards

ssh root@pve.home.lab 'shutdown -h 0'
shutdown -h 0