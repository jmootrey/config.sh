#!/bin/bash
# SCRIPTID 10
# Modify IPTAbles for SIP Phone Access
# TYPE 0
# STARTUP 1
# EXCLUSIVE 0


#modify iptable rule
iptables -t nat -A POSTROUTING -o vlan2 -j MASQUERADE
iptables-save
echo dhcp-range=10.0.9.10,10.0.9.100,24h >> /etc/dnsmasq.conf
/etc/init.d/dnsmasq restart
exit 0
