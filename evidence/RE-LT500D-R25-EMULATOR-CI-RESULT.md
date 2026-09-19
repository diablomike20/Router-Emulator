# RE-LT500D R25 emulator CI result

Commit: 2510a1bf9341a8cc13f76a261d98c50f0f2eed4f
Firmware download/verify: success
Image build: success
QEMU/HTTP gate: failure
Run: https://github.com/diablomike20/Router-Emulator/actions/runs/35430216233


## Serial tail
```text
          RX bytes:9480 (9.2 KiB)  TX bytes:5520 (5.3 KiB)

[LT500D-EMU] route -n
Kernel IP routing table
Destination     Gateway         Genmask         Flags Metric Ref    Use Iface
192.168.10.0    0.0.0.0         255.255.255.0   U     0      0        0 br-lan
[LT500D-EMU] listeners
Active Internet connections (only servers)
Proto Recv-Q Send-Q Local Address           Foreign Address         State       
tcp        0      0 0.0.0.0:80              0.0.0.0:*               LISTEN      
tcp        0      0 0.0.0.0:53              0.0.0.0:*               LISTEN      
tcp        0      0 0.0.0.0:443             0.0.0.0:*               LISTEN      
tcp        0      0 :::80                   :::*                    LISTEN      
tcp        0      0 :::53                   :::*                    LISTEN      
tcp        0      0 :::443                  :::*                    LISTEN      
[LT500D-EMU] INPUT
[   75.874743] firmadyne: sys_socket[PID: 3274 (iptables)]: family:1, type:2, protocol:0
[   75.875299] firmadyne: sys_socket[PID: 3274 (iptables)]: family:2, type:3, protocol:255
Chain INPUT (policy DROP 42 packets, 1848 bytes)
num   pkts bytes target     prot opt in     out     source               destination         
[LT500D-EMU] OUTPUT
[   75.899941] firmadyne: sys_socket[PID: 3275 (iptables)]: family:1, type:2, protocol:0
[   75.900408] firmadyne: sys_socket[PID: 3275 (iptables)]: family:2, type:3, protocol:255
Chain OUTPUT (policy DROP 8 packets, 520 bytes)
num   pkts bytes target     prot opt in     out     source               destination         
[LT500D-EMU] rp_filter
/proc/sys/net/ipv4/conf/all/rp_filter=0
/proc/sys/net/ipv4/conf/br-lan/rp_filter=0
/proc/sys/net/ipv4/conf/eth1/rp_filter=0
[LT500D-EMU] network diagnostic end
[   76.926038] firmadyne: sys_socket[PID: 2861 (ntpd)]: family:2, type:524417, protocol:0
[   76.926391] firmadyne: inet_bind[PID: 2861 (ntpd)]: proto:SOCK_DGRAM, port:0
[   76.929414] firmadyne: sys_socket[PID: 2862 (ntpd)]: family:2, type:524417, protocol:0
[   76.929771] firmadyne: inet_bind[PID: 2862 (ntpd)]: proto:SOCK_DGRAM, port:0
[   80.983049] firmadyne: sys_socket[PID: 3280 (ifconfig)]: family:2, type:1, protocol:0
[   80.984147] firmadyne: __inet_insert_ifa[PID: 3280 (ifconfig)]: device:eth1 ifa:0x00000000
[   81.011722] firmadyne: sys_socket[PID: 3281 (brctl)]: family:2, type:2, protocol:0
[   81.012683] firmadyne: sys_socket[PID: 3281 (brctl)]: family:1, type:524289, protocol:0
[   81.017724] firmadyne: sys_socket[PID: 3281 (brctl)]: family:1, type:524289, protocol:0
[   81.018118] firmadyne: sys_socket[PID: 3281 (brctl)]: family:1, type:524289, protocol:0
[   86.051076] firmadyne: sys_socket[PID: 3284 (ifconfig)]: family:2, type:1, protocol:0
[   86.052441] firmadyne: __inet_insert_ifa[PID: 3284 (ifconfig)]: device:eth1 ifa:0x00000000
[   86.079255] firmadyne: sys_socket[PID: 3285 (brctl)]: family:2, type:2, protocol:0
[   86.085109] firmadyne: sys_socket[PID: 3285 (brctl)]: family:1, type:524289, protocol:0
[   86.086038] firmadyne: sys_socket[PID: 3285 (brctl)]: family:1, type:524289, protocol:0
[   86.086384] firmadyne: sys_socket[PID: 3285 (brctl)]: family:1, type:524289, protocol:0
[   86.941676] firmadyne: sys_socket[PID: 2861 (ntpd)]: family:2, type:524417, protocol:0
[   86.942144] firmadyne: inet_bind[PID: 2861 (ntpd)]: proto:SOCK_DGRAM, port:0
[   86.945480] firmadyne: sys_socket[PID: 2862 (ntpd)]: family:2, type:524417, protocol:0
[   86.945855] firmadyne: inet_bind[PID: 2862 (ntpd)]: proto:SOCK_DGRAM, port:0
[   91.119070] firmadyne: sys_socket[PID: 3288 (ifconfig)]: family:2, type:1, protocol:0
[   91.120220] firmadyne: __inet_insert_ifa[PID: 3288 (ifconfig)]: device:eth1 ifa:0x00000000
[   91.144803] firmadyne: sys_socket[PID: 3289 (brctl)]: family:2, type:2, protocol:0
[   91.148025] firmadyne: sys_socket[PID: 3289 (brctl)]: family:1, type:524289, protocol:0
[   91.153120] firmadyne: sys_socket[PID: 3289 (brctl)]: family:1, type:524289, protocol:0
[   91.153488] firmadyne: sys_socket[PID: 3289 (brctl)]: family:1, type:524289, protocol:0
[   96.187393] firmadyne: sys_socket[PID: 3292 (ifconfig)]: family:2, type:1, protocol:0
[   96.188418] firmadyne: __inet_insert_ifa[PID: 3292 (ifconfig)]: device:eth1 ifa:0x00000000
[   96.208699] firmadyne: sys_socket[PID: 3293 (brctl)]: family:2, type:2, protocol:0
[   96.213335] firmadyne: sys_socket[PID: 3293 (brctl)]: family:1, type:524289, protocol:0
[   96.214330] firmadyne: sys_socket[PID: 3293 (brctl)]: family:1, type:524289, protocol:0
[   96.214687] firmadyne: sys_socket[PID: 3293 (brctl)]: family:1, type:524289, protocol:0
[LT500D-EMU] network diagnostic begin
[LT500D-EMU] bridge
[   96.231388] firmadyne: sys_socket[PID: 3295 (brctl)]: family:2, type:2, protocol:0
bridge name	bridge id		STP enabled	interfaces
[   96.232603] firmadyne: sys_socket[PID: 3295 (brctl)]: family:1, type:524289, protocol:0
[   96.233781] firmadyne: sys_socket[PID: 3295 (brctl)]: family:1, type:524289, protocol:0
br-lan		7fff.525400123456	no		eth0.1
[   96.234448] firmadyne: sys_socket[PID: 3295 (brctl)]: family:1, type:524289, protocol:0
							eth1
brctl: invalid argument 'br-lan' to 'brctl'
[LT500D-EMU] ifconfig br-lan
[   96.260233] firmadyne: sys_socket[PID: 3296 (ifconfig)]: family:2, type:1, protocol:0
br-lan    Link encap:Ethernet  HWaddr 52:54:00:12:34:56  
          inet addr:192.168.10.1  Bcast:192.168.10.255  Mask:255.255.255.0
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:225 errors:0 dropped:0 overruns:0 frame:0
          TX packets:92 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:0 
          RX bytes:10350 (10.1 KiB)  TX bytes:3864 (3.7 KiB)

[LT500D-EMU] ifconfig eth1
[   96.281867] firmadyne: sys_socket[PID: 3297 (ifconfig)]: family:2, type:1, protocol:0
eth1      Link encap:Ethernet  HWaddr 52:54:00:12:34:57  
          inet6 addr: fe80::5054:ff:fe12:3457/64 Scope:Link
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:225 errors:0 dropped:0 overruns:0 frame:0
          TX packets:92 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000 
          RX bytes:13500 (13.1 KiB)  TX bytes:5520 (5.3 KiB)

[LT500D-EMU] route -n
Kernel IP routing table
Destination     Gateway         Genmask         Flags Metric Ref    Use Iface
192.168.10.0    0.0.0.0         255.255.255.0   U     0      0        0 br-lan
[LT500D-EMU] listeners
Active Internet connections (only servers)
Proto Recv-Q Send-Q Local Address           Foreign Address         State       
tcp        0      0 0.0.0.0:80              0.0.0.0:*               LISTEN      
tcp        0      0 0.0.0.0:53              0.0.0.0:*               LISTEN      
tcp        0      0 0.0.0.0:443             0.0.0.0:*               LISTEN      
tcp        0      0 :::80                   :::*                    LISTEN      
tcp        0      0 :::53                   :::*                    LISTEN      
tcp        0      0 :::443                  :::*                    LISTEN      
[LT500D-EMU] INPUT
[   96.349564] firmadyne: sys_socket[PID: 3300 (iptables)]: family:1, type:2, protocol:0
[   96.350100] firmadyne: sys_socket[PID: 3300 (iptables)]: family:2, type:3, protocol:255
Chain INPUT (policy DROP 109 packets, 4796 bytes)
num   pkts bytes target     prot opt in     out     source               destination         
[LT500D-EMU] OUTPUT
[   96.374533] firmadyne: sys_socket[PID: 3301 (iptables)]: family:1, type:2, protocol:0
[   96.375018] firmadyne: sys_socket[PID: 3301 (iptables)]: family:2, type:3, protocol:255
Chain OUTPUT (policy DROP 24 packets, 1560 bytes)
num   pkts bytes target     prot opt in     out     source               destination         
[LT500D-EMU] rp_filter
/proc/sys/net/ipv4/conf/all/rp_filter=0
/proc/sys/net/ipv4/conf/br-lan/rp_filter=0
/proc/sys/net/ipv4/conf/eth1/rp_filter=0
[LT500D-EMU] network diagnostic end
[   96.957716] firmadyne: sys_socket[PID: 2861 (ntpd)]: family:2, type:524417, protocol:0
[   96.958161] firmadyne: inet_bind[PID: 2861 (ntpd)]: proto:SOCK_DGRAM, port:0
[   96.961431] firmadyne: sys_socket[PID: 2862 (ntpd)]: family:2, type:524417, protocol:0
[   96.961795] firmadyne: inet_bind[PID: 2862 (ntpd)]: proto:SOCK_DGRAM, port:0
[  101.447620] firmadyne: sys_socket[PID: 3306 (ifconfig)]: family:2, type:1, protocol:0
[  101.448696] firmadyne: __inet_insert_ifa[PID: 3306 (ifconfig)]: device:eth1 ifa:0x00000000
[  101.472853] firmadyne: sys_socket[PID: 3307 (brctl)]: family:2, type:2, protocol:0
[  101.476479] firmadyne: sys_socket[PID: 3307 (brctl)]: family:1, type:524289, protocol:0
[  101.481501] firmadyne: sys_socket[PID: 3307 (brctl)]: family:1, type:524289, protocol:0
[  101.481858] firmadyne: sys_socket[PID: 3307 (brctl)]: family:1, type:524289, protocol:0
[  106.514771] firmadyne: sys_socket[PID: 3310 (ifconfig)]: family:2, type:1, protocol:0
[  106.515844] firmadyne: __inet_insert_ifa[PID: 3310 (ifconfig)]: device:eth1 ifa:0x00000000
[  106.540476] firmadyne: sys_socket[PID: 3311 (brctl)]: family:2, type:2, protocol:0
[  106.543337] firmadyne: sys_socket[PID: 3311 (brctl)]: family:1, type:524289, protocol:0
[  106.544191] firmadyne: sys_socket[PID: 3311 (brctl)]: family:1, type:524289, protocol:0
[  106.544518] firmadyne: sys_socket[PID: 3311 (brctl)]: family:1, type:524289, protocol:0
[  106.973772] firmadyne: sys_socket[PID: 2861 (ntpd)]: family:2, type:524417, protocol:0
[  106.974222] firmadyne: inet_bind[PID: 2861 (ntpd)]: proto:SOCK_DGRAM, port:0
[  106.977347] firmadyne: sys_socket[PID: 2862 (ntpd)]: family:2, type:524417, protocol:0
[  106.977705] firmadyne: inet_bind[PID: 2862 (ntpd)]: proto:SOCK_DGRAM, port:0
[  111.582627] firmadyne: sys_socket[PID: 3314 (ifconfig)]: family:2, type:1, protocol:0
[  111.583710] firmadyne: __inet_insert_ifa[PID: 3314 (ifconfig)]: device:eth1 ifa:0x00000000
[  111.610605] firmadyne: sys_socket[PID: 3315 (brctl)]: family:2, type:2, protocol:0
[  111.611597] firmadyne: sys_socket[PID: 3315 (brctl)]: family:1, type:524289, protocol:0
[  111.612455] firmadyne: sys_socket[PID: 3315 (brctl)]: family:1, type:524289, protocol:0
[  111.612776] firmadyne: sys_socket[PID: 3315 (brctl)]: family:1, type:524289, protocol:0
[  116.643181] firmadyne: sys_socket[PID: 3318 (ifconfig)]: family:2, type:1, protocol:0
[  116.643678] firmadyne: __inet_insert_ifa[PID: 3318 (ifconfig)]: device:eth1 ifa:0x00000000
[  116.668815] firmadyne: sys_socket[PID: 3319 (brctl)]: family:2, type:2, protocol:0
[  116.673288] firmadyne: sys_socket[PID: 3319 (brctl)]: family:1, type:524289, protocol:0
[  116.674150] firmadyne: sys_socket[PID: 3319 (brctl)]: family:1, type:524289, protocol:0
[  116.674490] firmadyne: sys_socket[PID: 3319 (brctl)]: family:1, type:524289, protocol:0
[LT500D-EMU] network diagnostic begin
[LT500D-EMU] bridge
[  116.691772] firmadyne: sys_socket[PID: 3321 (brctl)]: family:2, type:2, protocol:0
bridge name	bridge id		STP enabled	interfaces
[  116.693219] firmadyne: sys_socket[PID: 3321 (brctl)]: family:1, type:524289, protocol:0
[  116.694125] firmadyne: sys_socket[PID: 3321 (brctl)]: family:1, type:524289, protocol:0
br-lan		7fff.525400123456	no		eth0.1
[  116.694755] firmadyne: sys_socket[PID: 3321 (brctl)]: family:1, type:524289, protocol:0
							eth1
brctl: invalid argument 'br-lan' to 'brctl'
[LT500D-EMU] ifconfig br-lan
[  116.711896] firmadyne: sys_socket[PID: 3322 (ifconfig)]: family:2, type:1, protocol:0
br-lan    Link encap:Ethernet  HWaddr 52:54:00:12:34:56  
          inet addr:192.168.10.1  Bcast:192.168.10.255  Mask:255.255.255.0
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:290 errors:0 dropped:0 overruns:0 frame:0
          TX packets:92 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:0 
          RX bytes:13340 (13.0 KiB)  TX bytes:3864 (3.7 KiB)

[LT500D-EMU] ifconfig eth1
[  116.732639] firmadyne: sys_socket[PID: 3323 (ifconfig)]: family:2, type:1, protocol:0
eth1      Link encap:Ethernet  HWaddr 52:54:00:12:34:57  
          inet6 addr: fe80::5054:ff:fe12:3457/64 Scope:Link
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:290 errors:0 dropped:0 overruns:0 frame:0
          TX packets:92 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000 
          RX bytes:17400 (16.9 KiB)  TX bytes:5520 (5.3 KiB)

[LT500D-EMU] route -n
Kernel IP routing table
Destination     Gateway         Genmask         Flags Metric Ref    Use Iface
192.168.10.0    0.0.0.0         255.255.255.0   U     0      0        0 br-lan
[LT500D-EMU] listeners
Active Internet connections (only servers)
Proto Recv-Q Send-Q Local Address           Foreign Address         State       
tcp        0      0 0.0.0.0:80              0.0.0.0:*               LISTEN      
tcp        0      0 0.0.0.0:53              0.0.0.0:*               LISTEN      
tcp        0      0 0.0.0.0:443             0.0.0.0:*               LISTEN      
tcp        0      0 :::80                   :::*                    LISTEN      
tcp        0      0 :::53                   :::*                    LISTEN      
tcp        0      0 :::443                  :::*                    LISTEN      
[LT500D-EMU] INPUT
[  116.796070] firmadyne: sys_socket[PID: 3326 (iptables)]: family:1, type:2, protocol:0
[  116.796542] firmadyne: sys_socket[PID: 3326 (iptables)]: family:2, type:3, protocol:255
Chain INPUT (policy DROP 174 packets, 7656 bytes)
num   pkts bytes target     prot opt in     out     source               destination         
[LT500D-EMU] OUTPUT
[  116.820427] firmadyne: sys_socket[PID: 3327 (iptables)]: family:1, type:2, protocol:0
[  116.821131] firmadyne: sys_socket[PID: 3327 (iptables)]: family:2, type:3, protocol:255
Chain OUTPUT (policy DROP 40 packets, 2600 bytes)
num   pkts bytes target     prot opt in     out     source               destination         
[LT500D-EMU] rp_filter
/proc/sys/net/ipv4/conf/all/rp_filter=0
/proc/sys/net/ipv4/conf/br-lan/rp_filter=0
/proc/sys/net/ipv4/conf/eth1/rp_filter=0
[LT500D-EMU] network diagnostic end
[  116.989643] firmadyne: sys_socket[PID: 2861 (ntpd)]: family:2, type:524417, protocol:0
[  116.990096] firmadyne: inet_bind[PID: 2861 (ntpd)]: proto:SOCK_DGRAM, port:0
[  116.993303] firmadyne: sys_socket[PID: 2862 (ntpd)]: family:2, type:524417, protocol:0
[  116.993692] firmadyne: inet_bind[PID: 2862 (ntpd)]: proto:SOCK_DGRAM, port:0
[  121.898851] firmadyne: sys_socket[PID: 3332 (ifconfig)]: family:2, type:1, protocol:0
[  121.899914] firmadyne: __inet_insert_ifa[PID: 3332 (ifconfig)]: device:eth1 ifa:0x00000000
[  121.918364] firmadyne: sys_socket[PID: 3333 (brctl)]: family:2, type:2, protocol:0
[  121.923591] firmadyne: sys_socket[PID: 3333 (brctl)]: family:1, type:524289, protocol:0
[  121.924473] firmadyne: sys_socket[PID: 3333 (brctl)]: family:1, type:524289, protocol:0
[  121.924814] firmadyne: sys_socket[PID: 3333 (brctl)]: family:1, type:524289, protocol:0
```
