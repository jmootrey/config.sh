#!/bin/bash
# SCRIPTID 23
# Update DB Gui Version w installed
# TYPE 0
# STARTUP 1
# EXCLUSIVE 0
for data in $(head /opt/c2/c2ver); do
	if [[ ${#data} = 8 ]]; then
		field='web_customer_major'
	else
		field='web_customer_minor'
	fi
	echo 'update system_versions set' $field '=' $data | mysql -uroot -proot econnect
done
