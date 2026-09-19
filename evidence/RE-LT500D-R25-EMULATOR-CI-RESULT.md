# RE-LT500D R25 emulator CI result

Commit: 9b529b1b5cd9a17beaa1283964b15c9a1e06bdf3
Firmware download/verify: success
Image build: success
QEMU/HTTP gate: failure
Run: https://github.com/diablomike20/Router-Emulator/actions/runs/35429217930


## Serial tail
```text
[   68.488097] firmadyne: sys_socket[PID: 3289 (iptables)]: family:2, type:3, protocol:255
[   68.495122] firmadyne: sys_socket[PID: 3289 (iptables)]: family:2, type:3, protocol:255
[   68.495560] firmadyne: sys_socket[PID: 3284 (mosquitto)]: family:1, type:524289, protocol:0
[   68.504369] firmadyne: sys_socket[PID: 3284 (mosquitto)]: family:2, type:2, protocol:6
[   68.504618] firmadyne: sys_setsockopt[PID: 3284 (mosquitto)]: fd:5, level:65535, optname:4
[   68.504804] firmadyne: sys_setsockopt[PID: 3284 (mosquitto)]: fd:5, level:41, optname:26
[   68.505072] firmadyne: inet_bind[PID: 3284 (mosquitto)]: proto:SOCK_STREAM, port:1883
[   68.505343] firmadyne: sys_socket[PID: 3284 (mosquitto)]: family:2, type:2, protocol:6
[   68.505495] firmadyne: sys_setsockopt[PID: 3284 (mosquitto)]: fd:6, level:65535, optname:4
[   68.505639] firmadyne: sys_setsockopt[PID: 3284 (mosquitto)]: fd:6, level:41, optname:26
[   68.505792] firmadyne: inet_bind[PID: 3284 (mosquitto)]: proto:SOCK_STREAM, port:8883
[   68.540090] firmadyne: sys_socket[PID: 3294 (ip6tables)]: family:1, type:2, protocol:0
[   68.540474] firmadyne: sys_socket[PID: 3294 (ip6tables)]: family:10, type:3, protocol:255
[   68.632039] firmadyne: sys_socket[PID: 3298 (iptables)]: family:1, type:2, protocol:0
[   68.632494] firmadyne: sys_socket[PID: 3298 (iptables)]: family:2, type:3, protocol:255
[   68.659738] firmadyne: sys_socket[PID: 3300 (iptables)]: family:1, type:2, protocol:0
[   68.660192] firmadyne: sys_socket[PID: 3300 (iptables)]: family:2, type:3, protocol:255
[   68.684841] firmadyne: sys_socket[PID: 3301 (iptables)]: family:1, type:2, protocol:0
[   68.685260] firmadyne: sys_socket[PID: 3301 (iptables)]: family:2, type:3, protocol:255
[   68.686588] firmadyne: sys_socket[PID: 3301 (iptables)]: family:2, type:3, protocol:255
[   68.720719] firmadyne: sys_socket[PID: 3307 (iptables)]: family:1, type:2, protocol:0
[   68.721162] firmadyne: sys_socket[PID: 3307 (iptables)]: family:2, type:3, protocol:255
[   68.722455] firmadyne: sys_socket[PID: 3307 (iptables)]: family:2, type:3, protocol:255
[   68.746000] firmadyne: sys_socket[PID: 3313 (iptables)]: family:1, type:2, protocol:0
[   68.746696] firmadyne: sys_socket[PID: 3313 (iptables)]: family:2, type:3, protocol:255
[   68.747864] firmadyne: sys_socket[PID: 3313 (iptables)]: family:2, type:3, protocol:255
[   68.788497] firmadyne: sys_socket[PID: 3319 (ip6tables)]: family:1, type:2, protocol:0
[   68.788908] firmadyne: sys_socket[PID: 3319 (ip6tables)]: family:10, type:3, protocol:255
[   68.817047] firmadyne: sys_socket[PID: 3321 (ip6tables)]: family:1, type:2, protocol:0
[   68.817430] firmadyne: sys_socket[PID: 3321 (ip6tables)]: family:10, type:3, protocol:255
[   68.824060] firmadyne: sys_socket[PID: 3148 (fw3)]: family:16, type:524291, protocol:0
[   70.624908] firmadyne: sys_socket[PID: 3323 (iptables)]: family:1, type:2, protocol:0
[   70.625382] firmadyne: sys_socket[PID: 3323 (iptables)]: family:2, type:3, protocol:255
[   70.651227] firmadyne: sys_socket[PID: 3324 (iptables)]: family:1, type:2, protocol:0
[   70.651678] firmadyne: sys_socket[PID: 3324 (iptables)]: family:2, type:3, protocol:255
[   70.790438] firmadyne: sys_socket[PID: 3326 (ubus)]: family:1, type:2, protocol:0
[   73.182882] firmadyne: sys_socket[PID: 3007 (ntpd)]: family:2, type:524417, protocol:0
[   73.183140] firmadyne: inet_bind[PID: 3007 (ntpd)]: proto:SOCK_DGRAM, port:0
[   73.194744] firmadyne: sys_socket[PID: 3008 (ntpd)]: family:2, type:524417, protocol:0
[   73.194993] firmadyne: inet_bind[PID: 3008 (ntpd)]: proto:SOCK_DGRAM, port:0
[   73.565265] firmadyne: sys_socket[PID: 3327 (mosquitto)]: family:2, type:2, protocol:0
[   73.585030] firmadyne: sys_socket[PID: 3327 (mosquitto)]: family:1, type:524290, protocol:0
[   73.592612] firmadyne: sys_socket[PID: 3327 (mosquitto)]: family:1, type:524289, protocol:0
[   73.597279] firmadyne: sys_socket[PID: 3327 (mosquitto)]: family:2, type:2, protocol:6
[   73.597532] firmadyne: sys_setsockopt[PID: 3327 (mosquitto)]: fd:5, level:65535, optname:4
[   73.597705] firmadyne: sys_setsockopt[PID: 3327 (mosquitto)]: fd:5, level:41, optname:26
[   73.597988] firmadyne: inet_bind[PID: 3327 (mosquitto)]: proto:SOCK_STREAM, port:1883
[   73.598588] firmadyne: sys_socket[PID: 3327 (mosquitto)]: family:2, type:2, protocol:6
[   73.598774] firmadyne: sys_setsockopt[PID: 3327 (mosquitto)]: fd:6, level:65535, optname:4
[   73.598942] firmadyne: sys_setsockopt[PID: 3327 (mosquitto)]: fd:6, level:41, optname:26
[   73.599098] firmadyne: inet_bind[PID: 3327 (mosquitto)]: proto:SOCK_STREAM, port:8883
[   75.694659] firmadyne: sys_socket[PID: 3328 (iptables)]: family:1, type:2, protocol:0
[   75.695176] firmadyne: sys_socket[PID: 3328 (iptables)]: family:2, type:3, protocol:255
[   75.721762] firmadyne: sys_socket[PID: 3329 (iptables)]: family:1, type:2, protocol:0
[   75.722181] firmadyne: sys_socket[PID: 3329 (iptables)]: family:2, type:3, protocol:255
[   78.645058] firmadyne: sys_socket[PID: 3331 (mosquitto)]: family:2, type:2, protocol:0
[   78.664977] firmadyne: sys_socket[PID: 3331 (mosquitto)]: family:1, type:524290, protocol:0
[   78.672700] firmadyne: sys_socket[PID: 3331 (mosquitto)]: family:1, type:524289, protocol:0
[   78.677384] firmadyne: sys_socket[PID: 3331 (mosquitto)]: family:2, type:2, protocol:6
[   78.677630] firmadyne: sys_setsockopt[PID: 3331 (mosquitto)]: fd:5, level:65535, optname:4
[   78.677812] firmadyne: sys_setsockopt[PID: 3331 (mosquitto)]: fd:5, level:41, optname:26
[   78.678079] firmadyne: inet_bind[PID: 3331 (mosquitto)]: proto:SOCK_STREAM, port:1883
[   78.678791] firmadyne: sys_socket[PID: 3331 (mosquitto)]: family:2, type:2, protocol:6
[   78.679003] firmadyne: sys_setsockopt[PID: 3331 (mosquitto)]: fd:6, level:65535, optname:4
[   78.679166] firmadyne: sys_setsockopt[PID: 3331 (mosquitto)]: fd:6, level:41, optname:26
[   78.679319] firmadyne: inet_bind[PID: 3331 (mosquitto)]: proto:SOCK_STREAM, port:8883
[   80.770484] firmadyne: sys_socket[PID: 3332 (iptables)]: family:1, type:2, protocol:0
[   80.770962] firmadyne: sys_socket[PID: 3332 (iptables)]: family:2, type:3, protocol:255
[   80.797877] firmadyne: sys_socket[PID: 3333 (iptables)]: family:1, type:2, protocol:0
[   80.798632] firmadyne: sys_socket[PID: 3333 (iptables)]: family:2, type:3, protocol:255
[LT500D-EMU] network diagnostic begin
[LT500D-EMU] ifconfig eth1
[   80.824028] firmadyne: sys_socket[PID: 3334 (ifconfig)]: family:2, type:1, protocol:0
eth1      Link encap:Ethernet  HWaddr 52:54:00:12:34:57  
          inet addr:10.0.2.15  Bcast:10.0.2.255  Mask:255.255.255.0
          inet6 addr: fe80::5054:ff:fe12:3457/64 Scope:Link
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:177 errors:0 dropped:0 overruns:0 frame:0
          TX packets:109 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000 
          RX bytes:10620 (10.3 KiB)  TX bytes:6540 (6.3 KiB)

[LT500D-EMU] route -n
Kernel IP routing table
Destination     Gateway         Genmask         Flags Metric Ref    Use Iface
10.0.2.0        0.0.0.0         255.255.255.0   U     0      0        0 eth1
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
[   80.895084] firmadyne: sys_socket[PID: 3337 (iptables)]: family:1, type:2, protocol:0
[   80.895504] firmadyne: sys_socket[PID: 3337 (iptables)]: family:2, type:3, protocol:255
Chain INPUT (policy DROP 0 packets, 0 bytes)
num   pkts bytes target     prot opt in     out     source               destination         
1        0     0 ACCEPT     tcp  --  eth1   *       0.0.0.0/0            0.0.0.0/0            tcp dpt:443
2       68  2992 ACCEPT     tcp  --  eth1   *       0.0.0.0/0            0.0.0.0/0            tcp dpt:80
[LT500D-EMU] network diagnostic end
[   83.202962] firmadyne: sys_socket[PID: 3007 (ntpd)]: family:2, type:524417, protocol:0
[   83.203367] firmadyne: inet_bind[PID: 3007 (ntpd)]: proto:SOCK_DGRAM, port:0
[   83.214727] firmadyne: sys_socket[PID: 3008 (ntpd)]: family:2, type:524417, protocol:0
[   83.214994] firmadyne: inet_bind[PID: 3008 (ntpd)]: proto:SOCK_DGRAM, port:0
[   85.950029] firmadyne: sys_socket[PID: 3339 (iptables)]: family:1, type:2, protocol:0
[   85.951264] firmadyne: sys_socket[PID: 3339 (iptables)]: family:2, type:3, protocol:255
[   85.978134] firmadyne: sys_socket[PID: 3340 (iptables)]: family:1, type:2, protocol:0
[   85.978720] firmadyne: sys_socket[PID: 3340 (iptables)]: family:2, type:3, protocol:255
[   91.025949] firmadyne: sys_socket[PID: 3342 (iptables)]: family:1, type:2, protocol:0
[   91.026774] firmadyne: sys_socket[PID: 3342 (iptables)]: family:2, type:3, protocol:255
[   91.053368] firmadyne: sys_socket[PID: 3343 (iptables)]: family:1, type:2, protocol:0
[   91.053810] firmadyne: sys_socket[PID: 3343 (iptables)]: family:2, type:3, protocol:255
[   93.223382] firmadyne: sys_socket[PID: 3007 (ntpd)]: family:2, type:524417, protocol:0
[   93.223644] firmadyne: inet_bind[PID: 3007 (ntpd)]: proto:SOCK_DGRAM, port:0
[   93.234609] firmadyne: sys_socket[PID: 3008 (ntpd)]: family:2, type:524417, protocol:0
[   93.234865] firmadyne: inet_bind[PID: 3008 (ntpd)]: proto:SOCK_DGRAM, port:0
[   96.093399] firmadyne: sys_socket[PID: 3345 (iptables)]: family:1, type:2, protocol:0
[   96.093918] firmadyne: sys_socket[PID: 3345 (iptables)]: family:2, type:3, protocol:255
[   96.121002] firmadyne: sys_socket[PID: 3346 (iptables)]: family:1, type:2, protocol:0
[   96.121497] firmadyne: sys_socket[PID: 3346 (iptables)]: family:2, type:3, protocol:255
[  101.170020] firmadyne: sys_socket[PID: 3348 (iptables)]: family:1, type:2, protocol:0
[  101.170668] firmadyne: sys_socket[PID: 3348 (iptables)]: family:2, type:3, protocol:255
[  101.197087] firmadyne: sys_socket[PID: 3349 (iptables)]: family:1, type:2, protocol:0
[  101.197559] firmadyne: sys_socket[PID: 3349 (iptables)]: family:2, type:3, protocol:255
[LT500D-EMU] network diagnostic begin
[LT500D-EMU] ifconfig eth1
[  101.219811] firmadyne: sys_socket[PID: 3350 (ifconfig)]: family:2, type:1, protocol:0
eth1      Link encap:Ethernet  HWaddr 52:54:00:12:34:57  
          inet addr:10.0.2.15  Bcast:10.0.2.255  Mask:255.255.255.0
          inet6 addr: fe80::5054:ff:fe12:3457/64 Scope:Link
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:243 errors:0 dropped:0 overruns:0 frame:0
          TX packets:109 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000 
          RX bytes:14580 (14.2 KiB)  TX bytes:6540 (6.3 KiB)

[LT500D-EMU] route -n
Kernel IP routing table
Destination     Gateway         Genmask         Flags Metric Ref    Use Iface
10.0.2.0        0.0.0.0         255.255.255.0   U     0      0        0 eth1
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
[  101.288823] firmadyne: sys_socket[PID: 3353 (iptables)]: family:1, type:2, protocol:0
[  101.289721] firmadyne: sys_socket[PID: 3353 (iptables)]: family:2, type:3, protocol:255
Chain INPUT (policy DROP 0 packets, 0 bytes)
num   pkts bytes target     prot opt in     out     source               destination         
1        0     0 ACCEPT     tcp  --  eth1   *       0.0.0.0/0            0.0.0.0/0            tcp dpt:443
2      135  5940 ACCEPT     tcp  --  eth1   *       0.0.0.0/0            0.0.0.0/0            tcp dpt:80
[LT500D-EMU] network diagnostic end
[  103.242728] firmadyne: sys_socket[PID: 3007 (ntpd)]: family:2, type:524417, protocol:0
[  103.243061] firmadyne: inet_bind[PID: 3007 (ntpd)]: proto:SOCK_DGRAM, port:0
[  103.254662] firmadyne: sys_socket[PID: 3008 (ntpd)]: family:2, type:524417, protocol:0
[  103.254945] firmadyne: inet_bind[PID: 3008 (ntpd)]: proto:SOCK_DGRAM, port:0
[  106.341425] firmadyne: sys_socket[PID: 3355 (iptables)]: family:1, type:2, protocol:0
[  106.341989] firmadyne: sys_socket[PID: 3355 (iptables)]: family:2, type:3, protocol:255
[  106.368530] firmadyne: sys_socket[PID: 3356 (iptables)]: family:1, type:2, protocol:0
[  106.369050] firmadyne: sys_socket[PID: 3356 (iptables)]: family:2, type:3, protocol:255
[  111.418499] firmadyne: sys_socket[PID: 3358 (iptables)]: family:1, type:2, protocol:0
[  111.419075] firmadyne: sys_socket[PID: 3358 (iptables)]: family:2, type:3, protocol:255
[  111.445694] firmadyne: sys_socket[PID: 3359 (iptables)]: family:1, type:2, protocol:0
[  111.446180] firmadyne: sys_socket[PID: 3359 (iptables)]: family:2, type:3, protocol:255
[  113.259318] firmadyne: sys_socket[PID: 3007 (ntpd)]: family:2, type:524417, protocol:0
[  113.259622] firmadyne: inet_bind[PID: 3007 (ntpd)]: proto:SOCK_DGRAM, port:0
[  113.274694] firmadyne: sys_socket[PID: 3008 (ntpd)]: family:2, type:524417, protocol:0
[  113.274937] firmadyne: inet_bind[PID: 3008 (ntpd)]: proto:SOCK_DGRAM, port:0
[  116.493438] firmadyne: sys_socket[PID: 3361 (iptables)]: family:1, type:2, protocol:0
[  116.493946] firmadyne: sys_socket[PID: 3361 (iptables)]: family:2, type:3, protocol:255
[  116.520465] firmadyne: sys_socket[PID: 3362 (iptables)]: family:1, type:2, protocol:0
[  116.520909] firmadyne: sys_socket[PID: 3362 (iptables)]: family:2, type:3, protocol:255
[  121.569283] firmadyne: sys_socket[PID: 3364 (iptables)]: family:1, type:2, protocol:0
[  121.569731] firmadyne: sys_socket[PID: 3364 (iptables)]: family:2, type:3, protocol:255
[  121.596117] firmadyne: sys_socket[PID: 3365 (iptables)]: family:1, type:2, protocol:0
[  121.596556] firmadyne: sys_socket[PID: 3365 (iptables)]: family:2, type:3, protocol:255
[LT500D-EMU] network diagnostic begin
[LT500D-EMU] ifconfig eth1
[  121.617769] firmadyne: sys_socket[PID: 3366 (ifconfig)]: family:2, type:1, protocol:0
eth1      Link encap:Ethernet  HWaddr 52:54:00:12:34:57  
          inet addr:10.0.2.15  Bcast:10.0.2.255  Mask:255.255.255.0
          inet6 addr: fe80::5054:ff:fe12:3457/64 Scope:Link
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:308 errors:0 dropped:0 overruns:0 frame:0
          TX packets:109 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000 
          RX bytes:18480 (18.0 KiB)  TX bytes:6540 (6.3 KiB)

[LT500D-EMU] route -n
Kernel IP routing table
Destination     Gateway         Genmask         Flags Metric Ref    Use Iface
10.0.2.0        0.0.0.0         255.255.255.0   U     0      0        0 eth1
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
[  121.671830] firmadyne: sys_socket[PID: 3369 (iptables)]: family:1, type:2, protocol:0
[  121.672252] firmadyne: sys_socket[PID: 3369 (iptables)]: family:2, type:3, protocol:255
Chain INPUT (policy DROP 0 packets, 0 bytes)
num   pkts bytes target     prot opt in     out     source               destination         
1        0     0 ACCEPT     tcp  --  eth1   *       0.0.0.0/0            0.0.0.0/0            tcp dpt:443
2      199  8756 ACCEPT     tcp  --  eth1   *       0.0.0.0/0            0.0.0.0/0            tcp dpt:80
[LT500D-EMU] network diagnostic end
```
