#!/bin/bash

# Kills all openvpn processes

sudo kill $(ps -ef | grep [o]penvpn | awk -F ' ' '{print $2}')
