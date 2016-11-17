#!/bin/bash
ip link set wlo1 up
if iw dev wlo1 scan | grep -q $1; then
	echo "1"
fi
ip link set wlo1 down
