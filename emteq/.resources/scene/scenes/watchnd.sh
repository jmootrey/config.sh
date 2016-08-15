#!/bin/bash
# SCRIPTID 30
# Monitor node for failures, restart if dead
# TYPE 0
# STARTUP 1
# EXCLUSIVE 0

while : ; do
	sleep 1
	awake=$(pgrep node)
	if [[ $awake = '' ]] ; then
		echo 'node dead o.O' >> /mnt/user/tmp/c2.log
		/opt/c2/bin/emteq.sh &> /mnt/user/tmp/c2.log &
	fi
done
