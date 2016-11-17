#!/bin/bash
ip link set dev enp8s0 up
#ip addr del 192.168.10.254/24 dev enp8s0
ip addr add 10.0.9.150/24 dev enp8s0
exit
