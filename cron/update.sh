#!/bin/bash

if sudo git --work-tree=/root/mineros --git-dir=/root/mineros/.git remote update; then

  Local=$(sudo git --work-tree=/root/mineros --git-dir=/root/mineros/.git rev-list --max-count=1 master)
  Origin=$(sudo git --work-tree=/root/mineros --git-dir=/root/mineros/.git rev-list --max-count=1 origin/master)

  if [ "$Local" != "$Origin" ]; then
      sudo git --work-tree=/root/mineros --git-dir=/root/mineros/.git checkout -- .
      sleep 0.5
      sudo git --work-tree=/root/mineros --git-dir=/root/mineros/.git pull origin master
      sync
      rsync -aqrz --no-perms --no-owner  /root/mineros/root/etc/crontab /etc/crontab
      rsync -aqrz --no-perms --no-owner  /root/mineros/root/etc/rc.local /etc/rc.local
      sync
      sudo chmod -R +x /root/mineros
  fi
fi
