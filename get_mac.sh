#!/bin/bash
# A bash script to get Raspberry Pi's MAC address
iface=eth0 # change this to your network interface name
mac=$(cat /sys/class/net/$iface/address) # get the MAC address from the system file
echo The MAC address of $iface is $mac # print the result