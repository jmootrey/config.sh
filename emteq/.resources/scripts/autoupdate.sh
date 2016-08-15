#!/bin/bash
# SCRIPTID 500
# SYSTEM AUTO UPDATER
# TYPE 0
# STARTUP 1
# EXCLUSIVE 0


cp /opt/scenes/update_LIST_factory.lst /mnt/user/upload/
cp /opt/scenes/update_LIST_factory.tgz /mnt/user/upload/
sleep 10
while : ;do
  /mnt/user/icdapp REFRESH_MEDIA_FILES 0
  sleep 3
  result=$(/mnt/user/icdapp UPDATE_SOFTWARE /mnt/user/upload/update_LIST_factory.lst)
  for i in $result; do
    if [[ $i = 'response=0)' ]]; then
      result=000
    fi
  done
  if [[ $result = 000 ]]; then
    break
  fi
  sleep 10
done
killall node
exit 0
