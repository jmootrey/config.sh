#!/bin/bash
BLKID=$(lsblk | grep -i $1)
BLKDV=$(echo ${BLKID:2:3})
echo $BLKDV
umount /dev/${BLKDV}*
pv /home/emteq/.resources/iso/econnect-firmware.img > /dev/$BLKDV
