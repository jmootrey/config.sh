#!/bin/bash
boot_mode=$(cat /root/boot_mode)
if [ $boot_mode = 5 ]; then
  nic=br0
else
  nic=br0:0
fi

if [ -f /opt/tilestream/index.js ]; then
	ip_addr=`/sbin/ifconfig $nic | grep "inet addr" | awk -F: '{print $2}' | awk '{print $1}'`
	if [ -d /mnt/mmap ]; then
	   tiledir="/mnt/mmap"
	else
	   tiledir="/opt/tilestream"
	fi
	/opt/tilestream/index.js --host $ip_addr --uiPort=32500 --tilePort=32500 --tiles=$tiledir  &> /mnt/user/tmp/tilestream.log &
fi
