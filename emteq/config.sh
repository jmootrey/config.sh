#!/bin/bash
#eConnect Configuration Tool
#This script is intended to configure eConnect systems CWR450/451
#and is written specifically for the PC12/PC24 platform. 

#Dependencies
#sshpass  
#openssh
#mysql client
#GNU Coreutils

#Changelog
#2.1.0 
#Incorporate CWR451 
#selection 
#2.0.2 
#Updated some user selection entries to match order form.
#2.0.1
#Check for autoupdate.sh before allowing run mode change
#2.0.0
#Phase 3 software release to PC12
#1.5.7
#Updated to prepare for phase 3.
#1.4.7
#Added new routing for map copy
#Changelog
#1.4.5 
#  Added function to update encoder boards to 1.35.2
#  Added routine to determine default scale, metric || imperial
#1.4.4
#  Code cleanup

#Reference Color Codes
#Black        0;30     Dark Gray     1;30
#Blue         0;34     Light Blue    1;34
#Green        0;32     Light Green   1;32
#Cyan         0;36     Light Cyan    1;36
#Red          0;31     Light Red     1;31
#Purple       0;35     Light Purple  1;35
#Brown/Orange 0;33     Yellow        1;33
#Light Gray   0;37     White         1;37

#Color Blocks
red='\e[0;91m'
blue='\e[0;94m'
green='\e[0;92m'
purple='\e[0;95m'
nocolor='\e[0m'
bold='\033[1m'
normal='\e[39m'
white='\e[97m'
black='\e[30m'

#translations for root script functions
unmount=1
format=2
image=3
preimage=4
clean=5

#import settings
source ./.config.cfg

#update settings
function cfg_update () {
sed -i "s/\($1 *= *\).*/\1\'$2/\'" ./config.cfg
}

#system variables
#c2=$( cat /home/emteq/.c2 ) 
#econip=$( cat /home/emteq/.econip )
#econapp=$( cat /home/emteq/.econapp )
#iso=$( cat /home/emteq/.iso )
#encoder=$( cat /home/emteq/.encoder )
res=0
ver="2.1.0"
dir="/home/emteq/.resources/"
dbdir=${dir}db/
dbstatic=${dir}/dbstatic/
confdir=${dir}/config/
resfile="c2/src/presentation/resources/resource.json"
#for i in 1 2 ; do
#  dbfiles[$i]=$( head -n $i /home/emteq/.dbfiles | tail -1 )
#done
#cnt=1


#Header - Create stylized screen header
function header {
  clear
  echo -e "${green}--------------------------------------"
  echo -e "| ${green}eConnect${white} Configuration System ${red}$ver${green} | "
  echo -e "--------------------------------------${white}"
  echo " "
}

#getconfigfile - Count configuration files that require transfer
#this function may be depricatedi XXXXXXXXXXXXXXXX
function getconfigfile {
cnt=1
config_file_cnt=$( find ${dir}config/ -maxdepth 1 -type f | wc -l )
for files in ${dir}config/* ; do
  if [ -f $files ] ; then
    config_files[$cnt]=$files
    cnt=$(( cnt + 1))
  fi
done
}

#trap ctrl-c - prevents user exit of application. Allow line switch -d 
if [ "$1" != "-d" ] ; then
  trap '' 2
fi

#usbkeyselect - List mounted Flash Drives
function usbkeysel() {
cnt=0
for i in /run/media/emteq/* ; do
  if [ -d "$i" ]; then
    cnt=$((cnt + 1))
    usbkey[$cnt]=$(basename "$i")
  fi
done
header
echo "Please select USB device"
echo " "
cnt=1
for i  in ${usbkey[@]} ; do
  echo $cnt"." ${usbkey[$cnt]}  
  cnt=$((cnt + 1))
done
echo " "
echo -n "Enter Selection or (x) to restart: "
while : ; do
  read usbselect
  case $usbselect in 
    [1-9]|[1-9][1-9]) if [ $usbselect -lt $cnt ] ; then
       break  
       else
       echo "Entry not Valid"
       echo -n "Please select USB device: "
       fi;;
    x) break;;
    *) echo "Entry not Valid"
       echo -n "Please select USB device: ";;
  esac
done
}

#makekey - Loads selected Map to Flash Drive. 
function makekey {
 header
  case "$map" in
    [1-5]) dsize='8GB';;
    *) dsize='32GB';; 
  esac
  echo " "
  echo "Insert USB flash disk. USB flash disk must be at least " $dsize
  echo "Warning, This USB flash disk will be formatted!"
  echo "All Data will be lost!"
  echo " "
  echo -n "Press any key to continue"
  read junk
  usbkeysel
  if [ $usbselect = "x" ] ; then 
   return
  fi
  echo " "
  echo "Now Formatting, " ${usbkey[$usbselect]} " please wait..."
  case "$map" in
    1) echo $format ${usbkey[$usbselect]} "northamerica" >/dev/tcp/localhost/5349;; 
    2) echo $format ${usbkey[$usbselect]} "europe" >/dev/tcp/localhost/5349;; 
    3) echo $format ${usbkey[$usbselect]} "africa" >/dev/tcp/localhost/5349;; 
    4) echo $format ${usbkey[$usbselect]} "southamerica" >/dev/tcp/localhost/5349;; 
    5) echo $format ${usbkey[$usbselect]} "asia" >/dev/tcp/localhost/5349;; 
    6) echo $format ${usbkey[$usbselect]} "world" >/dev/tcp/localhost/5349;;
    x) return;;
  esac
  junk=$(nc -l 127.0.0.1 -p 5350)
  echo "Formatting Complete"
  echo " "
  echo "Beginning File Transfer..."
  case "$map" in
    1) rsync -h --progress ${dir}map/update_MMAP_northamerica.tgz ${dir}mount/update_MMAP_northamerica.tgz;;
    2) rsync -h --progress ${dir}map/update_MMAP_europe.tgz ${dir}mount/update_MMAP_europe.tgz;;
    3) rsync -h --progress ${dir}map/update_MMAP_middleeast.tgz ${dir}mount/update_MMAP_middleeast.tgz;;
    4) rsync -h --progress ${dir}map/update_MMAP_southamerica.tgz ${dir}mount/update_MMAP_southamerica.tgz;;
    5) rsync -h --progress ${dir}map/update_MMAP_asia.tgz ${dir}mount/update_MMAP_asia.tgz;;
    6) rsync -h --progress ${dir}map/update_MMAP_world.tgz ${dir}mount/update_MMAP_world.tgz;;
  esac
  echo " "
  echo "Finalizing.... Please do not remove USB flash disk."
  echo $unmount >/dev/tcp/localhost/5349
  junk=$(nc -l 127.0.0.1 -p 5350)          
  echo "USB flash disk may now be removed"
  echo -n "Press any key to continue."
  read junk
}

#sendconfig - Use MUTT to email configuration files to EMTEQ
#XXXXXXXXXXXXXXXXXXXXXXXXXXXXX deprecated Replace w/ new option
function sendconfig {
  cnt=1
  header
  echo "Checking connection to EMTEQ servers..."
  while : ; do
    up=$(curl -Isf www.google.com | grep HTTP/1.1 | awk {'print $2'}) #Dirty check to see if we have external network access
    if [ "$up" = "200" ] ; then
      break
    else 
      cnt=$(( cnt + 1 ))
      sleep 5
    fi
    if [ $cnt -gt 12 ] ; then
      echo "Server not found, please check your internet connection."
      echo "Network reports $up"
      echo -n "Press (enter) to exit: "
      read junk
      break
    fi
  done
  if [ $cnt -lt 13 ] ; then
    cnt=1
    echo "Transmitting..."
    for i in ${config_files[@]} ; do
    subj="${i##*/}" 
     echo "Lot: "$subj | mutt -s $subj emteqeconnect@gmail.com -a $i
     if [ $? -eq 0 ] ; then #checks return code from mutt. 0 indicated success
       mv $i ${dir}config/archive/
     fi
    done
    echo "Transmission Complete."
    sleep 5
    config_file_cnt=$( find ${dir}config/ -maxdepth 1 -type f | wc -l )
  fi
}

#sshpass alias, saves a little typing. Passes command to host while hiding output from user
function sshb() { 
#echo -e " ${black} " #Hide ssh ouput from user. 
sshpass -f /home/emteq/.id ssh emteq@$econip bash -c "$1" &>/dev/null 
#echo -e " ${white} " #return console text to white
}

#sshpass alias. Pases command to host, makes output available to user
function sshbr() { 
sshpass -f /home/emteq/.id ssh emteq@$econip bash -c "$1" 
}

#sshpass alias. Invokes scp
function sshc() { sshpass -f /home/emteq/.id scp "$1" ; }

#Function to check econn state
function isup() {
  up=no
  while [[ $up != "22/tcp open  ssh" ]]; do
    up=$(nmap $econip -PN -p ssh 2>/dev/null | grep open)
  sleep 5
  done
#  up=""
#  while [[ $up = "" ]]; do
#    up=$(sshbr "'echo "Q3tm36170" | sudo -S cat /root/boot_mode'")
#  sleep 5 
#  done
#  echo $up
#  echo -e " ${white} "
}

#Modify software parameters
function syscon {
header
echo "Current Settings:"
echo -e "1. eConnect IP: "${blue}$econip${white}
echo -e "2. CWR450 GUI File: "${blue}$c2_450${white} 
echo -e "3. CWR451 GUI File: "${blue}$c2_451${white}
echo -e "4. CWR450 Image File: "${blue}$iso_450${white}
echo -e "5. CWR451 Image File: "${blue}$iso_451${white}
echo -e "6. CWR450-2000-XX DB: "${blue}$db_450_2000${white}
echo -e "7. CWR450-5000-XX DB: "${blue}$db_450_5000${white}
echo -e "8. CWR451-2000-XX DB: "${blue}$db_450_2000${white}
echo -e "9. CWR451-5000-XX DB: "${blue}$db_450_5000${white}
echo -e "10. CWR450 Script: "${blue}$scene_450${white}
echo -e "11. CWR451 Script: "${blue}$scene_451${white}
echo -e "12. encoder board software: "${blue}$encoder${white}
echo -e "13. Update System with EMTEQ package: "
echo ' '
while : ; do
  echo -n "Please enter item to modify or (x) to exit: "
  read junk
  case $junk in
    1) echo " "
      echo -n "Enter new IP address: "
      read econip
      cfg_update econip $econip
      break;;
    [2-3]) echo " "
      cnt=1
      for file in $( ls $dir"GUI/" ) ; do
        echo $cnt "." $file
        files[$cnt]=$file
        cnt=$((cnt + 1))      
      done
        echo " "
        echo -n "Select GUI file: "
        read gfile
        c2=${files[$gfile]}
        if [[  $junk = 2 ]]; then
          cfg_update c2_450 $c2
        else
          cfg_update c2_451 $c2
        fi
        break;;
    [4-5]) echo " "
      cnt=1
      for file in $( ls ${dir}iso/ ) ; do
        if [[ $file != 'econnect-firmware.img' ]] && [[ $file != 'firmware' ]]; then
          echo $cnt "." $file
          files[$cnt]=$file
          cnt=$((cnt + 1))
         fi      
      done
      echo " "
      echo -n "Select Image file: "
      read ifile
      iso=${files[$ifile]}
      fstab=${iso:14:1}
      ##########AN FTAB NEEDS TO BE CREATED FOR 451##############
      if [[ $fstab = 'F' ]]; then
        sudo /root/scripts/ftab F
          else
        sudo /root/scripts/ftab
      fi
      if [[ $junk = 4 ]]; then
        echo cfg_update $iso_450
      else
        echo cfg_update $iso_451
      fi
      echo "Updating image file..."
      rsync --progress ${dir}iso/${iso} ${dir}iso/econnect-firmware.img
      break;;
    #############################################################
    [6-9]) echo "Warning - Selecting the wrong file will cause configurations to fail!"
      echo " "
      cnt=1
      for file in $( ls $dbdir ) ; do
        echo $cnt "." $file
        files[$cnt]=$file
        cnt=$((cnt + 1))
      done
      echo " "
      case $junk in
        6)echo -n "Select DB for CWR450-2000: "
          dbfile=${files[$sel]};;
        7)echo -n "Select DB for CWR450-5000: "
          dbfile=${files[$sel]};;
        8)echo -n "Select DB for CWR451-2000: "
          dbfile=${files[$sel]};;
        9)echo -n "Select DB for CWR451-5000: "
          dbfile=${files[$sel]};;
      esac
      read sel
      dbfiles=${files[$sel]}
      case $junk in
        6) cfg_update db_450_2000 ${files[$sel]};;
        7) cfg_update db_450_5000 ${files[$sel]};;
        8) cfg_update db_451_2000 ${files[$sel]};;
        9) cfg_update db_451_5000 ${files[$sel]};;
      esac
      break;;
    10) echo ""
      cnt=1
      for file in $( ls ${dir}encoder/ ) ; do
        echo $cnt". "$file
	      files[$cnt]=$file
	      cnt=$((cnt + 1))
      done
      echo " "
      echo -n "Select file: "
      read ifile
      encoder=${files[$ifile]}
      echo encoder $encoder
      break;;   
    11) header
      echo "Please insert USB key with update file(s)"
      echo -n "Press any key to continue"
      read junk
      header
      usbkeysel
      if [ $usbselect = "x" ] ; then
        break
      fi
      echo " "
      count=1
      for i in $( ls /run/media/emteq/${usbkey[$usbselect]}/*.tgz ) ; do
        echo $count"." ${i##*/}
        updatefiles[$count]=$i      
        count=$(($count+1))    
      done
      echo -n "Select update package: "
      while : ; do
        read updatefile
        case $updatefile in    
          [0-9]|[0-9][0-9])
            if [ $updatefile -lt $count ] ; then
              rm -rf /home/emteq/.resources/db/*
              rm -rf /home/emteq/.resources/GUI/*
              tar -C /home/ -xpzf ${updatefiles[$updatefile]}
              break
            else
              echo "Entry Not Valid"
              echo -n "Select update package: "
            fi;;
          *) echo "Entry Not Valid"
            echo -n "Select update package: ";;
        esac
      done
     echo ""
     echo "Update Complete... System will now restart."
     sleep 5
     reboot
     break;;
    x) break;;   
    *) echo -n "Please enter a valid selection: ";;
  esac
done         
}


function sql () {
  echo $1 | mysql -uroot -proot
}

#Commit User selected FMS/Lightig parameters to local DB
#Dumps local DB to file for import to remote system
function db_config () {
count=301
cnt=1
#Host working database
sql "DROP DATABASE IF EXISTS econnect;"
sql "CREATE DATABASE econnect;"
case $type in
  [1,3])  mysql -uroot -proot -Deconnect < $dbdir$db_450_2000;;
  [2,4])  mysql -uroot -proot -Deconnect < $dbdir$db_450_5000;;
  [5,7])  mysql -uroot -proot -Deconnect < $dbdir$db_451_2000;;
  [6,8])  mysql -uroot -proot -Deconnect < $dbdir$db_451_5000;;
esac
#Generate Update Script
echo "-- FMS Data" > $dbstatic"update.sql"
for i in {1..9}; do
  case ${field1[$i]} in
    1) echo "UPDATE econnect.web_userwidgets SET visible=1, ordinal=$i WHERE UserWidgetID=301;" >> $dbstatic"update.sql";;
    2) echo "UPDATE econnect.web_userwidgets SET visible=1, ordinal=$i WHERE UserWidgetID=302;" >> $dbstatic"update.sql";;
    3) echo "UPDATE econnect.web_userwidgets SET visible=1, ordinal=$i WHERE UserWidgetID=303;" >> $dbstatic"update.sql";;
    4) echo "UPDATE econnect.web_userwidgets SET visible=1, ordinal=$i WHERE UserWidgetID=305;" >> $dbstatic"update.sql";;
    5) echo "UPDATE econnect.web_userwidgets SET visible=1, ordinal=$i WHERE UserWidgetID=306;" >> $dbstatic"update.sql";;
    6) echo "UPDATE econnect.web_userwidgets SET visible=1, ordinal=$i WHERE UserWidgetID=307;" >> $dbstatic"update.sql";;
    7) echo "UPDATE econnect.web_userwidgets SET visible=1, ordinal=$i WHERE UserWidgetID=308;" >> $dbstatic"update.sql";;
    8) echo "UPDATE econnect.web_userwidgets SET visible=1, ordinal=$i WHERE UserWidgetID=309;" >> $dbstatic"update.sql";;
    9) echo "UPDATE econnect.web_userwidgets SET visible=1, ordinal=$i WHERE UserWidgetID=310;" >> $dbstatic"update.sql";;
    10) echo "UPDATE econnect.web_userwidgets SET visible=1, ordinal=$i WHERE UserWidgetID=311;" >> $dbstatic"update.sql";;
    11) echo "UPDATE econnect.web_userwidgets SET visible=1, ordinal=$i WHERE UserWidgetID=312;" >> $dbstatic"update.sql";;
    12) echo "UPDATE econnect.web_userwidgets SET visible=1, ordinal=$i WHERE UserWidgetID=313;" >> $dbstatic"update.sql";;
    13) echo "UPDATE econnect.web_userwidgets SET visible=1, ordinal=$i WHERE UserWidgetID=315;" >> $dbstatic"update.sql";;
    14) echo "UPDATE econnect.web_userwidgets SET visible=1, ordinal=$i WHERE UserWidgetID=316;" >> $dbstatic"update.sql";;
  esac
done
if [ $sip = 'y' ] ; then
  echo "DELETE FROM econnect.econnect_config WHERE ecms_id=2;" >> $dbstatic"update.sql"
  echo "UPDATE econnect.econnect_config SET econnect_ip='10.0.9.1' WHERE ecms_id=1;" >> $dbstatic"update.sql"
fi
#Process lighting for PC24
if [[ $platform = 2 ]]; then
  for bool in 1:$op1_bool 2:$op2_bool 3:$op3_bool 4:$op4_bool; do
    case $bool in
      1:0) echo 'UPDATE econnect.web_userwidgets SET visible=0 WHERE UserWidgetID=403;' >> $dbstatic"update.sql";;
      2:0) echo 'UPDATE econnect.web_userwidgets SET visible=0 WHERE UserWidgetID=415;' >> $dbstatic"update.sql";;
      3:0) echo 'UPDATE econnect.web_userwidgets SET visible=0 WHERE UserWidgetID=409;' >> $dbstatic"update.sql";;
      4:0) echo 'UPDATE econnect.web_userwidgets SET visible=0 WHERE UserWidgetID=410;' >> $dbstatic"update.sql";;
    esac
  done
  if [[ $op3_bool = 0 && op4_bool = 0 ]]; then 
    #Remove phantom nano driver
    echo 'DELETE FROM econnect.lighting_io_installed WHERE lru_id=3;'
  fi
fi
#Commit script to local DB
mysql -uroot -proot -Deconnect < $dbstatic"update.sql"
rm $dbstatic"update.sql"
#dump database 
mysqldump -uroot -proot econnect > ${dbstatic}update_DB_factory.sql
#add database selection to SQL file.
sed -i '1 i\USE econnect;' ${dbstatic}update_DB_factory.sql
sed -i '1 i\CREATE DATABASE IF NOT EXISTS econnect;' ${dbstatic}update_DB_factory.sql

#append to conf file
echo " " >> $confdir$lot
echo "------DATABASE------" >> $confdir$lot
cat $dbstatic'update_DB_factory.sql' >> $confdir$lot
#Pull the rug our from local DB
sql "DROP DATABASE IF EXISTS econnect;"
}


function config {
#Collects config params
#The user will break to here should they want to restart
while [ $res -eq 1 ] || [ $res -eq 2 ];  do
#Clean up, these all require a reset if the user restarts the script. 
  unset type
  unset sip
  unset tail
  unset map
  unset languages
  field=(0, 0, 0)
  field1=(0, 0, 0)
  field2=(0, 0, 0)
  field3=(0, 0, 0)
  unset lot=" "
  maptrans=3
  junk=""
  loop=0
  mode=0    
  usbselect=0
  lang1=""
  lang2=""
  lang3=""
  lang=""
  break_loop=0
  platform=0
  
#System Configure
  header
  echo  "Select Your eConnect Configuration"
  echo " "
  echo  "1. CWR450-2000-01 Base eConnect System Low Capacity Drive "
  echo  "2. CWR450-5000-01 XM eConnect System Low Capacity Drive" 
  echo  "3. CWR450-2000-02 Base eConnect System High Capacity Drive"
  echo  "4. CWR450-5000-02 XM eConnect System High Capacity Drive" 
  echo  "5. CWR451-2000-01 2nd Gen System Low Capacity Drive "
  echo  "6. CWR451-5000-01 2nd Gen XM System Low Capacity Drive" 
  echo  "7. CWR451-2000-02 2nd Gen System High Capacity Drive"
  echo  "8. CWR451-5000-02 2nd Gen XM System High Capacity Drive" 
  echo " "

  while : ; do
    echo -n "Enter Selection: " 
    read type
    case $type in 
      [1-8]) 
        echo "Select Platform"
        echo '1. PC12'
        echo '2. PC24'
        echo ''
        while : ; do
          echo -n 'Enter Selection: '
          read platform
          case $platform in
            [1-2]) header
            break;;
            *) echo 'Invalid Selection';;
          esac
        done
        echo -n "Enter Lot Number: "
        while : ;do
          read lot
	        if [[ $lot = "" ]] ; then
	          echo -n "Invalid Selection, Enter Lot Number:"
	        else
            break
	        fi
        done
      echo -n "Enter Aircraft Tail ID: "
      read tail
      echo -n "Will AVOIP be enabled, (y)es (n)o: " #***Need to determine how to set RUNMODE 5***
      read sip
      while : ; do
        case $sip in
          y) break;;
          n) break;;
          *) echo -n "Invalid Entry: "
             read sip;;
        esac
      done
      break;;
      *) echo "Not a valid selection: $type";;
    esac
  done
  #Begin Lighting Configuration, Skip if PC12 
  if [[ $platform = 2 ]]; then
    op1_color='\e[97m'
    op2_color='\e[97m'
    op3_color='\e[97m'
    op4_color='\e[97m'
    op1_installed='Disabled'
    op2_installed='Disabled'
    op3_installed='Disabled'
    op4_installed='Disabled'
    op1_bool=0
    op2_bool=0
    op3_bool=0
    op4_bool=0
    while : ;do
      header
      echo "Select Lighting Configuration"
      echo -e 'Standard Lighting Package:\t\t'${blue}'Enabled'${white}
      echo''
      echo -e '1. Cabin Downwash:\t\t\t'${op1_color}$op1_installed${white}
      echo -e '2. Cabin Spotlights:\t\t\t'${op2_color}$op2_installed${white}
      echo -e '3. Window Accent Lights:\t\t'${op3_color}$op3_installed${white}
      echo -e '4. Table Downwash Lights:\t\t'${op4_color}$op4_installed${white}
      echo ' '
      echo -ne 'Enter Package Number to Enable or (c) to Confirm: '
      read junk
      case $junk in
        1) 
          if [[ $op1_bool = 0 ]]; then
            op1_installed='Enabled'
            op1_color='\e[0;94m'
            op1_bool=1
          else
            op1_installed='Disabled'
            op1_color='\e[97m'
            op1_bool=0
          fi
        ;;
        2)
        if [[ $op2_bool = 0 ]]; then
            op2_installed='Enabled'
            op2_color='\e[0;94m'
            op2_bool=1
          else
            op2_installed='Disabled'
            op2_color='\e[97m'
            op2_bool=0
          fi
        ;;
        3)
        if [[ $op3_bool = 0 ]]; then
            op3_installed='Enabled'
            op3_color='\e[0;94m'
            op3_bool=1
          else
            op3_installed='Disabled'
            op3_color='\e[97m'
            op3_bool=0
          fi
        ;;
        4)
        if [[ $op4_bool = 0 ]]; then
            op4_installed='Enabled'
            op4_color='\e[0;94m'
            op4_bool=1
          else
            op4_installed='Disabled'
            op4_color='\e[97m'
            op4_bool=0
          fi
        ;;
        c) break
        ;;
        *) 
          echo -ne '\n'${red}'Invalid Selection '${white}'Any Key To Continue'
          read junk
        ;;
      esac
    done
  fi
  #Begin Map Selection, Skip if generating firmware flash disk
  if [[ $res = 1 ]]; then  
    header
    echo "Select map"
    echo " "
    echo "1. North America"
    echo "2. Europe"
    echo "3. Africa/Middle East"
    echo "4. South America"
    echo "5. Australia / Asia"
  #if high capacity drive, offer world map.
    case $type in  
      [3,4,7,8]) echo "6. World Map";;
    esac
    echo " "
    while : ; do
      echo -n "Enter Selection or (x) to Restart: " 
      read map
      case $map in 
        [1-6]) 
          case $type in
            [1,2,5,6]) 
              if [ "$map" = 6 ] ; then
                echo "Not a valid selection: $map"
              else
                break
              fi
            ;;
            *) break
            ;;
          esac
          ;;
        x) break;;
        *) echo "Not a valid selection: $map";;
      esac
    done
    if [ $map == "x" ]; then
      break_loop=1
      break
    fi
    header
    echo " "
    echo "The map may be copied directly using TCP/IP"
    echo "or a USB flash disk may be generated for later installation."
    echo "If a USB flash disk has been previously generated and will be used"
    echo "to install the map, this step may be skipped."
    echo ""
    echo "1. Install Map directly over tcp/ip."
    echo "2. Create USB flash disk for later installation."
    echo "3. Installation not required."
    echo ""
    while : ; do
      echo -n "Enter Selection: "
      read makekey
      case $makekey in
        1) maptrans=1
           break;;
        2) makekey
           maptrans=0
           break;;
        3) maptrans=0
           break;;
        *) echo -n "Invalid Selection: "
           read makekey;;
      esac    
    done
  fi
      
#Begin Language Selection
#Note - This section got a little fubar while trying to add support for
#PC24 langugage systems. 'platform' dictates language system to use.
  header
  if [ $break_loop = "x" ] ; then 
    break
  fi
  if [[ $platform = 1 ]] ; then
    echo "Select Language and Flag. Up to 3 selections allowed."
    echo " "
    echo "Selection	Language		Map"
    echo " "
    echo "1.		English			USA"
    echo "2.		English			UK"
    echo "3.		English			Canada"
    echo "4.		Spanish			Spain"
    echo "5.		Spanish			Mexico"
    echo "6.		Portuguese		Portugal"
    echo "7.		Portuguese		Brazil"
    echo "8.		Russian			Russia"
    echo "9.		German			Germany"
    echo "10.		German			Switzerland"
    echo "11.		French			France"
    echo "12.		Chinese (Standard)	China"
    echo "13.		Ukrainian	Ukraine"
    echo " "
    lang_end=4
  else
    echo "Select Language and Flag. Up to 3 selections allowed."
    echo " "
    echo "Selection	Language		Map"
    echo " "
    echo "1.		English"
    echo "2.		Spanish"
    echo "3.		Portuguese"
    echo "4.		Russian"
    echo "5.		German"
    echo "6.		French"
    echo "7.		Chinese (Standard)"
    echo "8.		Ukrainian"
    echo " "
    lang_end=9
  fi
  i=1
  until [ $i = $lang_end ]; do
    echo -n "Enter Selection" $i "(c) To Complete Selection(s) Or (x) to Restart: " 
    read languages[$i] 
    if [[ $platform = 1 ]]; then
      case ${languages[$i]} in
        [1-9]|[1][0-6]) 
          if [[ $( echo ${languages[@]} | tr ' ' '\n' | uniq | wc -l) != ${#languages[@]} ]]; then #compares uniq to total index
            echo "Language" ${language[$i]} "already selected."
            i=$(($i - 1))
          fi
        ;;
      esac
    else
      case ${languages[$i]} in
        [1-9])
          if [[ $( echo ${languages[@]} | tr ' ' '\n' | uniq | wc -l) != ${#languages[@]} ]]; then
            echo "Language" ${language[$i]} "already selected."
            i=$(($i - 1))
          fi
        ;;
        [1][0-6]) 
          echo "Invalid Selection"
          i=$(($i - 1))
        ;;
      esac
    fi
      case ${languages[$i]}:$i in 
        [1-9]:*|[1][0-6]:*) #'nothing to do here' #debug
        ;; 
        c:1)   
          echo "At least 1 language must be selected."
          i=$(($i - 1))
        ;; 
        c:*) 
          for void in $(seq $i $lang_end); do #{..} doesnt like var Seq does!
            languages[$void]='void'
            i=$lang_end
          done
          break
        ;; 
        x:*) 
         lang="x"
         break_loop=1
         break
        ;;
        *:*) 
          echo "Invalid Selection"
          i=$(($i - 1))
        ;;
      esac    
    i=$(($i+1))
  done  
  if [ $lang = "x" ]; then
    break_loop=1
    break
  fi

#Begin FMS Selection
  header
  echo "Select Up To 9 FMS Data Sets."
  echo "FMS Data will appear on GUI in order selected."
  echo " "
  echo "Selections:"
  echo ""
  echo "1. Altitude		9.  Wind Direction"
  echo "2. Airspeed		10. Air Temperature"
  echo "3. Mach			11. Date"
  echo "4. Ground Speed		12. Time (GMT)"
  echo "5. Latitude		13. Time To Destination"
  echo "6. Longitude		14. Distance to Destination"
  echo "7. Magnetic Heading"
  echo "8. Wind Speed"
  echo " "
  count=1
  until [ $count = 10 ]; do
    echo -ne "Enter Selection" $count "of 9 Or (c) To Complete Selection(s) Or (x) To Restart: "
    read field1[$count]       
    case ${field1[$count]} in
      [1-9]|[1][0-4]) 
        count=$((count + 1))
      ;;
      x) 
        break_loop=1
        field='x'
        count=10
        break
      ;;
      c) 
        until [ $count = 10 ] ; do
          field1[$count]=17 #17 indicates void
          count=$((count + 1))
        done
        break
      ;;
      *) 
        echo "Invalid Entry"
      ;;
    esac
  done  
#break point if user initiates x in FMS data collection
  if [ "$field" == "x" ]; then
    break
  fi
###############################################
#Variables captured. Display and Save Load out#
###############################################
  header
  echo "System Load-out"
  case "$type" in
    1) echo "Model: CWR450-2000-01" | tee $confdir$lot;;
    2) echo "Model: CWR450-5000-01" | tee $confdir$lot;;
    3) echo "Model: CWR450-2000-02" | tee $confdir$lot;;
    4) echo "Model: CWR450-5000-02" | tee $confdir$lot;;
    5) echo "Model: CWR451-2000-01" | tee $confdir$lot;;
    6) echo "Model: CWR451-5000-01" | tee $confdir$lot;;
    7) echo "Model: CWR451-2000-02" | tee $confdir$lot;;
    8) echo "Model: CWR451-5000-02" | tee $confdir$lot;;
  esac
  if [[ $platform = 1 ]]; then
    echo "Platform: PC12" | tee $confdir$lot
  else
    echo "Platform: PC24" | tee $confdir$lot
    echo "Lighting Packages Selected:" | tee $confdir$lot
    for bool in 1:$op1_bool 2:$op2_bool 3:$op3_bool 4:$op4_bool; do
      case $bool in
        1:0) echo -e '\t Cabin Downwash \t\Disabled' | tee $confdir$lot;;
        1:1) echo -e '\t Cabin Downwash \t Enabled' | tee $confdir$lot;;
        2:0) echo -e '\t Cabin Spotlight \t Disabled' | tee $confdir$lot;;
        2:1) echo -e '\t Cabin Spotlight \t Enabled' | tee $confdir$lot;;
        3:0) echo -e '\t Window Accent \t\t Disabled' | tee $confdir$lot;;
        3:1) echo -e '\t Window Accent \t\t Enabled' | tee $confdir$lot;;
        4:0) echo -e '\t Table Downwash \t Disabled' | tee $confdir$lot;;
        4:1) echo -e '\t Table Downwash \t Enabled' | tee $confdir$lot;;
      esac
    done
  fi
  echo "Lot:" $lot | tee -a $confdir$lot
  echo "Aircraft ID:" $tail | tee -a $confdir$lot
  echo "GUI Revision:" $c2 | tee -a $confdir$lot
  echo "Firmware:" $iso | tee -a $confdir$lot 

  case "$type" in
    [1,3]) echo "Base Database: " $db_450_2000 | tee -a $confdir$lot;;
    [2,4]) echo "Base Database: " $db_450_5000 | tee -a $confdir$lot;;
    [5,7]) echo "Base Database: " $db_451_2000 | tee -a $confdir$lot;;
    [6,8]) echo "Base Database: " $db_451_2000 | tee -a $confdir$lot;;
  esac
  echo $(date) | tee -a $confdir$lot
  case "$sip" in
    y) echo "AVOIP Enabled" | tee -a $confdir$lot;;
    n) echo "AVOIP Disabled" | tee -a $confdir$lot;;
  esac
  echo " "
  echo "Map Selection:"
  if [[ $res = 1 ]]; then
    case $map in
      1) echo "Map: North America" | tee -a $confdir$lot;;
      2) echo "Map: Europe" | tee -a $confdir$lot;;
      3) echo "Map: Africa/Middle East" | tee -a $confdir$lot;;
      4) echo "Map: South America" | tee -a $confdir$lot;;
      5) echo "Map: Asia" | tee -a $confdir$lot;;
      6) echo "Map: World" | tee -a $confdir$lot;;
    esac
  else
    echo "Firmware Upgrade, Map Not Selected." | tee -a $confdir$lot
  fi
#Capturing Language Selections
  echo " "
  echo "Language Selection(s):"
  for i in ${languages[@]}; do
    case $i:$platform in
      1:1) echo "Language: English	Map: USA" | tee -a $confdir$lot;;
      2:1) echo "Language: English	Map: UK" | tee -a $confdir$lot;;
      3:1) echo "Language: English	Map: Canada" | tee -a $confdir$lot;;
      4:1) echo "Language: Spanish	Map: Spain" | tee -a $confdir$lot;;
      5:1) echo "Language: Spanish	Map: Mexico" | tee -a $confdir$lot;;
      6:1) echo "Language: Portuguese Map: Portugal" | tee -a $confdir$lot;;
      7:1) echo "Language: Portuguese	Map: Brazil" | tee -a $confdir$lot;;
      8:1) echo "Language: Russian Map: Russia" | tee -a $confdir$lot;;
      9:1) echo "Language: German	Map: Germany" | tee -a $confdir$lot;;
      10:1) echo "Language: German	Map: Switzerland" | tee -a $confdir$lot;;
      11:1) echo "Language: French	Map: France" | tee -a $confdir$lot;;
      12:1) echo "Language: Chinese       Map: China" | tee -a $confdir$lot;;
      13:1) echo "Language: Ukrainian	Map: Ukraine" | tee -a $confdir$lot;;
      1:2) echo "Language: English" | tee -a $confdir$lot;;
      2:2) echo "Language: Spanish" | tee -a $confdir$lot;;
      3:2) echo "Language: Portugese" | tee -a $confdir$lot;;
      4:2) echo "Language: Russian" | tee -a $confdir$lot;;
      5:2) echo "Language: German" | tee -a $confdir$lot;;
      6:2) echo "Language: French" | tee -a $confdir$lot;;
      7:2) echo "Language: Chinese (Standard)" | tee -a $confdir$lot;;
      8:2) echo "Language: Ukrainian" | tee -a $confdir$lot;;
      *) echo "Selection Voided" | tee -a $confdir$lot;; 
     esac	 
   done
   
#Capture FMS Data
  echo " "
  echo "FMS Selections"
  count=1
  echo " "
  echo "FMS Field(s)" | tee -a $confdir$lot
  for i in ${field1[@]}; do
    case $i in
      1) echo "Altitude" | tee -a $confdir$lot;;
      2) echo "Airspeed" | tee -a $confdir$lot;;
      3) echo "Mach" | tee -a $confdir$lot;;
      4) echo "Ground Speed" | tee -a $confdir$lot;;
      5) echo "Latitude" | tee -a $confdir$lot;;
      6) echo "Longitude" | tee -a $confdir$lot;;
      7) echo "Heading" | tee -a $confdir$lot;;
      8) echo "Wind Speed" | tee -a $confdir$lot;;
      9) echo "Wind Direction" | tee -a $confdir$lot;;
      10) echo "Air Temperature" | tee -a $confdir$lot;;
      11) echo "Date" | tee -a $confdir$lot;;
      12) echo "GMT" | tee -a $confdir$lot;;
      13) echo "Time To Destination" | tee -a $confdir$lot;;
      14) echo "Distance to Destinaton" | tee -a $confdir$lot;;
      17) echo "Selection Voided" | tee -a $confdir$lot;;
    esac
  done
  echo " "
  while : ; do
    echo -ne "Confirm Load-out. Press (${green}ENTER${white}) to continue or (x) to reset"
    read -n 1 key
    case $key in
      x) break_loop=1
         break;;
      *) break;;
    esac
  done
#if user had entered x, this will restart the script
  if [ $break_loop -eq 1 ]; then
    res=$res 
  else
    res=0
  fi
#Close Main Loop
done
key="1"
}

#Generate USB 
function flash_gen {
#select flash disk
usbkeysel
if [ $usbselect = "x" ] ; then 
 return
fi
#mount image
echo "Mounting Firmware Image."
mount ${dir}iso/econnect-firmware.img
#copy payload to image
echo "Copying payload to image"
echo $preimage ${usbkey[$usbselect]} > /dev/tcp/localhost/5349
junk=$(nc -l 127.0.0.1 -p 5350)
sleep 5
#burn image to flash disk 
echo "Transfering image to USB flash disk. There may be a delay at 100% to allow for sync."
sudo /root/scripts/pvimage.sh ${usbkey[$usbselect]}
echo $image ${usbkey[$usbselect]} > /dev/tcp/localhost/5349
junk=$(nc -l 127.0.0.1 -p 5350)
#user has elevated priv to this script, allows progress to be displayed on screen
#  sudo /root/scripts/pvimage.sh ${usbkey[$usbselect]}
#clean up
mount ${dir}iso/econnect-firmware.img
rm $dbstatic'update_DB_factory.sql'
rm $dir'payload/temp/'* 
rm $dir'payload/'*
echo $clean > /dev/tcp/localhost/5349
junk=$(nc -l 127.0.0.1 -p 5350)
umount ${dir}iso/econnect-firmware.img
echo "Transfer Complete, you may remove USB Flash disk."
echo -e "Press Any Key To Continue."
read junk
}


function build {
############################################
#                                          #
# Variables Collected Proceed with         #
# System Build                             #
#                                          #
############################################

#process language JSON

#pull the variables into the array for processing
cnt=1
#create new resource file
echo -en "{"\\n""\\t"\"default\": ">"$dir"/json/resource.json
if (( $platform = 1)); then
  case ${languages[1]} in
    1) echo -en "\"en-us\",\n	\"languages\": [ \"en-us\"">>"$dir"/json/resource.json;;
    2) echo -en "\"en-uk\",\n	\"languages\": [ \"en-uk\"">>"$dir"/json/resource.json;;
    3) echo -en "\"en-ca\",\n	\"languages\": [ \"en-ca\"">>"$dir"/json/resource.json;;
    4) echo -en "\"sp-s\",\n	\"languages\": [ \"sp-s\"">>"$dir"/json/resource.json;;
    5) echo -en "\"sp-m\",\n	\"languages\": [ \"sp-m\"">>"$dir"/json/resource.json;;
    6) echo -en "\"por-p\",\n	\"languages\": [ \"por-p\"">>"$dir"/json/resource.json;;
    7) echo -en "\"por-b\",\n	\"languages\": [ \"por-b\"">>"$dir"/json/resource.json;;
    8) echo -en "\"ru\",\n	\"languages\": [ \"ru\"">>"$dir"/json/resource.json;;
    9) echo -en "\"ger-g\",\n	\"languages\": [ \"ger-g\"">>"$dir"/json/resource.json;;
    10) echo -en "\"ger-s\",\n	\"languages\": [ \"ger-s\"">>"$dir"/json/resource.json;;
    11) echo -en "\"fr\",\n	\"languages\": [ \"fr\"">>"$dir"/json/resource.json;;
    12) echo -en "\"ch\",\n	\"languages\": [ \"ch\"">>"$dir"/json/resource.json;;
    13) echo -en "\"uk\",\n	\"languages\": [ \"uk\"">>"$dir"/json/resource.json;;
    14) break;;
  esac
  for i in ${languages[2]} ${languages[3]}; do 
    case $i in
      1) echo -en ", \"en-us\"">>"$dir"/json/resource.json;;
      2) echo -en ", \"en-uk\"">>"$dir"/json/resource.json;;
      3) echo -en ", \"en-ca\"">>"$dir"/json/resource.json;;
      4) echo -en ", \"sp-s\"">>"$dir"/json/resource.json;;
      5) echo -en ", \"sp-m\"">>"$dir"/json/resource.json;;
      6) echo -en ", \"por-p\"">>"$dir"/json/resource.json;;
      7) echo -en ", \"por-b\"">>"$dir"/json/resource.json;;
      8) echo -en ", \"ru\"">>"$dir"/json/resource.json;;
      9) echo -en ", \"ger-g\"">>"$dir"/json/resource.json;;
      10) echo -en ", \"ger-s\"">>"$dir"/json/resource.json;;
      11) echo -en ", \"fr\"">>"$dir"/json/resource.json;;
      12) echo -en ", \"ch\"">>"$dir"/json/resource.json;;
      13) echo -en ", \"uk\"">>"$dir"/json/resource.json;;
      14) break;;
    esac
  done
else
  case ${languages[1]} in
    1) echo -en "\"english\",\n	\"languages\": [ \"english\"">>"$dir"/json/resource.json;;
    2) echo -en "\"spanish\",\n	\"languages\": [ \"spanish\"">>"$dir"/json/resource.json;;
    3) echo -en "\"portuguese\",\n	\"languages\": [ \"portuguese\"">>"$dir"/json/resource.json;;
    4) echo -en "\"russian\",\n	\"languages\": [ \"russian\"">>"$dir"/json/resource.json;;
    5) echo -en "\"german\",\n	\"languages\": [ \"german\"">>"$dir"/json/resource.json;;
    6) echo -en "\"french\",\n	\"languages\": [ \"french\"">>"$dir"/json/resource.json;;
    7) echo -en "\"chinese\",\n	\"languages\": [ \"chinese\"">>"$dir"/json/resource.json;;
    8) echo -en "\"ukrainian\",\n	\"languages\": [ \"ukrainian\"">>"$dir"/json/resource.json;;
  esac
  for i in {2..9}; do
    case ${languages[$i]} in
     1) echo -en ", \"english\"">>"$dir"/json/resource.json;;
      2) echo -en ", \"spanish\"">>"$dir"/json/resource.json;;
      3) echo -en ", \"portuguese\"">>"$dir"/json/resource.json;;
      4) echo -en ", \"russian\"">>"$dir"/json/resource.json;;
      5) echo -en ", \"german\"">>"$dir"/json/resource.json;;
      6) echo -en ", \"french\"">>"$dir"/json/resource.json;;
      7) echo -en ", \"chinese\"">>"$dir"/json/resource.json;;
      8) echo -en ", \"ukrainian\"">>"$dir"/json/resource.json;;
    esac
  done
fi
echo -en "]" >>"$dir"/json/resource.json
#add closing bracket
echo -en "\n}">>"$dir"/json/resource.json
#copy new resource to GUI.
header
echo "Configuring resource files..."
tar -xzpf ${dir}GUI/$c2  -C /home/emteq
cp ${dir}json/resource.json /home/emteq/$resfile
tar -czpf ${dir}payload/temp/$c2 c2/
rm -rf /home/emteq/c2
#process database options
db_config
#create list file with resources
cp ${dbstatic}update_DB_factory.sql ${dir}payload/temp/
echo "update_DB_factory.sql" > ${dir}payload/update_LIST_${lot}_Factory.lst
echo "$c2" >> ${dir}payload/update_LIST_${lot}_Factory.lst
echo "update_SCENE_factory.tgz" >> ${dir}payload/update_LIST_${lot}_Factory.lst
#process scene scripts for platform and model
if [[ $platform = 1 ]]; then
  if [[ $type = [1,2,3,4] ]] ; then
    cp ${dir}scene/$scene_450 ${dir}payload/temp/update_SCENE_Factory.tgz
  else
    cp ${dir}scene/$scene_451 ${dir}payload/temp/update_SCENE_Factory.tgz
  fi
else
  cp ${dir}scene/$scene_451 ${dir}payload/temp/update_SCENE_Factory.tgz #This will be max config
#  gunzip ${dir}payload/temp/update_SCENE_Factory.tgz 
#  case $light_package in 
#      *) #Remove scripts from tarball as required
#  gzip ${dir}payload/temp/update_SCENE_Factory.tar
#  mv {dir}payload/temp/update_SCENE_Factory.tar.gz {dir}payload/temp/update_SCENE_Factory.tgz
fi
#If SIP is enabled we need to punch a hole in the firewall. Added script does this at boot
if [ "$sip" = "y" ]; then
  gunzip ${dir}payload/temp/update_SCENE_Factory.tgz
  tar -rf ${dir}payload/temp/update_SCENE_Factory.tar --transform 's,.*/,scenes/,' ${dir}scenes/usb_fix.sh 
  gzip ${dir}payload/temp/update_SCENE_Factory.tar
  mv ${dir}payload/temp/update_SCENE_Factory.tar ${dir}payload/temp/update_SCENE_Factory.tgz
fi
tar -czpf  ${dir}payload/update_LIST_${lot}_Factory.tgz -C ${dir}payload/temp/ .

}

#Commit changes to econnect
function commit_econnect {
header
echo "Verify eConnect is connected to PC"
echo "Using IP: "$econip
while [[ $key != "" ]]; do
  echo "Enter to continue: "
  read -s -n 1 key
done
#Verify SSH is up with nmap 
echo " "
echo "Verifying Connection..."
while [[ $up != "22/tcp open  ssh" ]]; do #########################################
  up=$(nmap $econip -PN -p ssh | grep open)
  x=$((x + 1))
  if [ $x -eq 10 ]; then
  echo " "
  echo "Connection not found!"
  echo "Check power and connection"
  while [[ $x != "" ]]; do
  echo -e "Press ${green}ENTER${white} to continue:" ; read x
  header
  echo "Verifying Connection..."
  done
  fi
done

#ensure eConnect is on known SSH list or scp copy will not function
#This method is used over creating keys due to the readonly nature of the
#econnect. 
ssh-keyscan -t rsa $econip > ~/.ssh/known_hosts
echo " "
echo "eConnect Located, Beginning File Transfer"
#If map is needed, copy first
if [ $maptrans = 1 ] && [ "$map" != "7" ]; then
  #prepare econnect for map copy
  echo "This process may take up to 20 minutes"
  echo ""
  echo -e "${red}\e[5mMap selected for transfer.${normal}\e[25m"
  echo " "
  echo "Configuring Map Partition"
  echo ""
  mode=1 
  sshbr "'echo "Q3tm36170" | sudo -S mount -o remount, rw /mnt/mmap'"
  echo " "
  echo -e  "${red}Copying Map to eConnect${white}"
  echo " "
  #grant ownership to emteq
  sshb "'echo "Q3tm36170" | sudo -S chown emteq:emteq /mnt/mmap'"
  #delete existing map if any
  sshb "'echo "Q3tm36170" | sudo -S rm -f /mnt/mmap/*.mbtiles'"
  case $map in 
    1) sshpass -f /home/emteq/.id rsync --progress "$dir"map/na.mbtiles emteq@$econip:/mnt/mmap/map.mbtiles;;
    2) sshpass -f /home/emteq/.id rsync --progress "$dir"map/eu.mbtiles emteq@$econip:/mnt/mmap/map.mbtiles;;
    3) sshpass -f /home/emteq/.id rsync --progress "$dir"map/me.mbtiles emteq@$econip:/mnt/mmap/map.mbtiles;;
    4) sshpass -f /home/emteq/.id rsync --progress "$dir"map/sa.mbtiles emteq@$econip:/mnt/mmap/map.mbtiles;;
    5) sshpass -f /home/emteq/.id rsync --progress "$dir"map/as.mbtiles emteq@$econip:/mnt/mmap/map.mbtiles;;
    6) sshpass -f /home/emteq/.id rsync --progress "$dir"map/wo.mbtiles emteq@$econip:/mnt/mmap/map.mbtiles;;
  esac
  echo " "
  echo -e "${red}Map transfer complete, returning to production mode.${white}"
  echo " "
  sshbr "'echo "Q3tm36170" | sudo -S mount -o remount /mnt/mmap'"
fi
  
#deliver payload
sshpass -f /home/emteq/.id scp $dir"payload/update_LIST_"$lot"_Factory.tgz" emteq@$econip:/mnt/user/upload/
sshpass -f /home/emteq/.id scp $dir"payload/update_LIST_"$lot"_Factory.lst" emteq@$econip:/mnt/user/upload/
#placeholder for for slideshow widget
sshpass -f /home/emteq/.id ssh emteq@$econip bash -c "'mkdir /mnt/user/upload/slideshow'"
sshpass -f /home/emteq/.id scp ${dir}other/greyframe.png emteq@$econip:/mnt/user/upload/slideshow/
sshpass -f /home/emteq/.id scp ${dir}other/README.TXT emteq@$econip:/mnt/user/upload/slideshow/
sshpass -f /home/emteq/.id scp ${dir}other/presentation_time.txt emteq@$econip:/mnt/user/upload/slideshow/
sshb "'echo "Q3tm36170" | sudo -S chown user:user /mnt/user/upload/slideshow -R'"
sshb "'echo "Q3tm36170" | sudo -S chmod 666 /mnt/user/upload/slideshow/*'"
#this is a small helper script for running updates
sshpass -f /home/emteq/.id scp $dir"other/update" emteq@$econip:/mnt/user/upload/
#clean up
rm $dbstatic'update_DB_factory.sql'
rm $dir'payload/temp/'*
rm $dir'payload/'*
header
echo "eConnect is now being configured."
echo " "
echo -e "${red}Installing Configuration Files${white}"
echo ""
sshpass -f /home/emteq/.id ssh emteq@$econip bash -c "'/mnt/user/upload/update update_LIST_"$lot"_Factory.lst'"
echo ""
echo -e "${red}Verifying node is up. Please Wait.${white}"
sleep 10
mode=0
while [[ $mode = 0 ]] ; do
  isup
  mode=$(sshbr "'echo "Q3tm36170" | sudo -S cat /root/boot_mode'")
done
#Change date to future value to reduce time it takes for tar to complete. 
sshbr "'echo "Q3tm36170" | sudo -S date 121220202020'"
#verify node is up and running before alerting user
junk=""
while [[ $junk = "" ]];do
  junk=$(sshbr  "'pgrep node'")
  sleep 10
done
echo -e "${red}Configuration Complete${white}"
echo ""
echo -n "Press any key to continue"
read junk
header
echo "System Configuration Complete"
echo "If a USB map install is required then"
echo "shutdown eConnect, insert USB thumb drive with"
echo "required map to the IFE USB port. Apply power"
echo "to eConnect. The eConnect will copy the necessary"
echo "files and reboot. This process will take some time."
echo " "
echo "It is recommended to now set eConnect boot options."
echo " "
echo -n "Press any key to restart the configuration tool"
read junk
}

#update encoder board
function encoder_update {
clear
header
echo -e "${red}XM Encoder Board Update${white}"
echo ""
echo -e "This will update the encoder board to version: "${blue}$encoder${white}
echo "Existing version(s) will be removed."
echo "Connect USB harness to 'J6'"
echo ""
echo "Press any key to continue"
echo ""
read n

#remove existing streamer
echo -e "${red}Removing previous versions.${white}"
echo -n "Removing version 1.34:"
result=$(adb uninstall com.iadvantage.iamediastreamer | head -c1)
if [ $result = "F" ]; then
	echo " Not Found"
else
	echo " Removed"
fi
result=$(adb uninstall com.in_advantage.iamediastreamer | head -c1)
echo -n "Removing version 1.35:"
if [ $result = "F" ]; then
	echo " Not Found"
else
	echo " Removed"
fi
echo " "
sleep 2
echo -e "${red}Installing new package: " $encoder "${white}"
#install new paclkage
result=$(adb install $dir/encoder/$encoder | cut -c1-1)
if [ $result = "S" ]; then
  echo " "
  echo "Success"
  echo "Starting Service: "
  for i in 1 2; do
    adb shell am start -n com.in_advantage.iamediastreamer/com.in_advantage.iamediastreamer.MainActivity
    sleep 1
  done
else
  echo "Installation Failed, Please check power and/or harness"
fi
echo -n "Press any key to continue: "
read n
}
function switch_functest {
#perform system hardward functionality tests
#leverage qualtest system when convienient
cont=n
clear 
header
echo -e "${red}Network Systems Test"${white}
echo ""
echo "The Following test will test all network systems."
echo "The system will automatically test for line quality and determine Pass/Fail."
echo ""
echo -n "Press any key to continue: "
read n
while : ;do
	echo "WiFi Test Initializing"
	echo -n "Enter expected SSID: "
	read ssid
	if [[ $(sudo /root/scripts/wlol_scan.sh $ssid) = 1 ]]; then
		echo -e "WiFi Signal Located - ${green}Pass${white}"
		break
	else
		echo -e "WiFi Signal NOT located - ${red}Fail${white}"
		echo ""
		echo -ne "Press ${green}ENTER${white} to retry or (x) to exit: "
		read cont
		if [[ "$cont" = "x" ]]; then return; fi
	fi
done
for i in 2 3 4 5 6 7 1; do
	echo ""
	echo -e "Connect CAT5e cable to ${green}P$i${white}"
	echo -e "Wait for connection LED on ${green}P$i${white} to illuminate"
	echo -n "Press any key to continue: "
	read n
	reply=1
	while [[ $reply != 0 ]]; do
		if [[ $i = 1 ]]; then
			#set new ip address
			sudo /root/scripts/wan.sh
			sleep 5
			reply=$(ping -c 5 -q 192.168.10.100 | grep -oP '\d+(?=% packet loss)')
			sudo /root/scripts/lan.sh
		else
			reply=$(ping -c 5 -q $econip | grep -oP '\d+(?=% packet loss)')
		fi  
		if [[ $reply = 0 ]]; then
			echo -e "Packet Loss $reply% - ${green}PASS${white}"
			if [[ $i = 1 ]]; then
				echo ""
				echo "Network Test Complete"
				echo -e "Return LAN Cable to port ${greem}P2${white}"
				echo -n "Press any key to continue"
				read n
			fi
		else
			echo "Packet Loss $reply% - FAIL"
			echo "Please check Connection!"
			echo ""
			echo -ne "Press ${green}Enter${white} to Retry or (x) to Exit."
			read cont
			if [[ "$cont" = "x" ]]; then break; fi
		fi
		if [[ "$cont" = "x" ]]; then break; fi
	
	done	
	if [[ "$cont" = "x" ]]; then break; fi
done

}

function encoder_functest {
	clear
	header
	echo "Encoder Board Functionality Check"
	echo ""
	echo  "Perform encoder board functionality test?"
	echo -ne "Enter ${green}(y)${white} to perform test, any other key to skip: "
	read runtest
	if [[ "$runtest" = "y" ]]; then
		while : ; do
			if [[ -n $(nmap -p 8010 10.0.9.251 | grep open) ]]; then 
				echo -e "Encoder Board Succesfully Located: ${green}PASS${white}"
				echo -e "Press Any Key To Continue"
				read junk
				break
			fi
			echo "Unable to locate encoder board. Please check your connection."
			echo -ne "Press ${green}ENTER${white} to restest ${green}(r)${white} to restart encoder, or ${green}(x)${white} to exit: "
			read cont
			if [[ "$cont" = "x" ]]; then break; fi
			if [[ "$cont" = "r" ]]; then
				adb shell am start -n com.in_advantage.iamediastreamer/com.in_advantage.iamediastreamer.MainActivity
			fi
		done
	fi
}

function arinc_functest {
clear
header
echo -e "${red}External ARINC & RS485 Tests${white}"
echo ""
echo "The following test will verify that both ARINC & RS485 traneceivers"
echo "are properly functioning."
echo ""
echo -e "When prompted for a ${red}password${white} enter ${green}root${white} followed by ${green}ENTER${white}"
echo -e "Select test ${green}7${white}. Note the PASS or FAIL result"
echo -e "Select test ${green}8${white} and follow the on screen instructions"
echo "At the completion of the tests select 0 to exit"
echo -ne "Press ${green}ENTER${white} to continue"
read n
while : ; do
	sshpass -f /home/emteq/.id ssh -t emteq@$econip "su -c 'pkill -9 econapp'"
	sshpass -f /home/emteq/.id ssh -t emteq@$econip "su -c /root/qualtests"
	clear
	header
	echo -e "${red}ARINC Test${white}"
	echo ""
	echo -n  "Did both tests Pass? (Y)es or (N)o?"
	read cont
	if [[ "$cont" = "n" ]]; then
		echo -n "Enter to repeat test or (x) to exit."
		read cont
		if [[ "$cont" = "x" ]]; then break; fi
	else
		break
	fi
done
if [[ "$cont" = "x" ]]; then  break; fi
}

function usb_functest {
clear
header
usb_flash=x
echo -e "${red}USB Port Test${white}"
echo ""
echo "The following test each USB port for functionality"
echo "Insert USB Flash disk into the IFE port"
echo -n "Press any key to continue."
read junk
echo ""
function usb_check { 
	unset usb_flash
	count=0
	while [ -z "$usb_flash" ];do
		usb_flash=$(sshpass -f /home/emteq/.id ssh -t emteq@$econip '/usr/sbin/lsusb | grep 058f:6387')
		sleep 1
		count=$((count+1))
		if [[ $count = 15 ]]; then 
			count=0
			echo -e "${red}USB Not Found${white}"
			echo -ne "${green}ENTER${white} to retry or (x) to exit"
			read cont
			echo ""
		fi
		if [[ "$cont" = "x" ]]; then break; fi
	done
	}
usb_check
if [[ "$cont" = "x" ]]; then return; fi	
echo -e "USB Flash Disk detected - ${green}PASS${white}"
echo ""
echo -e "Insert Flash Disk to ${green}Maintenance USB port.${white}"
echo -ne "Press ${green}ENTER${white} to continue."
read n
echo ""
usb_check
if [[ "$cont" = "x" ]]; then return; fi
echo -e "USB Flash Disk detected - ${green}PASS${white}"
sleep 5
}
function sys_config {
header
         echo ""
         echo "Please Select Network Mode."
         echo ""
         echo "1. Standard Master / Production Mode / System Test"
         echo "2. Satcom1 Mode"
         echo "3. Client Mode"
	 echo ""
         echo -n "Please enter selection or (x) to restart: "
         while : ; do
           read avoip
           case $avoip in
             1) break;;
             2) break;;
	     3) break;;
	     x) break_loop=1
                break;;
             *) echo -n "Selection invalid, please enter selection: ";;
           esac
         done  
         if [[ $break_loop != 1 ]]; then
           clear
           header
           echo ""
           echo "Connect eConnect to PC via LAN. Ensure activity LED is illuminated"
           isup
	   safe=$(sshpass -f /home/emteq/.id ssh emteq@$econip 'if [ -e /opt/scenes/autoupdate.sh ]; then echo 1; else echo 0; fi')
	   if [ $safe=0 ]; then
             echo -e "Please enter ${green}root${white} when prompted for password. Prompt will not echo"
             case $avoip in
               1) sshpass -f /home/emteq/.id ssh -t emteq@$econip 'su -c "/opt/eConnect/scripts/mode_swap/set_boot_mode.sh 1"';;
               2) sshpass -f /home/emteq/.id ssh -t emteq@$econip 'su -c "/opt/eConnect/scripts/mode_swap/set_boot_mode.sh 5"';;
               3) sshpass -f /home/emteq/.id ssh -t emteq@$econip 'su -c "/opt/eConnect/scripts/mode_swap/set_boot_mode.sh 2"';;
     	     esac
             echo " "
             echo  -n "eConnect will now reboot, press any key to return to the main menu "
             read junk
	   else
             echo  "System currently upgrading, Please try again in a few minutes."
	     echo  -n "Press any key to continue."
	     read junk
	   fi
	 fi
}
#main loop
while : ; do
  getconfigfile
  header
  echo "1. Configure eConnect System"
  echo "2. Generate Upgrade USB Flash Drive"
  echo "3. Configure eConnect boot/network options"
  echo "4. eConnect System Test"
  echo "5. Software Preferences"
  echo "6. Test GUI Interface"
  echo "7. Transmit configuration data to BE Aerospace"
  echo "8. Update encoder board"
  echo ""
  if [ $config_file_cnt -gt 5 ] ; then
    echo -e ${red}$config_file_cnt${white} "configuration files awaiting transmission to BE Aerospace."
    echo "Please ensure system has active internet connection and select option 5."
  else
    echo -e ${green}$config_file_cnt${white} "configuration file(s) awaiting transmission to BE Aerospace."
    echo " "
  fi
    echo -n "Please enter selection: "
    read junk
    case $junk in
      1) res=1
         config  #run through config routine
         if [[ $break_loop != 1 ]]; then
           build #build system
           commit_econnect
         fi;;
      2) res=2
         config #run through config routine.
         if [[ $break_loop != 1 ]]; then
           header
           echo "Please insert USB Flash Disk."
           echo ""
           echo -e "Press enter to continue or (x) to restart."
           read junk
           if [ $junk = 'x' ] ; then break_loop=1; fi
           if [[ $break_loop != 1 ]]; then
             build #build system
             flash_gen
           fi
         fi;;
      3) sys_config
         break_loop=0;;
      4) switch_functest
        if [[ "$cont" != "x" ]]; then
          encoder_functest
        fi
        if [[ "$cont" != "x" ]]; then 
          arinc_functest
        fi
        if [[ "$cont" != "x" ]]; then 
          usb_functest
        fi
        if [[ "$cont" != "x" ]]; then
         	echo "Please configure the boot options to customer requirements."
          echo ""
          echo -n "Press any key to configure boot options: "
          sys_config
        fi;;
      5) syscon;;
      6) firefox 10.0.9.1;;
      7) sendconfig ;;
      8) encoder_update;;
      *) echo "Invalid Entry"
         echo -n "Please enter selection: ";;
    esac
done

