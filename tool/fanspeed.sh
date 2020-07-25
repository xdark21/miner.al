#!/bin/bash

sudo pkill -f fan.py

sleep 0.5

source "/root/mineros/lib/functions.sh"
updateconfig

nohup /root/mineros/tool/fan.py -T $TEMP -m $FAN -u 2 > /dev/null 2>&1 &
