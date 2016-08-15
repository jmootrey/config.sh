#!/bin/sh

/opt/eConnect/scripts/misc/getplatform.sh
platform=$?
one="1"

if [ "$platform" = "1" ]; then
	mountpoint="/media/ttt"
	/opt/eConnect/scripts/usb/usb_clear.sh "$mountpoint"
	usbdev=`ls -1 /sys/block | grep sd | grep -v sda`
else
	mountpoint="$1"
	if [ ! -d "$mountpoint" ] || [ "${#mountpoint}" -lt "3" ]; then 
		mountpoint="/media/ttt"
	fi
	/opt/eConnect/scripts/usb/usb_clear.sh "$mountpoint"
	usbdev=`ls -l /sys/block | grep usb1 | cut -d " " -f 8`
fi
usbdev0="/dev/$usbdev"
usbdev1="/dev/$usbdev$one"
device=`ls $usbdev1 | awk '{if ( NF == 1 ) { printf "%s", $1 } else { printf "" } }'`
if [ -n "$device" ]; then
	mount -t auto $device $mountpoint
	mounts=`cat /proc/mounts | egrep -o $mountpoint` 
	if [ -n "$mounts" ]; then
		exit 1
	else
		exit 0
	fi
fi
device=`ls $usbdev0 | awk '{if ( NF == 1 ) { printf "%s", $1 } else { printf "" } }'`
if [ -n "$device" ]; then
	mount -t auto $device $mountpoint
	mounts=`cat /proc/mounts | egrep -o $mountpoint` 
	if [ -n "$mounts" ]; then
		exit 1
	else
		exit 0
	fi
fi
exit 0
