#!/bin/bash

# GPU Settings for Mining
export DISPLAY=:0
export GPU_MAX_ALLOC_PERCENT=100
export GPU_USE_SYNC_OBJECTS=1
export GPU_SINGLE_ALLOC_PERCENT=100
export GPU_MAX_HEAP_SIZE=100
export GPU_FORCE_64BIT_PTR=1


# Screen Cleaning
clear
killall xterm -9
killall screen -9
#screen -ls | grep -o '[0-9]*\.[a0-Z9]*' | while read -r v ; do  screen -X -S $v quit; done
clear

# Register Screen
screen -dm -S mineros bash -c "/root/mineros/boot/configure.sh" &
