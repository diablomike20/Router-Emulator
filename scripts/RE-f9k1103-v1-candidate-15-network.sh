#!/bin/sh
grep -qw 'F9K1103_V1_C15_EMU=1' /proc/cmdline 2>/dev/null || exit 0
while uci -q delete network.@switch[0] 2>/dev/null; do :; done
while uci -q delete network.@switch_vlan[0] 2>/dev/null; do :; done
uci -q delete network.lan
uci set network.lan='interface'
uci set network.lan.ifname='eth1'
uci set network.lan.proto='static'
uci set network.lan.ipaddr='192.168.10.2'
uci set network.lan.netmask='255.255.255.0'
uci -q delete network.wan
uci set network.wan='interface'
uci set network.wan.ifname='eth0'
uci set network.wan.proto='dhcp'
uci commit network
exit 0
