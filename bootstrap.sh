#!/bin/bash
source "/root/mineros/lib/functions.sh"

boot

if [ "$DRIVER" == "AMD" ]; then

	su mineros -c 'bash /root/mineros/boot/prepare.sh' &

elif [ "$DRIVER" == "NVIDIA" ]; then

	sudo nvidia-xconfig -s -a --force-generate --allow-empty-initial-configuration --cool-bits=31 --registry-dwords="PerfLevelSrc=0x2222" --no-sli --connected-monitor="DFP-0"
	sudo sed -i '/Driver/a \ \ \ \ Option         "Interactive" "False"' /etc/X11/xorg.conf

	sleep 1

	su mineros -c 'bash /root/mineros/boot/prepare.sh' &

else

	su mineros -c 'bash /root/mineros/boot/prepare.sh' &

fi
