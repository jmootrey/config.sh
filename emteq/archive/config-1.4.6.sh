#!/bin/bash
#eConnect Configuration Tool
#This script is intended to configure eConnect systems 
#and is written specifically for PC12 units. 

#VERSION 1.4.5
#Changelog
#1.4.5 
#  Added function to update encoder boards to 1.35.2
#  Added code to determine default scale, metric || imperial
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

#system variables
c2=$( cat /home/emteq/.c2 )
econip=$( cat /home/emteq/.econip )
econapp=$( cat /home/emteq/.econapp )
iso=$( cat /home/emteq/.iso )
encoder=$( cat /home/emteq/.encoder )
res=0
ver="1.4.6"
dir="/home/emteq/.resources/"
dbdir=${dir}db/
dbstatic=${dir}/dbstatic/
confdir=${dir}/config/
resfile="c2/src/presentation/resources/resource.json"
for i in 1 2 ; do
  dbfiles[$i]=$( head -n $i /home/emteq/.dbfiles | tail -1 )
done
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
 echo " "
 echo "Insert USB flash disk. USB flash disk must be at least 32Gb"
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
echo -e " ${black} " #Hide ssh ouput from user. 
sshpass -f /home/emteq/.id ssh emteq@$econip bash -c "$1" >/dev/null 
echo -e " ${white} " #return console text to white
}

#sshpass alias. Pases command to host, makes output available to user
function sshbr() { 
sshpass -f /home/emteq/.id ssh emteq@$econip bash -c "$1" 
}

#sshpass aliad=s. Invokes scp
function sshc() { sshpass -f /home/emteq/.id scp "$1" ; }

#Function to check econn state
function isup() {
  echo -e " ${black} "
  up=no
  while [[ $up != "22/tcp open  ssh" ]]; do
    up=$(nmap $econip -PN -p ssh | grep open)
  sleep 20
  done
  sleep 10
  up=""
  while [[ $up = "" ]]; do
    up=$(sshbr "'echo "Q3tm36170" | sudo -S cat /root/boot_mode'")
  sleep 20
  done
  echo $up
  echo -e " ${white} "
}

#Modify software parameters
function syscon {
header
echo "Current Settings:"
echo -e  "1. eConnect IP: "${blue}$econip${white}
echo -e "2. Base GUI File: "${blue}$c2${white} 
echo -e "3. eConapp Version: "${blue}$econapp${white}
echo -e "4. Base Image File: "${blue}$iso${white}
echo -e "5. encoder board software: "${blue}$encoder${white}
echo -e "6. Database Files:"
echo -e "	CWR450-2000: "${blue}${dbfiles[1]}${white}
echo -e "	CWR450-5000: "${blue}${dbfiles[2]}${white}
echo -e "7. Update System with EMTEQ package: "
echo " "
while : ; do
  echo -n "Please enter item to modify or (x) to exit: "
  read junk
  case $junk in
    1) echo " "
       echo -n "Enter new IP address: "
       read econip
       echo $econip >/home/emteq/.econip
       break;;
    2) echo " "
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
       echo $c2 >/home/emteq/.c2
       break;;
     
     3) echo " "
	    cnt=1
	    for file in $( ls ${dir}econapp/ ) ; do
		    echo $cnt "." $file
		    files[$cnt]=$file
		    cnt=$((cnt + 1))
	    done
	    echo " "
	    echo -n "Select eConnApp File: "
	    read efile
	    econapp=${files[$efile]}
	    echo $econapp >/home/emteq/.econapp
	    break;;

      4) echo " "
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
       if [[ $fstab = 'F' ]]; then
	       sudo /root/scripts/ftab F
       else
	       sudo /root/scripts/ftab
       fi
       echo $iso >/home/emteq/.iso
       echo "Updating image file..."
       rsync --progress ${dir}iso/${iso} ${dir}iso/econnect-firmware.img
       break;;
    
    5) echo ""
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
       echo $encoder > /home/emteq/.encoder
       break;;
    6) echo "Warning - Selecting the wrong file will cause configurations to fail!"
       echo " "
       cnt=1
       for file in $( ls $dbdir ) ; do
         echo $cnt "." $file
         files[$cnt]=$file
         cnt=$((cnt + 1))
       done
       echo " "
       echo -n "Select DB for CWR450-2000: "
       read sel
       dbfiles[1]=${files[$sel]}
       echo ${dbfiles[1]} >/home/emteq/.dbfiles
       echo -n "Select DB for CWR450-5000: "
       read sel
       echo ${files[$sel]} >>/home/emteq/.dbfiles
       dbfiles[2]=${files[$sel]}
       break;;
    7) header
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

#Commit User selected FMS parameters to local DB
#Dumps local DB to file for import to remote system
function fms_config () {
count=301
cnt=1
#Host working database
sql "DROP DATABASE IF EXISTS econnect;"
sql "CREATE DATABASE econnect;"
case $type in
  1)  mysql -uroot -proot -Deconnect < $dbdir${dbfiles[1]};;
  2)  mysql -uroot -proot -Deconnect < $dbdir${dbfiles[2]};;
  3)  mysql -uroot -proot -Deconnect < $dbdir${dbfiles[1]};;
  4)  mysql -uroot -proot -Deconnect < $dbdir${dbfiles[2]};;
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
#    15) echo "UPDATE econnect.web_userwidgets SET visible=1, ordinal=$i WHERE UserWidgetID=316;" >> $dbstatic"update.sql";;
#    16) echo "UPDATE econnect.web_userwidgets SET visible=1, ordinal=$i WHERE UserWidgetID=316;" >> $dbstatic"update.sql";;
  esac
done
if [ $sip = 'y' ] ; then
  echo "DELETE FROM econnect.econnect_config WHERE ecms_id=2;" >> $dbstatic"update.sql"
  echo "UPDATE econnect.econnect_config SET econnect_ip='10.0.9.1' WHERE ecms_id=1;" >> $dbstatic"update.sql"
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
sql "DROP DATABASE IF EXISTS econnect;"
}


function config {
#initialize main loop. The user will break to here should they want to restart
while [ $res -eq 1 ] || [ $res -eq 2 ];  do
#initialize a few variables, these all require a reset if the user restarts the script. 
  type=""
  sip=""
  tail=""
  map=""
  languages=" "
  field=" "
  field1=(0, 0, 0)
  field2=(0, 0, 0)
  field3=(0, 0, 0)
  lot=" "
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
  
#System Configure
  header
  echo  "Select Your eConnect Configuration"
  echo " "
  echo  "1. CWR450-2000-01 Base eConnect System Low Capacity Drive "
  echo  "2. CWR450-5000-01 XM eConnect System Low Capacity Drive" 
  echo  "3. CWR450-2000-02 Base eConnect System High Capacity Drive"
  echo  "4. CWR450-5000-02 XM eConnect System High Capacity Drive" 
  echo " "

  while : ; do
    echo -n "Enter Selection: " 
    read type
    case $type in 
      [1-4]) echo -n "Enter Lot Number: "
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

  #Begin Map Selection, Skip if generating firmware flash disk
  if [ $res -eq 1 ]; then  
    header
    echo "Select map"
    echo " "
    echo "1. North America"
    echo "2. Europe"
    echo "3. Africa/Middle East"
    echo "4. South America"
    echo "5. Asia"
  #if high capacity drive, offer world map.
    if [ "$type" -gt 2 ]; then 
      echo "6. World Map"
    fi
    echo " "
    while : ; do
      echo -n "Enter Selection or (x) to Restart: " 
      read map
      case $map in 
        [1-6]) if [ "$type" -lt 2 ] && [ "$map" = 6 ] ; then
                 echo "Not a valid selection: $map"
               else
                 break
               fi;;
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
    echo "The map may be copied directly using TCP/IP (recommended)"
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
  header
  if [ $break_loop = "x" ] ; then 
    break
  fi
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

  i=1
  until [ $i = 4 ]; do
    echo -n "Enter Selection" $i "(c) To Complete Selection(s) Or (x) to Restart: " 
    read languages[$i]
    case ${languages[$i]} in
      [1-9]|[1][0-6]) 
        if [ "$i" -ge "2" ] ; then
          if [[ ${languages[1]} = ${languages[2]} ]] || [[ ${languages[2]} = ${languages[3]} ]] || [[ ${languages[1]} = ${languages[3]} ]] ; then
            echo "Language" ${language[$i]} "already selected."
            i=$(($i - 1))
          fi
        fi;;
       c) case $i in 
         1) echo "At least 1 language must be selected."
           i=$(($i - 1));;
         2) languages[3]=${languages[2]}
           i=4
           break;; 
         3) i=4
           break;;
           esac;;
         x) lang="x"
            break_loop=1
            break;;
         *) echo "Invalid Selection"
            i=$(($i - 1));;
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
  echo "4. Ground Speed		12. GMT"
  echo "5. Latitude		13. Time To Destination"
  echo "6. Longitude		14. Distance to Destination"
  echo "7. Heading"
  echo "8. Wind Speed"
  echo " "
  count=1
  until [ $count = 10 ]; do
    echo -ne "Enter Selection" $count "of 9 Or (c) To Complete Selection(s) Or (x) To Restart: "
    read field1[$count]       
    case ${field1[$count]} in
      [1-9]|[1][0-6]) count=$((count + 1));;
      x) break_loop=1
         field='x'
         count=10
         break;;
      c) until [ $count = 10 ] ; do
            field1[$count]=17
            count=$((count + 1))
          done
          break;;
      *) echo "Invalid Entry";;
    esac
  done  
#break point if user initiates x in FMS data collection
  if [ "$field" == "x" ]; then
    break
  fi
#Variables captured. Display and Save Load out
  header
  echo "System Load-out"
  case "$type" in
    1) echo "Model: CWR450-2000-01" | tee $confdir$lot;;
    2) echo "Model: CWR450-5000-01" | tee $confdir$lot;;
    3) echo "Model: CWR450-2000-02" | tee $confdir$lot;;
    4) echo "Model: CWR450-5000-02" | tee $confdir$lot;;
  esac
  echo "Lot:" $lot | tee -a $confdir$lot
  echo "Aircraft ID:" $tail | tee -a $confdir$lot
  case "$type" in
    1) echo "Base Database: " ${dbfiles[1]} | tee -a $confdir$lot;;
    2) echo "Base Database: " ${dbfiles[2]} | tee -a $confdir$lot;;
    3) echo "Base Database: " ${dbfiles[1]} | tee -a $confdir$lot;;
    4) echo "Base Database: " ${dbfiles[2]} | tee -a $confdir$lot;;
  esac
  echo $(date) | tee -a $confdir$lot
  case "$sip" in
    y) echo "AVOIP Enabled" | tee -a $confdir$lot;;
    n) echo "AVOIP Disabled" | tee -a $confdir$lot;;
  esac
  echo " "
  echo "Map Selection:"
  if [ $res -eq 1 ]; then
    case "$map" in
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
    case $i in
      1) echo "Language: English	Map: USA" | tee -a $confdir$lot;;
      2) echo "Language: English	Map: UK" | tee -a $confdir$lot;;
      3) echo "Language: English	Map: Canada" | tee -a $confdir$lot;;
      4) echo "Language: Spanish	Map: Spain" | tee -a $confdir$lot;;
      5) echo "Language: Spanish	Map: Mexico" | tee -a $confdir$lot;;
      6) echo "Language: Portuguese Map: Portugal" | tee -a $confdir$lot;;
      7) echo "Language: Portuguese	Map: Brazil" | tee -a $confdir$lot;;
      8) echo "Language: Russian Map: Russia" | tee -a $confdir$lot;;
      9) echo "Language: German	Map: Germany" | tee -a $confdir$lot;;
      10) echo "Language: German	Map: Switzerland" | tee -a $confdir$lot;;
      11) echo "Language: French	Map: France" | tee -a $confdir$lot;;
      13) echo "Language: Ukrainian	Map: Ukraine" | tee -a $confdir$lot;;
      c) echo "Selection Voided" | tee -a $confdir$lot;;
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
    echo -n "Confirm Load-out. Press (ENTER) to continue or (x) to reset"
    read -n 1 key
    case $key in
      x) break_loop=1
         break;;
      *) break;;
    esac
  done
#  done
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
# Variables Collected Proceed with        #
# System Build                             #
#                                          #
############################################

#process language JSON

#pull the variables into the array for processing
cnt=1
#create new resource file
echo -en "{"\\n""\\t"\"default\": ">"$dir"/json/resource.json
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
#process database FMS widget
fms_config
#create list file with resources
cp ${dbstatic}update_DB_factory.sql ${dir}payload/temp/
cp ${dir}econapp/$econapp ${dir}payload/temp/
echo "update_DB_factory.sql" > ${dir}payload/update_LIST_${lot}_Factory.lst
echo "$c2" >> ${dir}payload/update_LIST_${lot}_Factory.lst
echo $econapp >> ${dir}payload/update_LIST_${lot}_Factory.lst
if [ "$sip" = "y" ]; then
  cp ${dir}scene/update_SCENES_125214_factorysip.tgz ${dir}payload/temp/
  echo "update_SCENES_125214_factorysip.tgz" >> ${dir}payload/update_LIST_${lot}_Factory.lst
  else
  cp ${dir}scene/update_SCENES_125214_factory.tgz ${dir}payload/temp/
  echo "update_SCENES_125214_factory.tgz" >> ${dir}payload/update_LIST_${lot}_Factory.lst
fi
tar -czpf  ${dir}payload/update_LIST_${lot}_Factory.tgz -C ${dir}payload/temp/ .
}

#Commit changes to econnect
function commit_econnect {
#Verify SSH is up with Copy resources to target
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
while [[ $up != "22/tcp open  ssh" ]]; do
  up=$(nmap $econip -PN -p ssh | grep open)
  x=$((x + 1))
  if [ $x -eq 10 ]; then
  echo " "
  echo "Connection not found!"
  echo "Check power and connection"
  while [[ $x != "" ]]; do
  echo "Press ENTER to continue:" ; read x
  header
  echo "Verifying Connection..."
  done
  fi
done
#Ensure we are in the proper run mode
#mode=0
#mode=$(sshbr "'echo "Q3tm36170" | sudo -S cat /root/boot_mode'") 
#### Section Comm Out due to AVOIP req ####
#if [[ $mode != 1 ]]; then
#  echo 'eConnect in wrong run mode! Entering Production Mode.'
#  while [[ $mode != 1 ]]; do
#    sshb "'echo "Q3tm36170" | sudo -S /opt/eConnect/scripts/mode_swap/set_boot_mode.sh 1'"
#    sleep 150
#    isup
#    mode=$(sshbr "'echo "Q3tm36170" | sudo -S cat /root/boot_mode'")
#  done
#fi

#ensure eConnect is on known SSH list or scp copy will not function
#This method is used over creating keys due to the readonly nature of the
#econnect. We unfortunately lose the ability to monitor the upload process.
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
  echo "Setting eConnect to developer mode."
  echo ""
  #set to developer mode
  mode=1 #enter while loop
  while [[ $mode != 4  ]]; do
    econip=$(cat /home/emteq/.econip)
    sshb "'echo "Q3tm36170" | sudo -S /opt/eConnect/scripts/mode_swap/set_boot_mode.sh 4'"
    sleep 120
    econip='10.0.9.1'
    isup
    mode=$(sshbr "'echo "Q3tm36170" | sudo -S cat /root/boot_mode'")
  done
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
  #return to production mode
  mode=0
  while [ $mode != 1 ]; do
    econip='10.0.9.1'
    sshb "'echo "Q3tm36170" | sudo -S /opt/eConnect/scripts/mode_swap/set_boot_mode.sh 1'"
    sleep 120
    econip=$(cat /home/emteq/.econip)
    isup
    mode=$(sshbr "'echo "Q3tm36170" | sudo -S cat /root/boot_mode'") 
  done
fi
  
#deliver payload
sshpass -f /home/emteq/.id scp $dir"payload/update_LIST_"$lot"_Factory.tgz" emteq@$econip:/mnt/user/upload/
sshpass -f /home/emteq/.id scp $dir"payload/update_LIST_"$lot"_Factory.lst" emteq@$econip:/mnt/user/upload/
#placeholder for for slideshow widget
sshpass -f /home/emteq/.id ssh emteq@$econip bash -c "'mkdir /mnt/user/upload/slideshow'"
sshpass -f /home/emteq/.id scp ${dir}other/greyframe.png emteq@$econip:/mnt/user/upload/slideshow/
sshpass -f /home/emteq/.id scp ${dir}other/README.TXT emteq@$econip:/mnt/user/upload/slideshow/
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
#Change date to future value to reduce time it takes for tar to complete. 
sleep 125
mode=0
while [[ $mode = 0 ]] ; do
  isup
  mode=$(sshbr "'echo "Q3tm36170" | sudo -S cat /root/boot_mode'")
done
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
echo "Select option 3 from the main menu"
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
  adb shell am start -n com.in_advantage.iamediastreamer/com.in_advantage.iamediastreamer.MainActivity
else
  echo "Installation Failed, Please check power and/or harness"
fi
echo -n "Press any key to continue: "
read n
}
while : ; do
  getconfigfile
  header
  echo "1. Configure eConnect System"
  echo "2. Generate Upgrade USB Flash Drive"
  echo "3. Configure eConnect boot/network options"
  echo "4. Software Preferences"
  echo "5. Transmit configuration data to Emteq"
  echo "6. Update encoder board"
  echo ""
  if [ $config_file_cnt -gt 5 ] ; then
    echo -e ${red}$config_file_cnt${white} "configuration files awaiting transmission to Emteq."
    echo "Please ensure system has active internet connection and select option 5."
  else
    echo -e ${green}$config_file_cnt${white} "configuration file(s) awaiting transmission to Emteq."
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
      3) header
         echo ""
         echo "Please Select Network Mode."
         echo ""
         echo "1. Standard Master / Production Mode"
         echo "2. Satcom1 Mode"
         echo ""
         echo -n "Please enter selection or (x) to restart: "
         while : ; do
           read avoip
           case $avoip in
             1) break;;
             2) break;;
             x) break_loop=1
                break;;
             *) echo -n "Selection invalid, please enter selection: ";;
           esac
         done  
         if [[ $break_loop != 1 ]]; then
           clear
           header
           echo ""
           echo "Ensure eConnect is powered on with network connected to PC"
           isup
           echo "Please enter Q3tm36170 when prompted for password. Prompt will not echo"
           case $avoip in
             1) sshpass -f /home/emteq/.id ssh -t emteq@$econip 'sudo /opt/eConnect/scripts/mode_swap/set_boot_mode.sh 1';;
             2) sshpass -f /home/emteq/.id ssh -t emteq@$econip 'sudo /opt/eConnect/scripts/mode_swap/set_boot_mode.sh 5';;
           esac
           echo " "
           echo  -n "eConnect will now reboot, press any key to return to the main menu "
           read junk
           sleep 30
         fi
         break_loop=0;;
      4) syscon;;
      5) sendconfig ;;
      6) encoder_update;;
      *) echo "Invalid Entry"
         echo -n "Please enter selection: ";;
    esac
done

