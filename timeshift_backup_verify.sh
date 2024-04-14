#!/bin/bash
# Checks if last days timeshift backup is present on disk.
# Sends ping to healthchecks service.

# Healthchecks ping UUID
# https://healthchecks.io
# HC_TIMESHIFT=random-uuid

# Timeshift backup location
TS_LOCATION=/mnt/Archive/timeshift/snapshots

# Backup date
backup_date=$(date -d "yesterday" "+%Y-%m-%d")

# Read backup info file
jq . -r ${TS_LOCATION}/${backup_date}_*/info.json

# Send ping with exit status to healthchecks service
curl --retry 3 https://hc-ping.com/$HC_TIMESHIFT/$?
