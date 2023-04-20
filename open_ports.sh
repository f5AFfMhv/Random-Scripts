#!/bin/bash
# Get all active connections to the internet

sudo netstat -apnt | grep ESTABLISHED | grep -v 127.0.0.1 | awk {'print $5'}