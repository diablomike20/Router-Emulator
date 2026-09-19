# RE-LT500D R25 emulator CI result

Commit: 1da142a36995958826d017ac7342aab7079991bc
Firmware download/verify: success
Image build: success
QEMU/HTTP gate: success
Run: https://github.com/diablomike20/Router-Emulator/actions/runs/35434028795

## HTTP headers
```text
HTTP/1.1 200 OK
Connection: Keep-Alive
Keep-Alive: timeout=20
ETag: "a19-25c-6890597d"
Last-Modified: Mon, 04 Aug 2025 06:55:57 GMT
Date: Sat, 19 Sep 2026 09:12:58 GMT
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
luci_final=403
luci_path=http://cudy.net/cgi-bin/luci/
candidate=/cgi-bin/luci/
hop=1 scheme=http path=/cgi-bin/luci/ status=403
https_static=200
[LT500D-EMU] LT500D_LAN_UCI_GATE=PASS network.lan.ipaddr=192.168.10.2
[LT500D-EMU] LT500D_LAN_IP_GATE=PASS br-lan=192.168.10.2
```

## Serial tail
```text
[   40.980826] firmadyne: sys_socket[PID: 3266 (fw3)]: family:2, type:3, protocol:255
[   40.981275] firmadyne: sys_socket[PID: 3266 (fw3)]: family:10, type:3, protocol:255
[   40.983987] firmadyne: sys_setsockopt[PID: 3266 (fw3)]: fd:10, level:41, optname:64
[   40.985062] firmadyne: sys_setsockopt[PID: 3266 (fw3)]: fd:10, level:41, optname:65
[   40.985731] firmadyne: sys_socket[PID: 3266 (fw3)]: family:10, type:3, protocol:255
[   40.986089] firmadyne: sys_socket[PID: 3266 (fw3)]: family:10, type:3, protocol:255
[   40.986389] firmadyne: sys_socket[PID: 3266 (fw3)]: family:10, type:3, protocol:255
[   40.988227] firmadyne: sys_socket[PID: 3266 (fw3)]: family:10, type:524289, protocol:17
[   40.988470] firmadyne: sys_socket[PID: 3266 (fw3)]: family:10, type:524289, protocol:17
[   40.990360] firmadyne: sys_socket[PID: 3266 (fw3)]: family:10, type:524289, protocol:17
[   40.990612] firmadyne: sys_socket[PID: 3266 (fw3)]: family:10, type:524289, protocol:17
[   40.990907] firmadyne: sys_socket[PID: 3266 (fw3)]: family:10, type:524289, protocol:17
[   40.991111] firmadyne: sys_socket[PID: 3266 (fw3)]: family:10, type:524289, protocol:17
[   40.991403] firmadyne: sys_socket[PID: 3266 (fw3)]: family:10, type:524289, protocol:17
[   40.991604] firmadyne: sys_socket[PID: 3266 (fw3)]: family:10, type:524289, protocol:17
[   40.991865] firmadyne: sys_socket[PID: 3266 (fw3)]: family:10, type:524289, protocol:17
[   40.992063] firmadyne: sys_socket[PID: 3266 (fw3)]: family:10, type:524289, protocol:17
[   40.992363] firmadyne: sys_socket[PID: 3266 (fw3)]: family:10, type:524289, protocol:17
[   40.992562] firmadyne: sys_socket[PID: 3266 (fw3)]: family:10, type:524289, protocol:17
[   40.992999] firmadyne: sys_socket[PID: 3266 (fw3)]: family:10, type:524289, protocol:17
[   40.993232] firmadyne: sys_socket[PID: 3266 (fw3)]: family:10, type:524289, protocol:17
[   40.993815] firmadyne: sys_socket[PID: 3266 (fw3)]: family:10, type:524289, protocol:17
[   40.994034] firmadyne: sys_socket[PID: 3266 (fw3)]: family:10, type:524289, protocol:17
[   40.995519] firmadyne: sys_setsockopt[PID: 3266 (fw3)]: fd:13, level:41, optname:64
[   40.996278] firmadyne: sys_socket[PID: 3266 (fw3)]: family:10, type:3, protocol:255
[   40.996628] firmadyne: sys_socket[PID: 3266 (fw3)]: family:10, type:3, protocol:255
[   40.996979] firmadyne: sys_socket[PID: 3266 (fw3)]: family:16, type:524291, protocol:0
[   41.038958] firmadyne: sys_socket[PID: 3274 (ipset)]: family:16, type:3, protocol:12
[   41.050393] firmadyne: sys_socket[PID: 3277 (ipset)]: family:16, type:3, protocol:12
[   41.069039] firmadyne: sys_socket[PID: 3281 (ipset)]: family:16, type:3, protocol:12
[   41.079277] firmadyne: sys_socket[PID: 3284 (ipset)]: family:16, type:3, protocol:12
[   41.089746] firmadyne: sys_socket[PID: 3287 (ipset)]: family:16, type:3, protocol:12
[   41.100128] firmadyne: sys_socket[PID: 3290 (ipset)]: family:16, type:3, protocol:12
[   41.110436] firmadyne: sys_socket[PID: 3293 (ipset)]: family:16, type:3, protocol:12
[   41.121051] firmadyne: sys_socket[PID: 3296 (ipset)]: family:16, type:3, protocol:12
[   41.143918] firmadyne: sys_socket[PID: 3300 (iptables)]: family:1, type:2, protocol:0
[   41.144254] firmadyne: sys_socket[PID: 3300 (iptables)]: family:2, type:3, protocol:255
[   41.146710] firmadyne: sys_setsockopt[PID: 3300 (iptables)]: fd:1, level:0, optname:64
[   41.147086] firmadyne: sys_setsockopt[PID: 3300 (iptables)]: fd:1, level:0, optname:65
[   41.160032] firmadyne: sys_socket[PID: 3301 (iptables)]: family:1, type:2, protocol:0
[   41.160359] firmadyne: sys_socket[PID: 3301 (iptables)]: family:2, type:3, protocol:255
[   41.175151] firmadyne: sys_socket[PID: 3302 (ip6tables)]: family:1, type:2, protocol:0
[   41.175457] firmadyne: sys_socket[PID: 3302 (ip6tables)]: family:10, type:3, protocol:255
[   41.178634] firmadyne: sys_setsockopt[PID: 3302 (ip6tables)]: fd:1, level:41, optname:64
[   41.179009] firmadyne: sys_setsockopt[PID: 3302 (ip6tables)]: fd:1, level:41, optname:65
[   41.198597] firmadyne: sys_socket[PID: 3303 (gcom)]: family:1, type:524289, protocol:0
[   41.203301] firmadyne: sys_socket[PID: 3304 (ip6tables)]: family:1, type:2, protocol:0
[   41.203581] firmadyne: sys_socket[PID: 3304 (ip6tables)]: family:10, type:3, protocol:255
[   41.220730] firmadyne: sys_socket[PID: 3305 (iptables)]: family:1, type:2, protocol:0
[   41.221021] firmadyne: sys_socket[PID: 3305 (iptables)]: family:2, type:3, protocol:255
[   41.222820] firmadyne: sys_setsockopt[PID: 3305 (iptables)]: fd:1, level:0, optname:64
[   41.223153] firmadyne: sys_setsockopt[PID: 3305 (iptables)]: fd:1, level:0, optname:65
[   41.234268] firmadyne: sys_socket[PID: 3306 (iptables)]: family:1, type:2, protocol:0
[   41.234559] firmadyne: sys_socket[PID: 3306 (iptables)]: family:2, type:3, protocol:255
[   41.236226] firmadyne: sys_setsockopt[PID: 3306 (iptables)]: fd:1, level:0, optname:64
[   41.236535] firmadyne: sys_setsockopt[PID: 3306 (iptables)]: fd:1, level:0, optname:65
[   41.247570] firmadyne: sys_socket[PID: 3307 (ip6tables)]: family:1, type:2, protocol:0
[   41.247859] firmadyne: sys_socket[PID: 3307 (ip6tables)]: family:10, type:3, protocol:255
[   41.249354] firmadyne: sys_setsockopt[PID: 3307 (ip6tables)]: fd:1, level:41, optname:64
[   41.249879] firmadyne: sys_setsockopt[PID: 3307 (ip6tables)]: fd:1, level:41, optname:65
[   41.261080] firmadyne: sys_socket[PID: 3308 (ip6tables)]: family:1, type:2, protocol:0
[   41.261358] firmadyne: sys_socket[PID: 3308 (ip6tables)]: family:10, type:3, protocol:255
[   41.263051] firmadyne: sys_setsockopt[PID: 3308 (ip6tables)]: fd:1, level:41, optname:64
[   41.263352] firmadyne: sys_setsockopt[PID: 3308 (ip6tables)]: fd:1, level:41, optname:65
[   41.297684] firmadyne: sys_socket[PID: 3311 (iptables)]: family:1, type:2, protocol:0
[   41.297979] firmadyne: sys_socket[PID: 3311 (iptables)]: family:2, type:3, protocol:255
[   41.299529] firmadyne: sys_setsockopt[PID: 3311 (iptables)]: fd:1, level:0, optname:64
[   41.299853] firmadyne: sys_setsockopt[PID: 3311 (iptables)]: fd:1, level:0, optname:65
[   41.312336] firmadyne: sys_socket[PID: 3312 (iptables)]: family:10, type:524289, protocol:17
[   41.312815] firmadyne: sys_socket[PID: 3312 (iptables)]: family:10, type:524289, protocol:17
[   41.314822] firmadyne: sys_socket[PID: 3312 (iptables)]: family:1, type:2, protocol:0
[   41.315126] firmadyne: sys_socket[PID: 3312 (iptables)]: family:2, type:3, protocol:255
[   41.316770] firmadyne: sys_setsockopt[PID: 3312 (iptables)]: fd:1, level:0, optname:64
[   41.317125] firmadyne: sys_setsockopt[PID: 3312 (iptables)]: fd:1, level:0, optname:65
[   41.330199] firmadyne: sys_socket[PID: 3313 (iptables)]: family:1, type:2, protocol:0
[   41.330499] firmadyne: sys_socket[PID: 3313 (iptables)]: family:2, type:3, protocol:255
[   41.332086] firmadyne: sys_setsockopt[PID: 3313 (iptables)]: fd:1, level:0, optname:64
[   41.332439] firmadyne: sys_setsockopt[PID: 3313 (iptables)]: fd:1, level:0, optname:65
[   41.343562] firmadyne: sys_socket[PID: 3314 (ip6tables)]: family:1, type:2, protocol:0
[   41.343855] firmadyne: sys_socket[PID: 3314 (ip6tables)]: family:10, type:3, protocol:255
[   41.345342] firmadyne: sys_setsockopt[PID: 3314 (ip6tables)]: fd:1, level:41, optname:64
[   41.345851] firmadyne: sys_setsockopt[PID: 3314 (ip6tables)]: fd:1, level:41, optname:65
[   41.358132] firmadyne: sys_socket[PID: 3315 (ip6tables)]: family:10, type:524289, protocol:17
[   41.358571] firmadyne: sys_socket[PID: 3315 (ip6tables)]: family:10, type:524289, protocol:17
[   41.360412] firmadyne: sys_socket[PID: 3315 (ip6tables)]: family:1, type:2, protocol:0
[   41.360670] firmadyne: sys_socket[PID: 3315 (ip6tables)]: family:10, type:3, protocol:255
[   41.362534] firmadyne: sys_setsockopt[PID: 3315 (ip6tables)]: fd:1, level:41, optname:64
[   41.362901] firmadyne: sys_setsockopt[PID: 3315 (ip6tables)]: fd:1, level:41, optname:65
[   41.384518] firmadyne: sys_socket[PID: 3316 (ip6tables)]: family:1, type:2, protocol:0
[   41.384808] firmadyne: sys_socket[PID: 3316 (ip6tables)]: family:10, type:3, protocol:255
[   41.387331] firmadyne: sys_socket[PID: 3317 (mosquitto)]: family:2, type:2, protocol:0
[   41.390578] firmadyne: sys_setsockopt[PID: 3316 (ip6tables)]: fd:1, level:41, optname:64
[   41.390956] firmadyne: sys_setsockopt[PID: 3316 (ip6tables)]: fd:1, level:41, optname:65
[   41.410247] firmadyne: inet_accept[PID: 2261 (uhttpd)]:
[   41.410496] firmadyne: inet_accept[PID: 2261 (uhttpd)]:
[   41.417645] firmadyne: sys_socket[PID: 3317 (mosquitto)]: family:1, type:524290, protocol:0
[   41.423693] firmadyne: sys_socket[PID: 3317 (mosquitto)]: family:1, type:524289, protocol:0
[   41.432162] firmadyne: sys_socket[PID: 3317 (mosquitto)]: family:2, type:2, protocol:6
[   41.432417] firmadyne: sys_setsockopt[PID: 3317 (mosquitto)]: fd:5, level:65535, optname:4
[   41.432702] firmadyne: sys_setsockopt[PID: 3317 (mosquitto)]: fd:5, level:41, optname:26
[   41.433020] firmadyne: inet_bind[PID: 3317 (mosquitto)]: proto:SOCK_STREAM, port:1883
[   41.437678] firmadyne: sys_socket[PID: 3317 (mosquitto)]: family:2, type:2, protocol:6
[   41.437888] firmadyne: sys_setsockopt[PID: 3317 (mosquitto)]: fd:6, level:65535, optname:4
[   41.438069] firmadyne: sys_setsockopt[PID: 3317 (mosquitto)]: fd:6, level:41, optname:26
[   41.438252] firmadyne: inet_bind[PID: 3317 (mosquitto)]: proto:SOCK_STREAM, port:8883
[   41.444197] firmadyne: sys_socket[PID: 3319 (iptables)]: family:1, type:2, protocol:0
[   41.444482] firmadyne: sys_socket[PID: 3319 (iptables)]: family:2, type:3, protocol:255
[   41.450370] firmadyne: sys_setsockopt[PID: 3319 (iptables)]: fd:1, level:0, optname:64
[   41.450920] firmadyne: sys_setsockopt[PID: 3319 (iptables)]: fd:1, level:0, optname:65
[   41.461250] firmadyne: sys_socket[PID: 3320 (ip6tables)]: family:1, type:2, protocol:0
[   41.461578] firmadyne: sys_socket[PID: 3320 (ip6tables)]: family:10, type:3, protocol:255
[   41.463279] firmadyne: sys_setsockopt[PID: 3320 (ip6tables)]: fd:1, level:41, optname:64
[   41.463643] firmadyne: sys_setsockopt[PID: 3320 (ip6tables)]: fd:1, level:41, optname:65
[   41.489211] firmadyne: sys_socket[PID: 3322 (iptables)]: family:1, type:2, protocol:0
[   41.489715] firmadyne: sys_socket[PID: 3322 (iptables)]: family:2, type:3, protocol:255
[   41.491274] firmadyne: sys_setsockopt[PID: 3322 (iptables)]: fd:1, level:0, optname:64
[   41.491592] firmadyne: sys_setsockopt[PID: 3322 (iptables)]: fd:1, level:0, optname:65
[   41.502897] firmadyne: sys_socket[PID: 3323 (iptables)]: family:1, type:2, protocol:0
[   41.503198] firmadyne: sys_socket[PID: 3323 (iptables)]: family:2, type:3, protocol:255
[   41.504900] firmadyne: sys_setsockopt[PID: 3323 (iptables)]: fd:1, level:0, optname:64
[   41.505212] firmadyne: sys_setsockopt[PID: 3323 (iptables)]: fd:1, level:0, optname:65
[   41.516626] firmadyne: sys_socket[PID: 3324 (iptables)]: family:1, type:2, protocol:0
[   41.516941] firmadyne: sys_socket[PID: 3324 (iptables)]: family:2, type:3, protocol:255
[   41.519158] firmadyne: sys_setsockopt[PID: 3324 (iptables)]: fd:1, level:0, optname:64
[   41.519485] firmadyne: sys_setsockopt[PID: 3324 (iptables)]: fd:1, level:0, optname:65
[   41.532747] firmadyne: sys_socket[PID: 3325 (iptables)]: family:1, type:2, protocol:0
[   41.533045] firmadyne: sys_socket[PID: 3325 (iptables)]: family:2, type:3, protocol:255
[   41.672640] firmadyne: sys_socket[PID: 3333 (iptables)]: family:1, type:2, protocol:0
[   41.672954] firmadyne: sys_socket[PID: 3333 (iptables)]: family:2, type:3, protocol:255
[   41.688621] firmadyne: sys_socket[PID: 3334 (iptables)]: family:1, type:2, protocol:0
[   41.688938] firmadyne: sys_socket[PID: 3334 (iptables)]: family:2, type:3, protocol:255
[   41.690586] firmadyne: sys_setsockopt[PID: 3334 (iptables)]: fd:1, level:0, optname:64
[   41.700939] firmadyne: sys_socket[PID: 3337 (iptables)]: family:1, type:2, protocol:0
[   41.701228] firmadyne: sys_socket[PID: 3337 (iptables)]: family:2, type:3, protocol:255
[   41.716536] firmadyne: sys_socket[PID: 3338 (iptables)]: family:1, type:2, protocol:0
[   41.716871] firmadyne: sys_socket[PID: 3338 (iptables)]: family:2, type:3, protocol:255
[   41.732633] firmadyne: sys_socket[PID: 3339 (iptables)]: family:1, type:2, protocol:0
[   41.732968] firmadyne: sys_socket[PID: 3339 (iptables)]: family:2, type:3, protocol:255
[   41.829060] firmadyne: sys_socket[PID: 3348 (iptables)]: family:1, type:2, protocol:0
[   41.829405] firmadyne: sys_socket[PID: 3348 (iptables)]: family:2, type:3, protocol:255
[   41.843208] firmadyne: sys_socket[PID: 3349 (iptables)]: family:1, type:2, protocol:0
[   41.843508] firmadyne: sys_socket[PID: 3349 (iptables)]: family:2, type:3, protocol:255
[   41.856140] firmadyne: sys_socket[PID: 3350 (iptables)]: family:1, type:2, protocol:0
[   41.856450] firmadyne: sys_socket[PID: 3350 (iptables)]: family:2, type:3, protocol:255
[   41.868683] firmadyne: sys_socket[PID: 3351 (iptables)]: family:1, type:2, protocol:0
[   41.868986] firmadyne: sys_socket[PID: 3351 (iptables)]: family:2, type:3, protocol:255
[   41.877329] firmadyne: sys_socket[PID: 3352 (iptables)]: family:1, type:2, protocol:0
[   41.877712] firmadyne: sys_socket[PID: 3352 (iptables)]: family:2, type:3, protocol:255
[   41.885228] firmadyne: sys_socket[PID: 3353 (iptables)]: family:1, type:2, protocol:0
[   41.885587] firmadyne: sys_socket[PID: 3353 (iptables)]: family:2, type:3, protocol:255
[   41.944696] firmadyne: sys_socket[PID: 3358 (ubus)]: family:1, type:2, protocol:0
[   41.979458] firmadyne: sys_socket[PID: 3361 (logger)]: family:1, type:524289, protocol:0
[   41.988402] firmadyne: sys_socket[PID: 3362 (iptables)]: family:1, type:2, protocol:0
[   41.988717] firmadyne: sys_socket[PID: 3362 (iptables)]: family:2, type:3, protocol:255
[   42.000698] firmadyne: sys_socket[PID: 3363 (iptables)]: family:1, type:2, protocol:0
[   42.000993] firmadyne: sys_socket[PID: 3363 (iptables)]: family:2, type:3, protocol:255
[   42.013060] firmadyne: sys_socket[PID: 3364 (iptables)]: family:1, type:2, protocol:0
[   42.013358] firmadyne: sys_socket[PID: 3364 (iptables)]: family:2, type:3, protocol:255
[   42.023897] firmadyne: sys_socket[PID: 3365 (ip)]: family:16, type:524291, protocol:0
[   42.024161] firmadyne: sys_setsockopt[PID: 3365 (ip)]: fd:0, level:65535, optname:4097
[   42.024383] firmadyne: sys_setsockopt[PID: 3365 (ip)]: fd:0, level:65535, optname:4098
[   42.037492] firmadyne: sys_socket[PID: 3366 (ipset)]: family:16, type:3, protocol:12
[   42.047430] firmadyne: sys_socket[PID: 3369 (ipset)]: family:16, type:3, protocol:12
[   42.057474] firmadyne: sys_socket[PID: 3372 (ipset)]: family:16, type:3, protocol:12
[   42.067495] firmadyne: sys_socket[PID: 3375 (ipset)]: family:16, type:3, protocol:12
[   42.077541] firmadyne: sys_socket[PID: 3378 (ipset)]: family:16, type:3, protocol:12
[   42.087452] firmadyne: sys_socket[PID: 3381 (ipset)]: family:16, type:3, protocol:12
[   42.111742] firmadyne: sys_socket[PID: 3385 (ipset)]: family:16, type:3, protocol:12
[   42.122102] firmadyne: sys_socket[PID: 3388 (ipset)]: family:16, type:3, protocol:12
[   42.196911] firmadyne: sys_socket[PID: 3396 (iptables)]: family:1, type:2, protocol:0
[   42.197223] firmadyne: sys_socket[PID: 3396 (iptables)]: family:2, type:3, protocol:255
[   42.209850] firmadyne: sys_socket[PID: 3397 (iptables)]: family:1, type:2, protocol:0
[   42.210143] firmadyne: sys_socket[PID: 3397 (iptables)]: family:2, type:3, protocol:255
[   42.211064] firmadyne: sys_socket[PID: 3397 (iptables)]: family:2, type:3, protocol:255
[   42.222685] firmadyne: sys_socket[PID: 3402 (iptables)]: family:1, type:2, protocol:0
[   42.222987] firmadyne: sys_socket[PID: 3402 (iptables)]: family:2, type:3, protocol:255
[   42.223653] firmadyne: sys_socket[PID: 3402 (iptables)]: family:2, type:3, protocol:255
[   42.235547] firmadyne: sys_socket[PID: 3407 (ip6tables)]: family:1, type:2, protocol:0
[   42.235859] firmadyne: sys_socket[PID: 3407 (ip6tables)]: family:10, type:3, protocol:255
[   42.285854] firmadyne: sys_socket[PID: 3411 (iptables)]: family:1, type:2, protocol:0
[   42.286155] firmadyne: sys_socket[PID: 3411 (iptables)]: family:2, type:3, protocol:255
[   42.300320] firmadyne: sys_socket[PID: 3413 (iptables)]: family:1, type:2, protocol:0
[   42.300634] firmadyne: sys_socket[PID: 3413 (iptables)]: family:2, type:3, protocol:255
[   42.313947] firmadyne: sys_socket[PID: 3414 (iptables)]: family:1, type:2, protocol:0
[   42.314238] firmadyne: sys_socket[PID: 3414 (iptables)]: family:2, type:3, protocol:255
[   42.314915] firmadyne: sys_socket[PID: 3414 (iptables)]: family:2, type:3, protocol:255
[   42.337808] firmadyne: sys_socket[PID: 3420 (iptables)]: family:1, type:2, protocol:0
[   42.338112] firmadyne: sys_socket[PID: 3420 (iptables)]: family:2, type:3, protocol:255
[   42.338787] firmadyne: sys_socket[PID: 3420 (iptables)]: family:2, type:3, protocol:255
[   42.347291] firmadyne: sys_socket[PID: 3426 (iptables)]: family:1, type:2, protocol:0
[   42.347561] firmadyne: sys_socket[PID: 3426 (iptables)]: family:2, type:3, protocol:255
[   42.348219] firmadyne: sys_socket[PID: 3426 (iptables)]: family:2, type:3, protocol:255
[   42.371093] firmadyne: sys_socket[PID: 3432 (ip6tables)]: family:1, type:2, protocol:0
[   42.371379] firmadyne: sys_socket[PID: 3432 (ip6tables)]: family:10, type:3, protocol:255
[   42.385776] firmadyne: sys_socket[PID: 3434 (ip6tables)]: family:1, type:2, protocol:0
[   42.386058] firmadyne: sys_socket[PID: 3434 (ip6tables)]: family:10, type:3, protocol:255
[   42.389385] firmadyne: sys_socket[PID: 3266 (fw3)]: family:16, type:524291, protocol:0
[   42.645890] firmadyne: sys_socket[PID: 3436 (hyfibrd)]: family:1, type:524289, protocol:0
[   42.647993] firmadyne: sys_socket[PID: 3436 (hyfibrd)]: family:16, type:3, protocol:26
[   42.649388] firmadyne: sys_socket[PID: 1 (procd)]: family:1, type:524289, protocol:0
[   42.962857] firmadyne: inet_accept[PID: 2261 (uhttpd)]:
[   42.963347] firmadyne: inet_accept[PID: 2261 (uhttpd)]:
[   42.963490] firmadyne: inet_accept[PID: 2261 (uhttpd)]:
[   42.968476] firmadyne: sys_socket[PID: 3439 (ifconfig)]: family:2, type:1, protocol:0
[   42.969343] firmadyne: __inet_insert_ifa[PID: 3439 (ifconfig)]: device:eth1 ifa:0x00000000
[   42.984170] firmadyne: sys_socket[PID: 3440 (brctl)]: family:2, type:2, protocol:0
[   42.984726] firmadyne: sys_socket[PID: 3440 (brctl)]: family:1, type:524289, protocol:0
[   42.985257] firmadyne: sys_socket[PID: 3440 (brctl)]: family:1, type:524289, protocol:0
[   42.989128] firmadyne: sys_socket[PID: 3440 (brctl)]: family:1, type:524289, protocol:0
[   43.002554] firmadyne: sys_socket[PID: 3442 (iptables)]: family:1, type:2, protocol:0
[   43.002870] firmadyne: sys_socket[PID: 3442 (iptables)]: family:2, type:3, protocol:255
[   43.017249] firmadyne: sys_socket[PID: 3443 (iptables)]: family:1, type:2, protocol:0
[   43.017618] firmadyne: sys_socket[PID: 3443 (iptables)]: family:2, type:3, protocol:255
[   43.031755] firmadyne: sys_socket[PID: 3444 (iptables)]: family:1, type:2, protocol:0
[   43.032075] firmadyne: sys_socket[PID: 3444 (iptables)]: family:2, type:3, protocol:255
[   43.046278] firmadyne: sys_socket[PID: 3445 (iptables)]: family:1, type:2, protocol:0
[   43.046579] firmadyne: sys_socket[PID: 3445 (iptables)]: family:2, type:3, protocol:255
[   43.970934] firmadyne: inet_accept[PID: 2261 (uhttpd)]:
[   43.971414] firmadyne: inet_accept[PID: 2261 (uhttpd)]:
[   44.802863] firmadyne: sys_socket[PID: 3447 (softapd)]: family:1, type:524289, protocol:0
```
