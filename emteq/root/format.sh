#!/bin/bash
#Scrip allows user to format USB key without elevated priv. 
#This is done with a helper script /root/scripts/call.sh
#arguments are as follows.
#./format.sh device_id
#this will break if the USB key has more than 1 partition

#get the block device of our ID
DIR="/home/emteq/.resources/"
BLKID=$(lsblk | grep -i $2)
BLKDVPART=$(echo ${BLKID:2:4})
BLKDVID=$(echo ${BLKID:2:3})

case $1 in
  1) #umount 
    umount /home/emteq/.resources/mount
    echo "done" >/dev/tcp/localhost/5350
    exit;;
  2) #format	
      umount -f /run/media/emteq/$2
      #create filesystem
      mkfs.ntfs --fast --label $3 /dev/$BLKDVPART
      #Mount to a know location, our ID has changed. Our block hasn't 
      mount /dev/$BLKDVPART /home/emteq/.resources/mount
      #let the client know we are done
      echo "done" >/dev/tcp/localhost/5350 
      exit;;
  3) #image
#      umount -f /dev/${BLKDV}*
      umount ${DIR}iso/econnect-firmware.img
#      dd if=${DIR}iso/econnect-firmware.img of=/dev/$BLKDV bs=4M && sync
      echo "done" > /dev/tcp/localhost/5350
      exit;;
   4) #preimage
      cp ${DIR}payload/*.lst ${DIR}iso/firmware/optfs/scenes/update_LIST_factory.lst
      cp ${DIR}payload/*.tgz ${DIR}iso/firmware/optfs/scenes/update_LIST_factory.tgz
      cp ${DIR}scripts/autoupdate.sh ${DIR}iso/firmware/optfs/scenes/
      echo "done" > /dev/tcp/localhost/5350
      exit;;
   5) #clean
      rm ${DIR}iso/firmware/optfs/scenes/update_LIST_factory.lst
      rm ${DIR}iso/firmware/optfs/scenes/update_LIST_factory.tgz
      rm ${DIR}iso/firmware/optfs/scenes/
      echo "done" > /dev/tcp/localhost/5350
      exit;;
        *) sleep .5
           exit;;

esac
 


