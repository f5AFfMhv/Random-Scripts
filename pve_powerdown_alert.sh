#!/bin/bash
# Called by UPS pwrstatd service on powerdown event
# Sends alert to slack workspace chat


# Define variables
TOKEN="xoxb-xxx"
CHANNEL="#home-lab"
MESSAGE="Power lost. Shutting down SRV."

# Send the message
curl -X POST -H "Authorization: Bearer $TOKEN" \
-H "Content-type: application/json; charset=utf-8" \
--data "{
  \"channel\":\"$CHANNEL\",
  \"text\":\"$MESSAGE\"
}" \
https://slack.com/api/chat.postMessage