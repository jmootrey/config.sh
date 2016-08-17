#!/bin/bash
PORTNUMBER="5349"

while :
do
  BLK=$(nc -l 127.0.0.1 -p $PORTNUMBER)
  /root/scripts/format.sh $BLK
echo $BLK
#echo $BLK
done
