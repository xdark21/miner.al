#!/bin/bash
source "/root/mineros/lib/functions.sh"

# Get Stats
STATS=$(sudo /root/mineros/tool/stats.sh)

# Send Stats
sleep 1
curl -k -d api="$API" -d email="$EMAIL" -d stats="$STATS" $URL/stats
