# RE-LT500D R25 emulator CI result

Commit: 91f79ac1421cb9e71b676257609cf2f7de1167e8
Firmware download/verify: success
Image build: success
QEMU/HTTP gate: failure
Run: https://github.com/diablomike20/Router-Emulator/actions/runs/35432510502

## HTTP headers
```text
HTTP/1.1 200 OK
Connection: Keep-Alive
Keep-Alive: timeout=20
ETag: "a19-25c-6890597d"
Last-Modified: Mon, 04 Aug 2025 06:55:57 GMT
Date: Sat, 19 Sep 2026 08:39:44 GMT
Content-Type: text/html
Content-Length: 604

```

## HTTP body summary
```text
604 /tmp/lt500d-r25-http-body.bin
/tmp/lt500d-r25-http-body.bin: XML 1.0 document, ASCII text
```

## Gate status
```text
root=200
luci_final=404
https_static=200
[LT500D-EMU] LT500D_LAN_UCI_GATE=PASS network.lan.ipaddr=192.168.10.2
[LT500D-EMU] LT500D_LAN_IP_GATE=PASS br-lan=192.168.10.2
```

## Serial tail
```text
/proc/sys/net/ipv4/conf/all/rp_filter=0
[   55.974951] firmadyne: sys_socket[PID: 2849 (logger)]: family:1, type:524289, protocol:0
/proc/sys/net/ipv4/conf/br-lan/rp_filter=0
/proc/sys/net/ipv4/conf/eth1/rp_filter=0
[LT500D-EMU] network diagnostic end
[   56.441888] firmadyne: inet_accept[PID: 2226 (uhttpd)]:
[   56.442658] firmadyne: inet_accept[PID: 2226 (uhttpd)]:
[   56.519429] firmadyne: sys_socket[PID: 2861 (fw3)]: family:1, type:2, protocol:0
[   56.611078] firmadyne: sys_socket[PID: 2866 (ubus)]: family:1, type:2, protocol:0
[   56.616128] firmadyne: sys_socket[PID: 2814 (luci)]: family:1, type:2, protocol:0
[   56.719205] firmadyne: sys_socket[PID: 2814 (luci)]: family:16, type:524291, protocol:0
[   56.771938] firmadyne: sys_socket[PID: 2870 (mosquitto)]: family:2, type:2, protocol:0
[   56.840230] firmadyne: sys_socket[PID: 2879 (brctl)]: family:2, type:2, protocol:0
[   56.849443] firmadyne: sys_socket[PID: 2879 (brctl)]: family:1, type:524289, protocol:0
[   56.850246] firmadyne: sys_socket[PID: 2879 (brctl)]: family:1, type:524289, protocol:0
[   56.850588] firmadyne: sys_socket[PID: 2879 (brctl)]: family:1, type:524289, protocol:0
[   56.890773] firmadyne: sys_socket[PID: 2880 (logger)]: family:1, type:524289, protocol:0
[   56.905788] firmadyne: sys_socket[PID: 2870 (mosquitto)]: family:1, type:524290, protocol:0
[   56.942580] firmadyne: inet_accept[PID: 2226 (uhttpd)]:
[   56.942872] firmadyne: inet_accept[PID: 2226 (uhttpd)]:
[   56.943069] firmadyne: inet_accept[PID: 2226 (uhttpd)]:
[   56.943285] firmadyne: inet_accept[PID: 2226 (uhttpd)]:
[   56.943507] firmadyne: inet_accept[PID: 2226 (uhttpd)]:
[   56.960563] firmadyne: sys_socket[PID: 2870 (mosquitto)]: family:1, type:524289, protocol:0
[   57.011570] firmadyne: sys_socket[PID: 2870 (mosquitto)]: family:2, type:2, protocol:6
[   57.011953] firmadyne: sys_setsockopt[PID: 2870 (mosquitto)]: fd:5, level:65535, optname:4
[   57.012273] firmadyne: sys_setsockopt[PID: 2870 (mosquitto)]: fd:5, level:41, optname:26
[   57.012724] firmadyne: inet_bind[PID: 2870 (mosquitto)]: proto:SOCK_STREAM, port:1883
[   57.029432] firmadyne: sys_socket[PID: 2870 (mosquitto)]: family:2, type:2, protocol:6
[   57.029734] firmadyne: sys_setsockopt[PID: 2870 (mosquitto)]: fd:6, level:65535, optname:4
[   57.029998] firmadyne: sys_setsockopt[PID: 2870 (mosquitto)]: fd:6, level:41, optname:26
[   57.030279] firmadyne: inet_bind[PID: 2870 (mosquitto)]: proto:SOCK_STREAM, port:8883
[   57.045946] firmadyne: sys_socket[PID: 2885 (ubus)]: family:1, type:2, protocol:0
[   57.164233] firmadyne: inet_accept[PID: 2226 (uhttpd)]:
[   57.173036] firmadyne: inet_accept[PID: 2226 (uhttpd)]:
[   57.282307] firmadyne: sys_socket[PID: 2896 (gcom)]: family:1, type:524289, protocol:0
[   57.312726] firmadyne: sys_socket[PID: 2897 (logger)]: family:1, type:524289, protocol:0
[   58.112943] firmadyne: sys_socket[PID: 2940 (ubus)]: family:1, type:2, protocol:0
[   58.203665] firmadyne: sys_socket[PID: 2944 (ntpd)]: family:2, type:524417, protocol:0
[   58.204048] firmadyne: inet_bind[PID: 2944 (ntpd)]: proto:SOCK_DGRAM, port:0
[   58.235893] firmadyne: sys_socket[PID: 2945 (ntpd)]: family:2, type:524417, protocol:0
[   58.236337] firmadyne: inet_bind[PID: 2945 (ntpd)]: proto:SOCK_DGRAM, port:0
[   58.442102] firmadyne: inet_accept[PID: 2226 (uhttpd)]:
[   58.442459] firmadyne: inet_accept[PID: 2226 (uhttpd)]:
[   58.736573] firmadyne: sys_socket[PID: 2967 (ubus)]: family:1, type:2, protocol:0
[   58.942625] firmadyne: inet_accept[PID: 2226 (uhttpd)]:
[   58.942958] firmadyne: inet_accept[PID: 2226 (uhttpd)]:
[   58.943157] firmadyne: inet_accept[PID: 2226 (uhttpd)]:
[   58.943390] firmadyne: inet_accept[PID: 2226 (uhttpd)]:
[   58.943601] firmadyne: inet_accept[PID: 2226 (uhttpd)]:
[   58.996342] firmadyne: sys_socket[PID: 2983 (ubus)]: family:1, type:2, protocol:0
[   59.031009] firmadyne: sys_socket[PID: 2984 (crond)]: family:1, type:524289, protocol:0
[   59.308357] firmadyne: sys_socket[PID: 2998 (ubus)]: family:1, type:2, protocol:0
[   59.790887] firmadyne: sys_socket[PID: 3008 (ifconfig)]: family:2, type:1, protocol:0
[   59.886189] firmadyne: sys_socket[PID: 3016 (ubus)]: family:1, type:2, protocol:0
[   59.920347] firmadyne: sys_socket[PID: 3017 (ubus)]: family:1, type:2, protocol:0
[   59.995616] firmadyne: sys_socket[PID: 3019 (ifconfig)]: family:2, type:1, protocol:0
[   60.154314] firmadyne: sys_socket[PID: 3028 (ubus)]: family:1, type:2, protocol:0
[   60.270010] firmadyne: sys_socket[PID: 3032 (ubus)]: family:1, type:2, protocol:0
[   60.460638] firmadyne: inet_accept[PID: 2226 (uhttpd)]:
[   60.463249] firmadyne: inet_accept[PID: 2226 (uhttpd)]:
[   60.599208] firmadyne: sys_socket[PID: 3048 (ubus)]: family:1, type:2, protocol:0
[   60.823293] firmadyne: sys_socket[PID: 3061 (ubus)]: family:1, type:2, protocol:0
[   60.894820] firmadyne: sys_socket[PID: 3062 (crond)]: family:1, type:524289, protocol:0
[   60.942374] firmadyne: inet_accept[PID: 2226 (uhttpd)]:
[   60.942676] firmadyne: inet_accept[PID: 2226 (uhttpd)]:
[   60.942891] firmadyne: inet_accept[PID: 2226 (uhttpd)]:
[   60.943109] firmadyne: inet_accept[PID: 2226 (uhttpd)]:
[   61.060397] firmadyne: sys_socket[PID: 3071 (ubus)]: family:1, type:2, protocol:0
[   61.234353] firmadyne: sys_socket[PID: 3079 (ubus)]: family:1, type:2, protocol:0
[   61.392937] firmadyne: sys_socket[PID: 3086 (ifconfig)]: family:2, type:1, protocol:0
[   61.410534] firmadyne: __inet_insert_ifa[PID: 3086 (ifconfig)]: device:eth1 ifa:0x00000000
[   61.472992] firmadyne: sys_socket[PID: 3089 (brctl)]: family:2, type:2, protocol:0
[   61.490084] firmadyne: sys_socket[PID: 3089 (brctl)]: family:1, type:524289, protocol:0
[   61.491626] firmadyne: sys_socket[PID: 3089 (brctl)]: family:1, type:524289, protocol:0
[   61.491991] firmadyne: sys_socket[PID: 3089 (brctl)]: family:1, type:524289, protocol:0
[   61.578884] firmadyne: sys_socket[PID: 3097 (fw3)]: family:1, type:2, protocol:0
[   61.613815] firmadyne: sys_socket[PID: 3096 (iptables)]: family:1, type:2, protocol:0
[   61.614614] firmadyne: sys_socket[PID: 3096 (iptables)]: family:2, type:3, protocol:255
[   61.676417] firmadyne: sys_socket[PID: 3097 (fw3)]: family:2, type:3, protocol:255
[   61.700221] firmadyne: sys_setsockopt[PID: 3097 (fw3)]: fd:4, level:0, optname:64
[   61.718527] firmadyne: sys_setsockopt[PID: 3097 (fw3)]: fd:4, level:0, optname:65
[   61.719829] firmadyne: sys_socket[PID: 3097 (fw3)]: family:2, type:3, protocol:255
[   61.720471] firmadyne: sys_socket[PID: 3097 (fw3)]: family:2, type:3, protocol:255
[   61.721029] firmadyne: sys_socket[PID: 3097 (fw3)]: family:2, type:3, protocol:255
[   61.727616] firmadyne: sys_socket[PID: 3102 (iptables)]: family:1, type:2, protocol:0
[   61.728087] firmadyne: sys_socket[PID: 3102 (iptables)]: family:2, type:3, protocol:255
[   61.740584] firmadyne: sys_socket[PID: 1 (procd)]: family:1, type:524289, protocol:0
[   61.767355] firmadyne: sys_socket[PID: 3097 (fw3)]: family:10, type:524289, protocol:17
[   61.773363] firmadyne: sys_socket[PID: 3097 (fw3)]: family:10, type:524289, protocol:17
[   61.781340] firmadyne: sys_socket[PID: 3097 (fw3)]: family:10, type:524289, protocol:17
[   61.781696] firmadyne: sys_socket[PID: 3097 (fw3)]: family:10, type:524289, protocol:17
[   61.782201] firmadyne: sys_socket[PID: 3097 (fw3)]: family:10, type:524289, protocol:17
[   61.782535] firmadyne: sys_socket[PID: 3097 (fw3)]: family:10, type:524289, protocol:17
[   61.782987] firmadyne: sys_socket[PID: 3097 (fw3)]: family:10, type:524289, protocol:17
[   61.783311] firmadyne: sys_socket[PID: 3097 (fw3)]: family:10, type:524289, protocol:17
[   61.783977] firmadyne: sys_socket[PID: 3097 (fw3)]: family:10, type:524289, protocol:17
[   61.784311] firmadyne: sys_socket[PID: 3097 (fw3)]: family:10, type:524289, protocol:17
[   61.785180] firmadyne: sys_socket[PID: 3097 (fw3)]: family:10, type:524289, protocol:17
[   61.789367] firmadyne: sys_socket[PID: 3097 (fw3)]: family:10, type:524289, protocol:17
[   61.789890] firmadyne: sys_socket[PID: 3097 (fw3)]: family:10, type:524289, protocol:17
[   61.790198] firmadyne: sys_socket[PID: 3097 (fw3)]: family:10, type:524289, protocol:17
[   61.790759] firmadyne: sys_socket[PID: 3097 (fw3)]: family:10, type:524289, protocol:17
[   61.791063] firmadyne: sys_socket[PID: 3097 (fw3)]: family:10, type:524289, protocol:17
[   61.791847] firmadyne: sys_socket[PID: 3097 (fw3)]: family:10, type:524289, protocol:17
[   61.792192] firmadyne: sys_socket[PID: 3097 (fw3)]: family:10, type:524289, protocol:17
[   61.792559] firmadyne: sys_socket[PID: 3097 (fw3)]: family:10, type:524289, protocol:17
[   61.792853] firmadyne: sys_socket[PID: 3097 (fw3)]: family:10, type:524289, protocol:17
[   61.795977] firmadyne: sys_socket[PID: 3105 (iptables)]: family:1, type:2, protocol:0
[   61.796441] firmadyne: sys_socket[PID: 3105 (iptables)]: family:2, type:3, protocol:255
[   61.806499] firmadyne: sys_setsockopt[PID: 3097 (fw3)]: fd:7, level:0, optname:64
[   61.814145] firmadyne: sys_socket[PID: 3097 (fw3)]: family:2, type:3, protocol:255
[   61.814834] firmadyne: sys_socket[PID: 3097 (fw3)]: family:2, type:3, protocol:255
[   61.815632] firmadyne: sys_socket[PID: 3097 (fw3)]: family:10, type:3, protocol:255
[   61.819933] firmadyne: sys_setsockopt[PID: 3097 (fw3)]: fd:10, level:41, optname:64
[   61.825446] firmadyne: sys_setsockopt[PID: 3097 (fw3)]: fd:10, level:41, optname:65
[   61.826206] firmadyne: sys_socket[PID: 3097 (fw3)]: family:10, type:3, protocol:255
[   61.826761] firmadyne: sys_socket[PID: 3097 (fw3)]: family:10, type:3, protocol:255
[   61.827247] firmadyne: sys_socket[PID: 3097 (fw3)]: family:10, type:3, protocol:255
[   61.835246] firmadyne: sys_socket[PID: 3097 (fw3)]: family:10, type:524289, protocol:17
[   61.835621] firmadyne: sys_socket[PID: 3097 (fw3)]: family:10, type:524289, protocol:17
[   61.842845] firmadyne: sys_socket[PID: 3097 (fw3)]: family:10, type:524289, protocol:17
[   61.843207] firmadyne: sys_socket[PID: 3097 (fw3)]: family:10, type:524289, protocol:17
[   61.843711] firmadyne: sys_socket[PID: 3097 (fw3)]: family:10, type:524289, protocol:17
[   61.844021] firmadyne: sys_socket[PID: 3097 (fw3)]: family:10, type:524289, protocol:17
[   61.844564] firmadyne: sys_socket[PID: 3097 (fw3)]: family:10, type:524289, protocol:17
[   61.844873] firmadyne: sys_socket[PID: 3097 (fw3)]: family:10, type:524289, protocol:17
[   61.849506] firmadyne: sys_socket[PID: 3097 (fw3)]: family:10, type:524289, protocol:17
[   61.849860] firmadyne: sys_socket[PID: 3097 (fw3)]: family:10, type:524289, protocol:17
[   61.850442] firmadyne: sys_socket[PID: 3097 (fw3)]: family:10, type:524289, protocol:17
[   61.850754] firmadyne: sys_socket[PID: 3097 (fw3)]: family:10, type:524289, protocol:17
[   61.851510] firmadyne: sys_socket[PID: 3097 (fw3)]: family:10, type:524289, protocol:17
[   61.851857] firmadyne: sys_socket[PID: 3097 (fw3)]: family:10, type:524289, protocol:17
[   61.852179] firmadyne: sys_socket[PID: 3097 (fw3)]: family:10, type:524289, protocol:17
[   61.852506] firmadyne: sys_socket[PID: 3097 (fw3)]: family:10, type:524289, protocol:17
[   61.853835] firmadyne: sys_socket[PID: 3106 (iptables)]: family:1, type:2, protocol:0
[   61.854297] firmadyne: sys_socket[PID: 3106 (iptables)]: family:2, type:3, protocol:255
[   61.859358] firmadyne: sys_setsockopt[PID: 3097 (fw3)]: fd:13, level:41, optname:64
[   61.869971] firmadyne: sys_socket[PID: 3097 (fw3)]: family:10, type:3, protocol:255
[   61.870594] firmadyne: sys_socket[PID: 3097 (fw3)]: family:10, type:3, protocol:255
[   61.871416] firmadyne: sys_socket[PID: 3097 (fw3)]: family:16, type:524291, protocol:0
[   61.963977] firmadyne: sys_socket[PID: 3114 (ipset)]: family:16, type:3, protocol:12
[   61.988889] firmadyne: sys_socket[PID: 3117 (ipset)]: family:16, type:3, protocol:12
[   62.020627] firmadyne: sys_socket[PID: 3121 (ipset)]: family:16, type:3, protocol:12
[   62.040948] firmadyne: sys_socket[PID: 3124 (ipset)]: family:16, type:3, protocol:12
[   62.059034] firmadyne: sys_socket[PID: 3127 (ipset)]: family:16, type:3, protocol:12
[   62.076526] firmadyne: sys_socket[PID: 3130 (ipset)]: family:16, type:3, protocol:12
[   62.094149] firmadyne: sys_socket[PID: 3133 (ipset)]: family:16, type:3, protocol:12
[   62.120846] firmadyne: sys_socket[PID: 3136 (ipset)]: family:16, type:3, protocol:12
[   62.135145] firmadyne: sys_socket[PID: 3137 (mosquitto)]: family:2, type:2, protocol:0
[   62.179662] firmadyne: sys_socket[PID: 3137 (mosquitto)]: family:1, type:524290, protocol:0
[   62.205683] firmadyne: sys_socket[PID: 3137 (mosquitto)]: family:1, type:524289, protocol:0
[   62.216387] firmadyne: sys_socket[PID: 3137 (mosquitto)]: family:2, type:2, protocol:6
[   62.216783] firmadyne: sys_setsockopt[PID: 3137 (mosquitto)]: fd:5, level:65535, optname:4
[   62.218621] firmadyne: sys_socket[PID: 3141 (iptables)]: family:1, type:2, protocol:0
[   62.219072] firmadyne: sys_socket[PID: 3141 (iptables)]: family:2, type:3, protocol:255
[   62.221461] firmadyne: sys_setsockopt[PID: 3137 (mosquitto)]: fd:5, level:41, optname:26
[   62.222007] firmadyne: inet_bind[PID: 3137 (mosquitto)]: proto:SOCK_STREAM, port:1883
[   62.223483] firmadyne: sys_socket[PID: 3137 (mosquitto)]: family:2, type:2, protocol:6
[   62.223764] firmadyne: sys_setsockopt[PID: 3137 (mosquitto)]: fd:6, level:65535, optname:4
[   62.224021] firmadyne: sys_setsockopt[PID: 3137 (mosquitto)]: fd:6, level:41, optname:26
[   62.224298] firmadyne: inet_bind[PID: 3137 (mosquitto)]: proto:SOCK_STREAM, port:8883
[   62.226842] firmadyne: sys_setsockopt[PID: 3141 (iptables)]: fd:1, level:0, optname:64
[   62.227394] firmadyne: sys_setsockopt[PID: 3141 (iptables)]: fd:1, level:0, optname:65
[   62.265463] firmadyne: sys_socket[PID: 3142 (iptables)]: family:1, type:2, protocol:0
[   62.265927] firmadyne: sys_socket[PID: 3142 (iptables)]: family:2, type:3, protocol:255
[   62.290879] firmadyne: sys_socket[PID: 3143 (ip6tables)]: family:1, type:2, protocol:0
[   62.291356] firmadyne: sys_socket[PID: 3143 (ip6tables)]: family:10, type:3, protocol:255
[   62.295303] firmadyne: sys_setsockopt[PID: 3143 (ip6tables)]: fd:1, level:41, optname:64
[   62.296002] firmadyne: sys_setsockopt[PID: 3143 (ip6tables)]: fd:1, level:41, optname:65
[   62.318157] firmadyne: sys_socket[PID: 3144 (ip6tables)]: family:1, type:2, protocol:0
[   62.318622] firmadyne: sys_socket[PID: 3144 (ip6tables)]: family:10, type:3, protocol:255
[   62.345761] firmadyne: sys_socket[PID: 3145 (iptables)]: family:1, type:2, protocol:0
[   62.346253] firmadyne: sys_socket[PID: 3145 (iptables)]: family:2, type:3, protocol:255
[   62.348952] firmadyne: sys_setsockopt[PID: 3145 (iptables)]: fd:1, level:0, optname:64
[   62.353519] firmadyne: sys_setsockopt[PID: 3145 (iptables)]: fd:1, level:0, optname:65
[   62.377332] firmadyne: sys_socket[PID: 3146 (gcom)]: family:1, type:524289, protocol:0
[   62.392176] firmadyne: sys_socket[PID: 1 (procd)]: family:1, type:524289, protocol:0
[   62.394449] firmadyne: sys_socket[PID: 3147 (iptables)]: family:1, type:2, protocol:0
[   62.394895] firmadyne: sys_socket[PID: 3147 (iptables)]: family:2, type:3, protocol:255
[   62.397992] firmadyne: sys_setsockopt[PID: 3147 (iptables)]: fd:1, level:0, optname:64
[   62.398527] firmadyne: sys_setsockopt[PID: 3147 (iptables)]: fd:1, level:0, optname:65
[   62.419361] firmadyne: sys_socket[PID: 3148 (ip6tables)]: family:1, type:2, protocol:0
[   62.419788] firmadyne: sys_socket[PID: 3148 (ip6tables)]: family:10, type:3, protocol:255
[   62.422666] firmadyne: sys_setsockopt[PID: 3148 (ip6tables)]: fd:1, level:41, optname:64
[   62.423149] firmadyne: sys_setsockopt[PID: 3148 (ip6tables)]: fd:1, level:41, optname:65
[   62.441986] firmadyne: inet_accept[PID: 2226 (uhttpd)]:
[   62.442316] firmadyne: inet_accept[PID: 2226 (uhttpd)]:
[   62.446684] firmadyne: sys_socket[PID: 3149 (ip6tables)]: family:1, type:2, protocol:0
[   62.447103] firmadyne: sys_socket[PID: 3149 (ip6tables)]: family:10, type:3, protocol:255
[   62.449988] firmadyne: sys_setsockopt[PID: 3149 (ip6tables)]: fd:1, level:41, optname:64
[   62.450480] firmadyne: sys_setsockopt[PID: 3149 (ip6tables)]: fd:1, level:41, optname:65
[   62.520509] firmadyne: sys_socket[PID: 3152 (iptables)]: family:1, type:2, protocol:0
[   62.521001] firmadyne: sys_socket[PID: 3152 (iptables)]: family:2, type:3, protocol:255
[   62.524057] firmadyne: sys_setsockopt[PID: 3152 (iptables)]: fd:1, level:0, optname:64
[   62.524605] firmadyne: sys_setsockopt[PID: 3152 (iptables)]: fd:1, level:0, optname:65
[   62.547124] firmadyne: sys_socket[PID: 3153 (iptables)]: family:10, type:524289, protocol:17
[   62.547824] firmadyne: sys_socket[PID: 3153 (iptables)]: family:10, type:524289, protocol:17
[   62.550978] firmadyne: sys_socket[PID: 3153 (iptables)]: family:1, type:2, protocol:0
[   62.551473] firmadyne: sys_socket[PID: 3153 (iptables)]: family:2, type:3, protocol:255
[   62.554481] firmadyne: sys_setsockopt[PID: 3153 (iptables)]: fd:1, level:0, optname:64
[   62.555051] firmadyne: sys_setsockopt[PID: 3153 (iptables)]: fd:1, level:0, optname:65
[   62.577631] firmadyne: sys_socket[PID: 3154 (iptables)]: family:1, type:2, protocol:0
[   62.578093] firmadyne: sys_socket[PID: 3154 (iptables)]: family:2, type:3, protocol:255
[   62.580795] firmadyne: sys_setsockopt[PID: 3154 (iptables)]: fd:1, level:0, optname:64
[   62.581655] firmadyne: sys_setsockopt[PID: 3154 (iptables)]: fd:1, level:0, optname:65
[   62.601835] firmadyne: sys_socket[PID: 3155 (ip6tables)]: family:1, type:2, protocol:0
[   62.602255] firmadyne: sys_socket[PID: 3155 (ip6tables)]: family:10, type:3, protocol:255
[   62.604802] firmadyne: sys_setsockopt[PID: 3155 (ip6tables)]: fd:1, level:41, optname:64
[   62.605555] firmadyne: sys_setsockopt[PID: 3155 (ip6tables)]: fd:1, level:41, optname:65
[   62.627958] firmadyne: sys_socket[PID: 3156 (ip6tables)]: family:10, type:524289, protocol:17
[   62.628688] firmadyne: sys_socket[PID: 3156 (ip6tables)]: family:10, type:524289, protocol:17
[   62.632187] firmadyne: sys_socket[PID: 3156 (ip6tables)]: family:1, type:2, protocol:0
[   62.632615] firmadyne: sys_socket[PID: 3156 (ip6tables)]: family:10, type:3, protocol:255
[   62.636054] firmadyne: sys_setsockopt[PID: 3156 (ip6tables)]: fd:1, level:41, optname:64
[   62.636626] firmadyne: sys_setsockopt[PID: 3156 (ip6tables)]: fd:1, level:41, optname:65
[   62.660088] firmadyne: sys_socket[PID: 3157 (ip6tables)]: family:1, type:2, protocol:0
[   62.660593] firmadyne: sys_socket[PID: 3157 (ip6tables)]: family:10, type:3, protocol:255
[   62.663652] firmadyne: sys_setsockopt[PID: 3157 (ip6tables)]: fd:1, level:41, optname:64
[   62.664297] firmadyne: sys_setsockopt[PID: 3157 (ip6tables)]: fd:1, level:41, optname:65
```
