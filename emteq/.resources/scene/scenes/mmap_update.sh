#!/bin/bash
# SCRIPTID 20
# Modify IPTAbles for SIP Phone Access
# TYPE 0
# STARTUP 1
# EXCLUSIVE 0
sleep 60
mapdb=$(mysql -uroot -proot -Deconnect -e"select value from web_configuration where configurationid=10")
map=$(echo ${mapdb:(-2)})
insert='INSERT INTO `econnect`.`web_configuration` (`ConfigurationID`, `key`, `value`) VALUES ("10", "map_installed", "none");'
#if no entry lets create one
if [ -z "$map" ]; then
  echo $insert | mysql -uroot -proot econnect
fi

#update function
function update_map {
  killall node
  sleep 3
  mysql -uroot -proot -Deconnect -e"UPDATE web_configuration SET value='$map' WHERE ConfigurationID=10;"
  #mysql -uroot -proot -Deconnect -e"UPDATE web_configuration SET value=$map WHERE ConfigurationID=10"
  #create database update
  mysqldump --user=root -proot --max_allowed_packet=1G --host=10.0.9.1 --port=3306 --default-character-set=utf8 --single-transaction=TRUE "econnect" > /mnt/user/upload/update_DB_webconfig.sql

  nohup /usr/local/bin/node /opt/scenes/mmapupdate/server.js >& /dev/null &
  /mnt/user/icdapp REFRESH_MEDIA_FILES 0
  /mnt/user/icdapp UPDATE_SOFTWARE /media/ttt/$files
  /mnt/user/icdapp UPDATE_SOFTWARE /mnt/user/upload/update_DB_webconfig.sql
}

#check database for current map, if different then update
#sleep 30

#remove previous webconfig tables
rm /mnt/user/upload/*webconfig

while : ; do
  for files in $(ls /media/ttt/ ); do 
  
if [ ${files:0:11} = "update_MMAP" ] ; then
      case ${files:12} in
asia.tgz) 
  if [ $map != "as" ] ; then
    map="as"
    update_map
  fi;;
europe.tgz)
  if [ $map != "eu" ] ; then
    map="eu"
    update_map
  fi;;
middleeast.tgz)
  if [ $map != "me" ] ; then
    map="me"
    update_map
  fi;;
northamerica.tgz)
  if [ $map != "na" ] ; then
    map="na"
    update_map
  fi;;
southamerica.tgz)
  if [ $map != "sa" ] ; then
    map="sa"
    update_map
  fi;;
world.tgz)
  if [ $map != "wo" ] ; then
    map="wo"
    update_map
  fi;;
      esac
    fi
  done    
sleep 30
done

