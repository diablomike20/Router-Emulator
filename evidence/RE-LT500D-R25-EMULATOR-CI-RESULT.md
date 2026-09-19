# RE-LT500D R25 emulator CI result

Commit: 6f17f8d0096412b2b2365ddf84426195c34f1212
Firmware download/verify: success
Image build: success
QEMU/HTTP gate: success
Run: https://github.com/diablomike20/Router-Emulator/actions/runs/35429436723

## HTTP headers
```text
HTTP/1.1 200 OK
Connection: Keep-Alive
Keep-Alive: timeout=20
ETag: "a19-25c-6890597d"
Last-Modified: Mon, 04 Aug 2025 06:55:57 GMT
Date: Sat, 19 Sep 2026 07:30:18 GMT
Content-Type: text/html
Content-Length: 604

```

## HTTP body summary
```text
604 /tmp/lt500d-r25-http-body.bin
/tmp/lt500d-r25-http-body.bin: XML 1.0 document, ASCII text
```

## Serial tail
```text
[   48.373080] firmadyne: sys_setsockopt[PID: 2441 (umdns)]: fd:9, level:0, optname:36
[   48.373406] firmadyne: sys_setsockopt[PID: 2441 (umdns)]: fd:9, level:0, optname:35
[   48.390304] firmadyne: sys_socket[PID: 2441 (umdns)]: family:16, type:524291, protocol:0
[   48.391008] firmadyne: sys_socket[PID: 2441 (umdns)]: family:1, type:524289, protocol:0
[   48.391528] firmadyne: sys_socket[PID: 2441 (umdns)]: family:1, type:524289, protocol:0
[   48.391748] firmadyne: sys_setsockopt[PID: 2441 (umdns)]: fd:9, level:0, optname:36
[   48.392498] firmadyne: sys_setsockopt[PID: 2441 (umdns)]: fd:9, level:0, optname:35
[   48.400265] firmadyne: sys_socket[PID: 2503 (iptables)]: family:1, type:2, protocol:0
[   48.400607] firmadyne: sys_socket[PID: 2503 (iptables)]: family:2, type:3, protocol:255
[   48.478287] firmadyne: sys_socket[PID: 2507 (iptables)]: family:1, type:2, protocol:0
[   48.478703] firmadyne: sys_socket[PID: 2507 (iptables)]: family:2, type:3, protocol:255
[   48.562353] firmadyne: sys_socket[PID: 2510 (iptables)]: family:1, type:2, protocol:0
[   48.562780] firmadyne: sys_socket[PID: 2510 (iptables)]: family:2, type:3, protocol:255
[   48.573532] firmadyne: sys_socket[PID: 2510 (iptables)]: family:2, type:3, protocol:255
[   48.584547] firmadyne: sys_socket[PID: 2512 (softapd)]: family:1, type:524289, protocol:0
[   48.661122] firmadyne: sys_socket[PID: 2520 (iptables)]: family:1, type:2, protocol:0
[   48.661510] firmadyne: sys_socket[PID: 2520 (iptables)]: family:2, type:3, protocol:255
[   48.686313] firmadyne: sys_socket[PID: 2520 (iptables)]: family:2, type:3, protocol:255
[   48.744456] firmadyne: sys_socket[PID: 2530 (iptables)]: family:1, type:2, protocol:0
[   48.744875] firmadyne: sys_socket[PID: 2530 (iptables)]: family:2, type:3, protocol:255
[   48.754434] firmadyne: sys_socket[PID: 2530 (iptables)]: family:2, type:3, protocol:255
[   48.774532] firmadyne: sys_socket[PID: 2532 (ubus)]: family:1, type:2, protocol:0
[   48.845109] firmadyne: sys_socket[PID: 2539 (ip6tables)]: family:1, type:2, protocol:0
[   48.845473] firmadyne: sys_socket[PID: 2539 (ip6tables)]: family:10, type:3, protocol:255
[   48.947910] firmadyne: sys_socket[PID: 2544 (ip6tables)]: family:1, type:2, protocol:0
[   48.948267] firmadyne: sys_socket[PID: 2544 (ip6tables)]: family:10, type:3, protocol:255
[   48.962747] firmadyne: sys_socket[PID: 2126 (fw3)]: family:16, type:524291, protocol:0
[   49.134765] firmadyne: sys_socket[PID: 2554 (ubus)]: family:1, type:2, protocol:0
[   49.221902] firmadyne: sys_socket[PID: 2559 (ubus)]: family:1, type:2, protocol:0
[   49.761804] firmadyne: sys_socket[PID: 2441 (umdns)]: family:16, type:524291, protocol:0
[   49.909779] firmadyne: sys_socket[PID: 2596 (ubus)]: family:1, type:2, protocol:0
[   50.029283] firmadyne: sys_socket[PID: 2599 (pingcheck)]: family:1, type:524289, protocol:0
[   50.064458] firmadyne: sys_socket[PID: 2599 (pingcheck)]: family:1, type:2, protocol:0
[   50.208226] firmadyne: sys_socket[PID: 2606 (fw3)]: family:1, type:2, protocol:0
[   50.307299] firmadyne: sys_socket[PID: 2612 (ubus)]: family:1, type:2, protocol:0
[   50.437378] firmadyne: sys_socket[PID: 2618 (hyfibrd)]: family:1, type:524289, protocol:0
[   50.461910] firmadyne: sys_socket[PID: 2618 (hyfibrd)]: family:16, type:3, protocol:26
[   50.510296] firmadyne: sys_socket[PID: 2621 (ubus)]: family:1, type:2, protocol:0
[   50.669055] firmadyne: sys_socket[PID: 2634 (iptables)]: family:1, type:2, protocol:0
[   50.669324] firmadyne: sys_socket[PID: 2634 (iptables)]: family:2, type:3, protocol:255
[   50.678109] firmadyne: sys_socket[PID: 2634 (iptables)]: family:2, type:3, protocol:255
[   50.717817] firmadyne: sys_socket[PID: 2640 (iptables)]: family:1, type:2, protocol:0
[   50.718229] firmadyne: sys_socket[PID: 2640 (iptables)]: family:2, type:3, protocol:255
[   50.722565] firmadyne: sys_socket[PID: 2640 (iptables)]: family:2, type:3, protocol:255
[   50.749064] firmadyne: sys_socket[PID: 2647 (iptables)]: family:1, type:2, protocol:0
[   50.749425] firmadyne: sys_socket[PID: 2647 (iptables)]: family:2, type:3, protocol:255
[   50.759834] firmadyne: sys_setsockopt[PID: 2647 (iptables)]: fd:4, level:0, optname:64
[   50.760266] firmadyne: sys_setsockopt[PID: 2647 (iptables)]: fd:4, level:0, optname:65
[   50.800446] firmadyne: sys_socket[PID: 2650 (ip6tables)]: family:1, type:2, protocol:0
[   50.800780] firmadyne: sys_socket[PID: 2650 (ip6tables)]: family:10, type:3, protocol:255
[   50.807430] firmadyne: sys_setsockopt[PID: 2650 (ip6tables)]: fd:4, level:41, optname:64
[   50.807847] firmadyne: sys_setsockopt[PID: 2650 (ip6tables)]: fd:4, level:41, optname:65
[   50.938930] firmadyne: sys_socket[PID: 2661 (bdinfo)]: family:1, type:524289, protocol:0
[   51.124572] firmadyne: sys_socket[PID: 2674 (fw3)]: family:1, type:2, protocol:0
[   51.315825] firmadyne: sys_socket[PID: 2686 (ubus)]: family:1, type:2, protocol:0
[   51.621115] firmadyne: sys_socket[PID: 2700 (logger)]: family:1, type:524289, protocol:0
[   51.857145] firmadyne: sys_socket[PID: 2714 (mosquitto)]: family:2, type:2, protocol:0
[   51.923432] firmadyne: sys_socket[PID: 2714 (mosquitto)]: family:1, type:524290, protocol:0
[   51.951426] firmadyne: sys_socket[PID: 2714 (mosquitto)]: family:1, type:524289, protocol:0
[   51.961434] firmadyne: sys_socket[PID: 2714 (mosquitto)]: family:2, type:2, protocol:6
[   51.961751] firmadyne: sys_setsockopt[PID: 2714 (mosquitto)]: fd:5, level:65535, optname:4
[   51.961917] firmadyne: sys_setsockopt[PID: 2714 (mosquitto)]: fd:5, level:41, optname:26
[   51.962188] firmadyne: inet_bind[PID: 2714 (mosquitto)]: proto:SOCK_STREAM, port:1883
[   51.962460] firmadyne: sys_socket[PID: 2714 (mosquitto)]: family:2, type:2, protocol:6
[   51.962609] firmadyne: sys_setsockopt[PID: 2714 (mosquitto)]: fd:6, level:65535, optname:4
[   51.962758] firmadyne: sys_setsockopt[PID: 2714 (mosquitto)]: fd:6, level:41, optname:26
[   51.962896] firmadyne: inet_bind[PID: 2714 (mosquitto)]: proto:SOCK_STREAM, port:8883
[   52.050075] firmadyne: sys_socket[PID: 2726 (ubus)]: family:1, type:2, protocol:0
[   52.362914] firmadyne: sys_socket[PID: 2746 (ubus)]: family:1, type:2, protocol:0
[   52.419633] firmadyne: sys_socket[PID: 2747 (gcom)]: family:1, type:524289, protocol:0
[   53.751064] firmadyne: sys_socket[PID: 2819 (softapd)]: family:1, type:524289, protocol:0
[   53.797713] firmadyne: sys_socket[PID: 2826 (ifconfig)]: family:2, type:1, protocol:0
[   53.799410] firmadyne: __inet_insert_ifa[PID: 2826 (ifconfig)]: device:eth1 ifa:0x0f02000a
[   53.807002] S95done (2807): drop_caches: 3
[   53.813660] IPv6: ADDRCONF(NETDEV_UP): eth1: link is not ready
[   53.813785] 8021q: adding VLAN 0 to HW filter on device eth1
[   53.814819] e1000: eth1 NIC Link is Up 1000 Mbps Full Duplex, Flow Control: RX
[   53.815279] IPv6: ADDRCONF(NETDEV_CHANGE): eth1: link becomes ready
[   53.827339] firmadyne: __inet_insert_ifa[PID: 2826 (ifconfig)]: device:eth1 ifa:0x0f02000a
[   54.095052] firmadyne: sys_socket[PID: 2832 (iptables)]: family:1, type:2, protocol:0
[   54.095539] firmadyne: sys_socket[PID: 2832 (iptables)]: family:2, type:3, protocol:255
[   54.172973] firmadyne: sys_socket[PID: 2843 (ubus)]: family:1, type:2, protocol:0
[   54.202702] firmadyne: sys_socket[PID: 2841 (iptables)]: family:1, type:2, protocol:0
[   54.203064] firmadyne: sys_socket[PID: 2841 (iptables)]: family:2, type:3, protocol:255
[   54.223217] firmadyne: sys_setsockopt[PID: 2841 (iptables)]: fd:4, level:0, optname:64
[   54.223721] firmadyne: sys_setsockopt[PID: 2841 (iptables)]: fd:4, level:0, optname:65
[   54.282213] firmadyne: sys_socket[PID: 2851 (iptables)]: family:1, type:2, protocol:0
[   54.282616] firmadyne: sys_socket[PID: 2851 (iptables)]: family:2, type:3, protocol:255
[   54.380230] firmadyne: sys_socket[PID: 2852 (iptables)]: family:1, type:2, protocol:0
[   54.380648] firmadyne: sys_socket[PID: 2852 (iptables)]: family:2, type:3, protocol:255
[   54.405893] firmadyne: sys_setsockopt[PID: 2852 (iptables)]: fd:4, level:0, optname:64
[   54.406430] firmadyne: sys_setsockopt[PID: 2852 (iptables)]: fd:4, level:0, optname:65
[   54.493254] firmadyne: sys_socket[PID: 2857 (iptables)]: family:1, type:2, protocol:0
[   54.509929] firmadyne: sys_socket[PID: 2857 (iptables)]: family:2, type:3, protocol:255
[   54.572746] firmadyne: sys_socket[PID: 2864 (iptables)]: family:1, type:2, protocol:0
[   54.573173] firmadyne: sys_socket[PID: 2864 (iptables)]: family:2, type:3, protocol:255
[   54.592729] firmadyne: sys_setsockopt[PID: 2864 (iptables)]: fd:4, level:0, optname:64
[   54.593263] firmadyne: sys_setsockopt[PID: 2864 (iptables)]: fd:4, level:0, optname:65
[   54.613871] firmadyne: sys_socket[PID: 2865 (ubus)]: family:1, type:2, protocol:0
[   54.627883] firmadyne: sys_socket[PID: 2866 (fw3)]: family:1, type:2, protocol:0
[   54.738457] firmadyne: sys_socket[PID: 2867 (iptables)]: family:1, type:2, protocol:0
[   54.738837] firmadyne: sys_socket[PID: 2867 (iptables)]: family:2, type:3, protocol:255
[   54.758368] firmadyne: sys_socket[PID: 2868 (hcshd)]: family:2, type:1, protocol:0
[   54.758647] firmadyne: sys_setsockopt[PID: 2868 (hcshd)]: fd:3, level:65535, optname:4
[   54.758905] firmadyne: inet_bind[PID: 2868 (hcshd)]: proto:SOCK_DGRAM, port:56791
[   54.861005] firmadyne: inet_accept[PID: 2263 (uhttpd)]:
[   54.863124] firmadyne: inet_accept[PID: 2263 (uhttpd)]:
[   54.863324] firmadyne: inet_accept[PID: 2263 (uhttpd)]:
[   54.863448] firmadyne: inet_accept[PID: 2263 (uhttpd)]:
[   54.863574] firmadyne: inet_accept[PID: 2263 (uhttpd)]:
[   54.928980] firmadyne: sys_socket[PID: 2872 (iptables)]: family:1, type:2, protocol:0
[   54.929381] firmadyne: sys_socket[PID: 2872 (iptables)]: family:2, type:3, protocol:255
[   54.952090] firmadyne: sys_setsockopt[PID: 2872 (iptables)]: fd:4, level:0, optname:64
[   54.952594] firmadyne: sys_setsockopt[PID: 2872 (iptables)]: fd:4, level:0, optname:65
[   54.960440] firmadyne: sys_socket[PID: 2876 (ubus)]: family:1, type:2, protocol:0
[LT500D-EMU] network diagnostic begin
[LT500D-EMU] ifconfig eth1
[   55.039416] firmadyne: sys_socket[PID: 2879 (ifconfig)]: family:2, type:1, protocol:0
eth1      Link encap:Ethernet  HWaddr 52:54:00:12:34:57  
          inet addr:10.0.2.15  Bcast:10.0.2.255  Mask:255.255.255.0
          inet6 addr: fe80::5054:ff:fe12:3457/64 Scope:Link
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:123 errors:0 dropped:0 overruns:0 frame:0
          TX packets:115 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000 
          RX bytes:7804 (7.6 KiB)  TX bytes:7112 (6.9 KiB)

[LT500D-EMU] route -n
Kernel IP routing table
Destination     Gateway         Genmask         Flags Metric Ref    Use Iface
10.0.2.0        0.0.0.0         255.255.255.0   U     0      0        0 eth1
192.168.10.0    0.0.0.0         255.255.255.0   U     0      0        0 br-lan
[   55.173255] firmadyne: inet_accept[PID: 2263 (uhttpd)]:
[   55.173834] firmadyne: inet_accept[PID: 2263 (uhttpd)]:
[LT500D-EMU] listeners
[   55.193725] firmadyne: inet_accept[PID: 2263 (uhttpd)]:
[   55.193928] firmadyne: inet_accept[PID: 2263 (uhttpd)]:
[   55.279233] firmadyne: inet_accept[PID: 2263 (uhttpd)]:
[   55.279501] firmadyne: inet_accept[PID: 2263 (uhttpd)]:
[   55.348125] firmadyne: sys_socket[PID: 2887 (ubus)]: family:1, type:2, protocol:0
Active Internet connections (only servers)
Proto Recv-Q Send-Q Local Address           Foreign Address         State       
tcp        0      0 0.0.0.0:80              0.0.0.0:*               LISTEN      
tcp        0      0 0.0.0.0:53              0.0.0.0:*               LISTEN      
tcp        0      0 0.0.0.0:443             0.0.0.0:*               LISTEN      
tcp        0      0 :::80                   :::*                    LISTEN      
tcp        0      0 :::53                   :::*                    LISTEN      
tcp        0      0 :::443                  :::*                    LISTEN      
[LT500D-EMU] INPUT
[   55.561161] firmadyne: sys_socket[PID: 2898 (iptables)]: family:1, type:2, protocol:0
[   55.561537] firmadyne: sys_socket[PID: 2898 (iptables)]: family:2, type:3, protocol:255
Chain INPUT (policy DROP 0 packets, 0 bytes)
num   pkts bytes target     prot opt in     out     source               destination         
1        0     0 ACCEPT     tcp  --  eth1   *       0.0.0.0/0            0.0.0.0/0            tcp dpt:443
2       62  3257 ACCEPT     tcp  --  eth1   *       0.0.0.0/0            0.0.0.0/0            tcp dpt:80
[LT500D-EMU] OUTPUT
[   55.702476] firmadyne: sys_socket[PID: 2905 (iptables)]: family:1, type:2, protocol:0
[   55.702885] firmadyne: sys_socket[PID: 2905 (iptables)]: family:2, type:3, protocol:255
Chain OUTPUT (policy DROP 0 packets, 0 bytes)
num   pkts bytes target     prot opt in     out     source               destination         
1        0     0 ACCEPT     tcp  --  *      eth1    0.0.0.0/0            0.0.0.0/0            tcp spt:443
2       46  4779 ACCEPT     tcp  --  *      eth1    0.0.0.0/0            0.0.0.0/0            tcp spt:80
[   55.728782] firmadyne: sys_socket[PID: 2907 (ubus)]: family:1, type:2, protocol:0
[LT500D-EMU] rp_filter
/proc/sys/net/ipv4/conf/all/rp_filter=0
[   55.847261] firmadyne: sys_socket[PID: 2913 (ubus)]: family:1, type:2, protocol:0
/proc/sys/net/ipv4/conf/eth1/rp_filter=0
[LT500D-EMU] network diagnostic end
[   55.945553] firmadyne: sys_socket[PID: 2918 (hyctl)]: family:16, type:3, protocol:25
[   56.022567] firmadyne: sys_socket[PID: 2926 (ubus)]: family:1, type:2, protocol:0
[   56.201206] firmadyne: sys_socket[PID: 2935 (fw3)]: family:1, type:2, protocol:0
[   56.314361] firmadyne: sys_socket[PID: 2941 (ubus)]: family:1, type:2, protocol:0
[   56.531739] firmadyne: sys_socket[PID: 2957 (logger)]: family:1, type:524289, protocol:0
[   56.578365] firmadyne: sys_socket[PID: 2958 (ubus)]: family:1, type:2, protocol:0
[   56.721237] firmadyne: sys_socket[PID: 2964 (ntpd)]: family:2, type:524417, protocol:0
[   56.721534] firmadyne: inet_bind[PID: 2964 (ntpd)]: proto:SOCK_DGRAM, port:0
[   56.735573] firmadyne: sys_socket[PID: 2963 (ntpd)]: family:2, type:524417, protocol:0
[   56.735840] firmadyne: inet_bind[PID: 2963 (ntpd)]: proto:SOCK_DGRAM, port:0
[   56.778768] firmadyne: inet_accept[PID: 2263 (uhttpd)]:
[   56.779038] firmadyne: inet_accept[PID: 2263 (uhttpd)]:
[   56.779162] firmadyne: inet_accept[PID: 2263 (uhttpd)]:
[   56.779316] firmadyne: inet_accept[PID: 2263 (uhttpd)]:
[   56.779416] firmadyne: inet_accept[PID: 2263 (uhttpd)]:
[   57.098916] firmadyne: sys_socket[PID: 2991 (mosquitto)]: family:2, type:2, protocol:0
[   57.193002] firmadyne: sys_socket[PID: 2991 (mosquitto)]: family:1, type:524290, protocol:0
[   57.224643] firmadyne: sys_socket[PID: 3003 (logger)]: family:1, type:524289, protocol:0
[   57.234710] firmadyne: sys_socket[PID: 2991 (mosquitto)]: family:1, type:524289, protocol:0
[   57.255636] firmadyne: sys_socket[PID: 2991 (mosquitto)]: family:2, type:2, protocol:6
[   57.255930] firmadyne: sys_setsockopt[PID: 2991 (mosquitto)]: fd:5, level:65535, optname:4
[   57.256104] firmadyne: sys_setsockopt[PID: 2991 (mosquitto)]: fd:5, level:41, optname:26
[   57.256410] firmadyne: inet_bind[PID: 2991 (mosquitto)]: proto:SOCK_STREAM, port:1883
[   57.256824] firmadyne: sys_socket[PID: 2991 (mosquitto)]: family:2, type:2, protocol:6
[   57.256977] firmadyne: sys_setsockopt[PID: 2991 (mosquitto)]: fd:6, level:65535, optname:4
[   57.257118] firmadyne: sys_setsockopt[PID: 2991 (mosquitto)]: fd:6, level:41, optname:26
[   57.257249] firmadyne: inet_bind[PID: 2991 (mosquitto)]: proto:SOCK_STREAM, port:8883
[   57.278479] firmadyne: inet_accept[PID: 2263 (uhttpd)]:
[   57.278713] firmadyne: inet_accept[PID: 2263 (uhttpd)]:
[   57.409724] firmadyne: sys_socket[PID: 3014 (ubus)]: family:1, type:2, protocol:0
[   57.858079] firmadyne: sys_socket[PID: 3023 (gcom)]: family:1, type:524289, protocol:0
[   57.868247] firmadyne: sys_socket[PID: 3025 (logger)]: family:1, type:524289, protocol:0
[   58.522060] firmadyne: sys_socket[PID: 3056 (ubus)]: family:1, type:2, protocol:0
[   58.584636] firmadyne: sys_socket[PID: 3057 (crond)]: family:1, type:524289, protocol:0
[   58.795972] firmadyne: inet_accept[PID: 2263 (uhttpd)]:
[   58.798774] firmadyne: inet_accept[PID: 2263 (uhttpd)]:
[   58.799085] firmadyne: inet_accept[PID: 2263 (uhttpd)]:
[   58.799208] firmadyne: inet_accept[PID: 2263 (uhttpd)]:
[   58.799324] firmadyne: inet_accept[PID: 2263 (uhttpd)]:
[   58.918879] firmadyne: sys_socket[PID: 3071 (ubus)]: family:1, type:2, protocol:0
[   59.105922] firmadyne: sys_socket[PID: 3081 (ifconfig)]: family:2, type:1, protocol:0
[   59.176165] firmadyne: sys_socket[PID: 3089 (ubus)]: family:1, type:2, protocol:0
[   59.199017] firmadyne: sys_socket[PID: 3090 (ubus)]: family:1, type:2, protocol:0
[   59.275526] firmadyne: sys_socket[PID: 3092 (ifconfig)]: family:2, type:1, protocol:0
[   59.280787] firmadyne: inet_accept[PID: 2263 (uhttpd)]:
[   59.281039] firmadyne: inet_accept[PID: 2263 (uhttpd)]:
[   59.422837] firmadyne: sys_socket[PID: 3101 (ubus)]: family:1, type:2, protocol:0
[   59.520051] firmadyne: sys_socket[PID: 3105 (ubus)]: family:1, type:2, protocol:0
[   59.773061] firmadyne: sys_socket[PID: 3121 (ubus)]: family:1, type:2, protocol:0
[   59.991669] firmadyne: sys_socket[PID: 3134 (ubus)]: family:1, type:2, protocol:0
[   60.050675] firmadyne: sys_socket[PID: 3135 (crond)]: family:1, type:524289, protocol:0
[   60.196598] firmadyne: sys_socket[PID: 3144 (ubus)]: family:1, type:2, protocol:0
```
