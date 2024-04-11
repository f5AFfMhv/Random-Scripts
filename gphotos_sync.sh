#!/bin/bash
# Sync google photos to local file system
# https://github.com/gilesknap/gphotos-sync

# Json file containing authentication information
# https://gilesknap.github.io/gphotos-sync/main/tutorials/oauth2.html#client-id
# GOOGLE_APPLICATION_CREDENTIALS=/path/to/google/cloud/credentials.json

# Healthchecks ping UUID
# https://healthchecks.io
# HC_GPHOTOS=random-uuid


# Local directory to store google photos
DESTINATION_DIR=/home/mj/google/photos/jankunasmartynas

# Sync google photos
/usr/local/bin/gphotos-sync $DESTINATION_DIR >> /var/log/gphotos-sync.log 2>&1

# Send ping with exit status to healthchecks service
curl --retry 3 https://hc-ping.com/$HC_GPHOTOS/$?
