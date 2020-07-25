#!/bin/sh

while true; do
  sleep 4
  sudo /root/mineros/cron/status.sh
  sleep 4
  sudo /root/mineros/cron/command.sh
done
