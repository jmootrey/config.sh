#!/bin/bash
#Determine run mode, assign correct IP to tilestreamer and update DB

boot_mode=$(cat /root/boot_mode)
case $boot_mode in
	1) nic=br0:0;;
	2) nic=br1;;
	3) nic=br1;;
	5) nic=br0;;
	*) nic=br0;;
esac

if [ -f /opt/tilestream/index.js ]; then
    	ip_addr=`/sbin/ifconfig $nic | grep "inet addr" | awk -F: '{print $2}' | awk '{print $1}'`
	echo $ip_addr
	if [ -d /mnt/mmap ]; then
		tiledir="/mnt/mmap"
	else
		tiledir="/opt/tilestream"
	fi
	echo "DELETE FROM web_configuration where \`key\`='map_resource'" | mysql -uroot -proot -Deconnect
	echo "INSERT INTO econnect.web_configuration (\`key\`, \`value\`) VALUES ('map_resource', '"$ip_addr"' );" | mysql -uroot -proot -Deconnect
	/opt/tilestream/index.js --host $ip_addr --uiPort=32500 --tilePort=32500 --tiles=$tiledir  &> /mnt/user/tmp/tilestream.log &
fi

