#!/bin/bash
# SCRIPTID 31
# Monitor node for failures, restart if dead
# TYPE 0
# STARTUP 1
# EXCLUSIVE 0

while : ; do	
	if [ ! -d /mnt/user/upload/slideshow ]; then
		tar -xzvpf /opt/scenes/ss.tgz -C /mnt/user/upload
	fi
	sleep 60

done
