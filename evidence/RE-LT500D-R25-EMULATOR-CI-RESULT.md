# RE-LT500D R25 emulator CI result

Commit: f9688d31ce0fb8f945759042d88337441a9e8e80
Firmware download/verify: success
Image build: success
QEMU/HTTP gate: failure
Run: https://github.com/diablomike20/Router-Emulator/actions/runs/35432156449


## Serial tail
```text
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:176 errors:0 dropped:0 overruns:0 frame:0
          TX packets:103 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000 
          RX bytes:10560 (10.3 KiB)  TX bytes:6180 (6.0 KiB)

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
[   78.543653] firmadyne: sys_socket[PID: 3289 (iptables)]: family:1, type:2, protocol:0
[   78.544100] firmadyne: sys_socket[PID: 3289 (iptables)]: family:2, type:3, protocol:255
Chain INPUT (policy DROP 49 packets, 2156 bytes)
num   pkts bytes target     prot opt in     out     source               destination         
[LT500D-EMU] OUTPUT
[   78.568818] firmadyne: sys_socket[PID: 3290 (iptables)]: family:1, type:2, protocol:0
[   78.569257] firmadyne: sys_socket[PID: 3290 (iptables)]: family:2, type:3, protocol:255
Chain OUTPUT (policy DROP 8 packets, 520 bytes)
num   pkts bytes target     prot opt in     out     source               destination         
[LT500D-EMU] rp_filter
/proc/sys/net/ipv4/conf/all/rp_filter=0
/proc/sys/net/ipv4/conf/br-lan/rp_filter=0
/proc/sys/net/ipv4/conf/eth1/rp_filter=0
[LT500D-EMU] network diagnostic end
[   79.751953] firmadyne: sys_socket[PID: 2912 (ntpd)]: family:2, type:524417, protocol:0
[   79.752238] firmadyne: inet_bind[PID: 2912 (ntpd)]: proto:SOCK_DGRAM, port:0
[   79.763861] firmadyne: sys_socket[PID: 2911 (ntpd)]: family:2, type:524417, protocol:0
[   79.764112] firmadyne: inet_bind[PID: 2911 (ntpd)]: proto:SOCK_DGRAM, port:0
[   83.645470] firmadyne: sys_socket[PID: 3295 (ifconfig)]: family:2, type:1, protocol:0
[   83.646489] firmadyne: __inet_insert_ifa[PID: 3295 (ifconfig)]: device:eth1 ifa:0x00000000
[   83.674670] firmadyne: sys_socket[PID: 3296 (brctl)]: family:2, type:2, protocol:0
[   83.679720] firmadyne: sys_socket[PID: 3296 (brctl)]: family:1, type:524289, protocol:0
[   83.680559] firmadyne: sys_socket[PID: 3296 (brctl)]: family:1, type:524289, protocol:0
[   83.680791] firmadyne: sys_socket[PID: 3296 (brctl)]: family:1, type:524289, protocol:0
[   88.717604] firmadyne: sys_socket[PID: 3299 (ifconfig)]: family:2, type:1, protocol:0
[   88.718630] firmadyne: __inet_insert_ifa[PID: 3299 (ifconfig)]: device:eth1 ifa:0x00000000
[   88.745763] firmadyne: sys_socket[PID: 3300 (brctl)]: family:2, type:2, protocol:0
[   88.746694] firmadyne: sys_socket[PID: 3300 (brctl)]: family:1, type:524289, protocol:0
[   88.747523] firmadyne: sys_socket[PID: 3300 (brctl)]: family:1, type:524289, protocol:0
[   88.751740] firmadyne: sys_socket[PID: 3300 (brctl)]: family:1, type:524289, protocol:0
[   89.772098] firmadyne: sys_socket[PID: 2912 (ntpd)]: family:2, type:524417, protocol:0
[   89.772363] firmadyne: inet_bind[PID: 2912 (ntpd)]: proto:SOCK_DGRAM, port:0
[   89.783886] firmadyne: sys_socket[PID: 2911 (ntpd)]: family:2, type:524417, protocol:0
[   89.784131] firmadyne: inet_bind[PID: 2911 (ntpd)]: proto:SOCK_DGRAM, port:0
[   93.785850] firmadyne: sys_socket[PID: 3303 (ifconfig)]: family:2, type:1, protocol:0
[   93.786945] firmadyne: __inet_insert_ifa[PID: 3303 (ifconfig)]: device:eth1 ifa:0x00000000
[   93.815295] firmadyne: sys_socket[PID: 3304 (brctl)]: family:2, type:2, protocol:0
[   93.819989] firmadyne: sys_socket[PID: 3304 (brctl)]: family:1, type:524289, protocol:0
[   93.820852] firmadyne: sys_socket[PID: 3304 (brctl)]: family:1, type:524289, protocol:0
[   93.821123] firmadyne: sys_socket[PID: 3304 (brctl)]: family:1, type:524289, protocol:0
[   98.857770] firmadyne: sys_socket[PID: 3307 (ifconfig)]: family:2, type:1, protocol:0
[   98.858844] firmadyne: __inet_insert_ifa[PID: 3307 (ifconfig)]: device:eth1 ifa:0x00000000
[   98.886402] firmadyne: sys_socket[PID: 3308 (brctl)]: family:2, type:2, protocol:0
[   98.887327] firmadyne: sys_socket[PID: 3308 (brctl)]: family:1, type:524289, protocol:0
[   98.892372] firmadyne: sys_socket[PID: 3308 (brctl)]: family:1, type:524289, protocol:0
[   98.892675] firmadyne: sys_socket[PID: 3308 (brctl)]: family:1, type:524289, protocol:0
[LT500D-EMU] network diagnostic begin
[LT500D-EMU] runtime UCI LAN IP: 192.168.10.2
[LT500D-EMU] bridge
[   98.933159] firmadyne: sys_socket[PID: 3311 (brctl)]: family:2, type:2, protocol:0
bridge name	bridge id		STP enabled	interfaces
[   98.934277] firmadyne: sys_socket[PID: 3311 (brctl)]: family:1, type:524289, protocol:0
[   98.935100] firmadyne: sys_socket[PID: 3311 (brctl)]: family:1, type:524289, protocol:0
br-lan		7fff.525400123456	no		eth0.1
[   98.936020] firmadyne: sys_socket[PID: 3311 (brctl)]: family:1, type:524289, protocol:0
							eth1
brctl: invalid argument 'br-lan' to 'brctl'
[LT500D-EMU] ifconfig br-lan
[   98.967067] firmadyne: sys_socket[PID: 3312 (ifconfig)]: family:2, type:1, protocol:0
br-lan    Link encap:Ethernet  HWaddr 52:54:00:12:34:56  
          inet addr:192.168.10.2  Bcast:192.168.10.255  Mask:255.255.255.0
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:241 errors:0 dropped:0 overruns:0 frame:0
          TX packets:103 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:0 
          RX bytes:11086 (10.8 KiB)  TX bytes:4326 (4.2 KiB)

[LT500D-EMU] ifconfig eth1
[   98.988498] firmadyne: sys_socket[PID: 3313 (ifconfig)]: family:2, type:1, protocol:0
eth1      Link encap:Ethernet  HWaddr 52:54:00:12:34:57  
          inet6 addr: fe80::5054:ff:fe12:3457/64 Scope:Link
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:241 errors:0 dropped:0 overruns:0 frame:0
          TX packets:103 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000 
          RX bytes:14460 (14.1 KiB)  TX bytes:6180 (6.0 KiB)

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
[   99.057989] firmadyne: sys_socket[PID: 3316 (iptables)]: family:1, type:2, protocol:0
[   99.058447] firmadyne: sys_socket[PID: 3316 (iptables)]: family:2, type:3, protocol:255
Chain INPUT (policy DROP 114 packets, 5016 bytes)
num   pkts bytes target     prot opt in     out     source               destination         
[LT500D-EMU] OUTPUT
[   99.082831] firmadyne: sys_socket[PID: 3317 (iptables)]: family:1, type:2, protocol:0
[   99.083256] firmadyne: sys_socket[PID: 3317 (iptables)]: family:2, type:3, protocol:255
Chain OUTPUT (policy DROP 24 packets, 1560 bytes)
num   pkts bytes target     prot opt in     out     source               destination         
[LT500D-EMU] rp_filter
/proc/sys/net/ipv4/conf/all/rp_filter=0
/proc/sys/net/ipv4/conf/br-lan/rp_filter=0
/proc/sys/net/ipv4/conf/eth1/rp_filter=0
[LT500D-EMU] network diagnostic end
[   99.791976] firmadyne: sys_socket[PID: 2912 (ntpd)]: family:2, type:524417, protocol:0
[   99.792260] firmadyne: inet_bind[PID: 2912 (ntpd)]: proto:SOCK_DGRAM, port:0
[   99.803891] firmadyne: sys_socket[PID: 2911 (ntpd)]: family:2, type:524417, protocol:0
[   99.804126] firmadyne: inet_bind[PID: 2911 (ntpd)]: proto:SOCK_DGRAM, port:0
[  104.165776] firmadyne: sys_socket[PID: 3322 (ifconfig)]: family:2, type:1, protocol:0
[  104.166827] firmadyne: __inet_insert_ifa[PID: 3322 (ifconfig)]: device:eth1 ifa:0x00000000
[  104.194889] firmadyne: sys_socket[PID: 3323 (brctl)]: family:2, type:2, protocol:0
[  104.196150] firmadyne: sys_socket[PID: 3323 (brctl)]: family:1, type:524289, protocol:0
[  104.196970] firmadyne: sys_socket[PID: 3323 (brctl)]: family:1, type:524289, protocol:0
[  104.197213] firmadyne: sys_socket[PID: 3323 (brctl)]: family:1, type:524289, protocol:0
[  109.238172] firmadyne: sys_socket[PID: 3326 (ifconfig)]: family:2, type:1, protocol:0
[  109.239244] firmadyne: __inet_insert_ifa[PID: 3326 (ifconfig)]: device:eth1 ifa:0x00000000
[  109.267379] firmadyne: sys_socket[PID: 3327 (brctl)]: family:2, type:2, protocol:0
[  109.271921] firmadyne: sys_socket[PID: 3327 (brctl)]: family:1, type:524289, protocol:0
[  109.272763] firmadyne: sys_socket[PID: 3327 (brctl)]: family:1, type:524289, protocol:0
[  109.272993] firmadyne: sys_socket[PID: 3327 (brctl)]: family:1, type:524289, protocol:0
[  109.811949] firmadyne: sys_socket[PID: 2912 (ntpd)]: family:2, type:524417, protocol:0
[  109.812243] firmadyne: inet_bind[PID: 2912 (ntpd)]: proto:SOCK_DGRAM, port:0
[  109.823875] firmadyne: sys_socket[PID: 2911 (ntpd)]: family:2, type:524417, protocol:0
[  109.824093] firmadyne: inet_bind[PID: 2911 (ntpd)]: proto:SOCK_DGRAM, port:0
[  114.309772] firmadyne: sys_socket[PID: 3330 (ifconfig)]: family:2, type:1, protocol:0
[  114.310778] firmadyne: __inet_insert_ifa[PID: 3330 (ifconfig)]: device:eth1 ifa:0x00000000
[  114.337942] firmadyne: sys_socket[PID: 3331 (brctl)]: family:2, type:2, protocol:0
[  114.338849] firmadyne: sys_socket[PID: 3331 (brctl)]: family:1, type:524289, protocol:0
[  114.343767] firmadyne: sys_socket[PID: 3331 (brctl)]: family:1, type:524289, protocol:0
[  114.344061] firmadyne: sys_socket[PID: 3331 (brctl)]: family:1, type:524289, protocol:0
[  119.385734] firmadyne: sys_socket[PID: 3334 (ifconfig)]: family:2, type:1, protocol:0
[  119.386745] firmadyne: __inet_insert_ifa[PID: 3334 (ifconfig)]: device:eth1 ifa:0x00000000
[  119.414288] firmadyne: sys_socket[PID: 3335 (brctl)]: family:2, type:2, protocol:0
[  119.415147] firmadyne: sys_socket[PID: 3335 (brctl)]: family:1, type:524289, protocol:0
[  119.420031] firmadyne: sys_socket[PID: 3335 (brctl)]: family:1, type:524289, protocol:0
[  119.420315] firmadyne: sys_socket[PID: 3335 (brctl)]: family:1, type:524289, protocol:0
[LT500D-EMU] network diagnostic begin
[LT500D-EMU] runtime UCI LAN IP: 192.168.10.2
[LT500D-EMU] bridge
[  119.460787] firmadyne: sys_socket[PID: 3338 (brctl)]: family:2, type:2, protocol:0
bridge name	bridge id		STP enabled	interfaces
[  119.462855] firmadyne: sys_socket[PID: 3338 (brctl)]: family:1, type:524289, protocol:0
[  119.464050] firmadyne: sys_socket[PID: 3338 (brctl)]: family:1, type:524289, protocol:0
br-lan		7fff.525400123456	no		eth0.1
[  119.464563] firmadyne: sys_socket[PID: 3338 (brctl)]: family:1, type:524289, protocol:0
							eth1
brctl: invalid argument 'br-lan' to 'brctl'
[LT500D-EMU] ifconfig br-lan
[  119.482053] firmadyne: sys_socket[PID: 3339 (ifconfig)]: family:2, type:1, protocol:0
br-lan    Link encap:Ethernet  HWaddr 52:54:00:12:34:56  
          inet addr:192.168.10.2  Bcast:192.168.10.255  Mask:255.255.255.0
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:308 errors:0 dropped:0 overruns:0 frame:0
          TX packets:103 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:0 
          RX bytes:14168 (13.8 KiB)  TX bytes:4326 (4.2 KiB)

[LT500D-EMU] ifconfig eth1
[  119.502901] firmadyne: sys_socket[PID: 3340 (ifconfig)]: family:2, type:1, protocol:0
eth1      Link encap:Ethernet  HWaddr 52:54:00:12:34:57  
          inet6 addr: fe80::5054:ff:fe12:3457/64 Scope:Link
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:308 errors:0 dropped:0 overruns:0 frame:0
          TX packets:103 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000 
          RX bytes:18480 (18.0 KiB)  TX bytes:6180 (6.0 KiB)

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
[  119.558053] firmadyne: sys_socket[PID: 3343 (iptables)]: family:1, type:2, protocol:0
[  119.558485] firmadyne: sys_socket[PID: 3343 (iptables)]: family:2, type:3, protocol:255
Chain INPUT (policy DROP 181 packets, 7964 bytes)
num   pkts bytes target     prot opt in     out     source               destination         
[LT500D-EMU] OUTPUT
[  119.581551] firmadyne: sys_socket[PID: 3344 (iptables)]: family:1, type:2, protocol:0
[  119.582036] firmadyne: sys_socket[PID: 3344 (iptables)]: family:2, type:3, protocol:255
Chain OUTPUT (policy DROP 40 packets, 2600 bytes)
num   pkts bytes target     prot opt in     out     source               destination         
[LT500D-EMU] rp_filter
/proc/sys/net/ipv4/conf/all/rp_filter=0
/proc/sys/net/ipv4/conf/br-lan/rp_filter=0
/proc/sys/net/ipv4/conf/eth1/rp_filter=0
[LT500D-EMU] network diagnostic end
[  119.831957] firmadyne: sys_socket[PID: 2912 (ntpd)]: family:2, type:524417, protocol:0
[  119.832251] firmadyne: inet_bind[PID: 2912 (ntpd)]: proto:SOCK_DGRAM, port:0
[  119.843849] firmadyne: sys_socket[PID: 2911 (ntpd)]: family:2, type:524417, protocol:0
[  119.844059] firmadyne: inet_bind[PID: 2911 (ntpd)]: proto:SOCK_DGRAM, port:0
```
