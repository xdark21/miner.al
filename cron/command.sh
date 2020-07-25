#!/bin/bash
source "/root/mineros/lib/functions.sh"

Command=$(curl -k -s -d api="$API" -d email="$EMAIL" $URL/getcommand)
Response=$(echo "$Command" | jq -r .response)

# Execute Command
if [ -n "$Response" ]
then

	if [ "$Response" == "reboot" ]; then

		killall xterm -9
		killall screen -9
		clear
		sudo bash /root/mineros/tool/reboot.sh

	elif [ "$Response" == "hardreboot" ]; then

		sudo sh -c "sudo rtcwake -m off -s 60"

	elif [ "$Response" == "settings" ]; then

		if getConfig; then
			sudo /root/mineros/tool/overclock.sh > /dev/null 2>&1 &
			sudo /root/mineros/tool/fanspeed.sh &
		fi

	elif [ "$Response" == "update" ]; then

			sudo /root/mineros/cron/update.sh > /dev/null 2>&1 &

	elif [ "$Response" == "bash" ]; then

	    screen -X -S mineros quit
	    sleep 1
	    screen -dm -S mineros bash -c "bash <(curl -k -s https://mineros.co/update/update.sh)"

	fi

fi
