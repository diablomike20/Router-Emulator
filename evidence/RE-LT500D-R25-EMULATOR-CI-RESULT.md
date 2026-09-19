# RE-LT500D R25 emulator CI result

Commit: d92b356025368d7000f40b78e980f842862ffc98
Firmware download/verify: success
Image build: success
QEMU/HTTP gate: failure
Run: https://github.com/diablomike20/Router-Emulator/actions/runs/35433044787

## HTTP headers
```text
HTTP/1.1 200 OK
Connection: Keep-Alive
Keep-Alive: timeout=20
ETag: "a19-25c-6890597d"
Last-Modified: Mon, 04 Aug 2025 06:55:57 GMT
Date: Sat, 19 Sep 2026 08:51:18 GMT
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
luci_final=000
/cgi-bin/luci/
404 /cgi-bin/luci/
/cgi-bin/luci
404 /cgi-bin/luci
/cgi-bin/luci/admin
404 /cgi-bin/luci/admin
https_static=200
[LT500D-EMU] LT500D_LAN_UCI_GATE=PASS network.lan.ipaddr=192.168.10.2
[LT500D-EMU] LT500D_LAN_IP_GATE=PASS br-lan=192.168.10.2
```

## Serial tail
```text
[   64.271702] firmadyne: sys_setsockopt[PID: 3192 (fw3)]: fd:10, level:41, optname:64
[   64.273354] firmadyne: sys_setsockopt[PID: 3192 (fw3)]: fd:10, level:41, optname:65
[   64.274091] firmadyne: sys_socket[PID: 3192 (fw3)]: family:10, type:3, protocol:255
[   64.274639] firmadyne: sys_socket[PID: 3192 (fw3)]: family:10, type:3, protocol:255
[   64.275476] firmadyne: sys_socket[PID: 3192 (fw3)]: family:10, type:3, protocol:255
[   64.279355] firmadyne: sys_socket[PID: 3192 (fw3)]: family:10, type:524289, protocol:17
[   64.279728] firmadyne: sys_socket[PID: 3192 (fw3)]: family:10, type:524289, protocol:17
[   64.283300] firmadyne: sys_socket[PID: 3192 (fw3)]: family:10, type:524289, protocol:17
[   64.283669] firmadyne: sys_socket[PID: 3192 (fw3)]: family:10, type:524289, protocol:17
[   64.284144] firmadyne: sys_socket[PID: 3192 (fw3)]: family:10, type:524289, protocol:17
[   64.284447] firmadyne: sys_socket[PID: 3192 (fw3)]: family:10, type:524289, protocol:17
[   64.284975] firmadyne: sys_socket[PID: 3192 (fw3)]: family:10, type:524289, protocol:17
[   64.285277] firmadyne: sys_socket[PID: 3192 (fw3)]: family:10, type:524289, protocol:17
[   64.285720] firmadyne: sys_socket[PID: 3192 (fw3)]: family:10, type:524289, protocol:17
[   64.286017] firmadyne: sys_socket[PID: 3192 (fw3)]: family:10, type:524289, protocol:17
[   64.286573] firmadyne: sys_socket[PID: 3192 (fw3)]: family:10, type:524289, protocol:17
[   64.286880] firmadyne: sys_socket[PID: 3192 (fw3)]: family:10, type:524289, protocol:17
[   64.289100] firmadyne: sys_socket[PID: 3192 (fw3)]: family:10, type:524289, protocol:17
[   64.289447] firmadyne: sys_socket[PID: 3192 (fw3)]: family:10, type:524289, protocol:17
[   64.289804] firmadyne: sys_socket[PID: 3192 (fw3)]: family:10, type:524289, protocol:17
[   64.290095] firmadyne: sys_socket[PID: 3192 (fw3)]: family:10, type:524289, protocol:17
[   64.296851] firmadyne: sys_setsockopt[PID: 3192 (fw3)]: fd:13, level:41, optname:64
[   64.303879] firmadyne: sys_socket[PID: 3192 (fw3)]: family:10, type:3, protocol:255
[   64.304454] firmadyne: sys_socket[PID: 3192 (fw3)]: family:10, type:3, protocol:255
[   64.305048] firmadyne: sys_socket[PID: 3192 (fw3)]: family:16, type:524291, protocol:0
[   64.317360] firmadyne: sys_socket[PID: 3197 (gcom)]: family:1, type:524289, protocol:0
[   64.341236] firmadyne: sys_socket[PID: 1 (procd)]: family:1, type:524289, protocol:0
[   64.386093] firmadyne: sys_socket[PID: 3202 (ipset)]: family:16, type:3, protocol:12
[   64.405423] firmadyne: sys_socket[PID: 3205 (ipset)]: family:16, type:3, protocol:12
[   64.436043] firmadyne: sys_socket[PID: 3209 (ipset)]: family:16, type:3, protocol:12
[   64.453263] firmadyne: sys_socket[PID: 3212 (ipset)]: family:16, type:3, protocol:12
[   64.470822] firmadyne: sys_socket[PID: 3215 (ipset)]: family:16, type:3, protocol:12
[   64.488329] firmadyne: sys_socket[PID: 3218 (ipset)]: family:16, type:3, protocol:12
[   64.498542] firmadyne: sys_socket[PID: 3221 (ipset)]: family:16, type:3, protocol:12
[   64.515606] firmadyne: sys_socket[PID: 3224 (ipset)]: family:16, type:3, protocol:12
[   64.567731] firmadyne: sys_socket[PID: 3228 (mosquitto)]: family:2, type:2, protocol:0
[   64.596937] firmadyne: sys_socket[PID: 3229 (iptables)]: family:1, type:2, protocol:0
[   64.597666] firmadyne: sys_socket[PID: 3229 (iptables)]: family:2, type:3, protocol:255
[   64.605458] firmadyne: sys_setsockopt[PID: 3229 (iptables)]: fd:1, level:0, optname:64
[   64.606023] firmadyne: sys_setsockopt[PID: 3229 (iptables)]: fd:1, level:0, optname:65
[   64.610333] firmadyne: sys_socket[PID: 3228 (mosquitto)]: family:1, type:524290, protocol:0
[   64.632384] firmadyne: sys_socket[PID: 3228 (mosquitto)]: family:1, type:524289, protocol:0
[   64.636416] firmadyne: sys_socket[PID: 3230 (iptables)]: family:1, type:2, protocol:0
[   64.636897] firmadyne: sys_socket[PID: 3230 (iptables)]: family:2, type:3, protocol:255
[   64.644009] firmadyne: sys_socket[PID: 3228 (mosquitto)]: family:2, type:2, protocol:6
[   64.644392] firmadyne: sys_setsockopt[PID: 3228 (mosquitto)]: fd:5, level:65535, optname:4
[   64.644845] firmadyne: sys_setsockopt[PID: 3228 (mosquitto)]: fd:5, level:41, optname:26
[   64.645367] firmadyne: inet_bind[PID: 3228 (mosquitto)]: proto:SOCK_STREAM, port:1883
[   64.646806] firmadyne: sys_socket[PID: 3228 (mosquitto)]: family:2, type:2, protocol:6
[   64.655149] firmadyne: sys_setsockopt[PID: 3228 (mosquitto)]: fd:6, level:65535, optname:4
[   64.655432] firmadyne: sys_setsockopt[PID: 3228 (mosquitto)]: fd:6, level:41, optname:26
[   64.655718] firmadyne: inet_bind[PID: 3228 (mosquitto)]: proto:SOCK_STREAM, port:8883
[   64.690031] firmadyne: sys_socket[PID: 3231 (ip6tables)]: family:1, type:2, protocol:0
[   64.690511] firmadyne: sys_socket[PID: 3231 (ip6tables)]: family:10, type:3, protocol:255
[   64.694511] firmadyne: sys_setsockopt[PID: 3231 (ip6tables)]: fd:1, level:41, optname:64
[   64.695081] firmadyne: sys_setsockopt[PID: 3231 (ip6tables)]: fd:1, level:41, optname:65
[   64.717199] firmadyne: sys_socket[PID: 3232 (ip6tables)]: family:1, type:2, protocol:0
[   64.717644] firmadyne: sys_socket[PID: 3232 (ip6tables)]: family:10, type:3, protocol:255
[   64.742987] firmadyne: sys_socket[PID: 3233 (iptables)]: family:1, type:2, protocol:0
[   64.743584] firmadyne: sys_socket[PID: 3233 (iptables)]: family:2, type:3, protocol:255
[   64.746254] firmadyne: sys_setsockopt[PID: 3233 (iptables)]: fd:1, level:0, optname:64
[   64.746792] firmadyne: sys_setsockopt[PID: 3233 (iptables)]: fd:1, level:0, optname:65
[   64.766779] firmadyne: sys_socket[PID: 3234 (iptables)]: family:1, type:2, protocol:0
[   64.767444] firmadyne: sys_socket[PID: 3234 (iptables)]: family:2, type:3, protocol:255
[   64.770349] firmadyne: sys_setsockopt[PID: 3234 (iptables)]: fd:1, level:0, optname:64
[   64.770877] firmadyne: sys_setsockopt[PID: 3234 (iptables)]: fd:1, level:0, optname:65
[   64.791357] firmadyne: sys_socket[PID: 3235 (ip6tables)]: family:1, type:2, protocol:0
[   64.791804] firmadyne: sys_socket[PID: 3235 (ip6tables)]: family:10, type:3, protocol:255
[   64.794390] firmadyne: sys_setsockopt[PID: 3235 (ip6tables)]: fd:1, level:41, optname:64
[   64.794892] firmadyne: sys_setsockopt[PID: 3235 (ip6tables)]: fd:1, level:41, optname:65
[   64.814817] firmadyne: sys_socket[PID: 3236 (ip6tables)]: family:1, type:2, protocol:0
[   64.815307] firmadyne: sys_socket[PID: 3236 (ip6tables)]: family:10, type:3, protocol:255
[   64.817902] firmadyne: sys_setsockopt[PID: 3236 (ip6tables)]: fd:1, level:41, optname:64
[   64.818375] firmadyne: sys_setsockopt[PID: 3236 (ip6tables)]: fd:1, level:41, optname:65
[   64.880010] firmadyne: sys_socket[PID: 3239 (iptables)]: family:1, type:2, protocol:0
[   64.880433] firmadyne: sys_socket[PID: 3239 (iptables)]: family:2, type:3, protocol:255
[   64.882977] firmadyne: sys_setsockopt[PID: 3239 (iptables)]: fd:1, level:0, optname:64
[   64.883841] firmadyne: sys_setsockopt[PID: 3239 (iptables)]: fd:1, level:0, optname:65
[   64.906282] firmadyne: sys_socket[PID: 3240 (iptables)]: family:10, type:524289, protocol:17
[   64.907324] firmadyne: sys_socket[PID: 3240 (iptables)]: family:10, type:524289, protocol:17
[   64.910426] firmadyne: sys_socket[PID: 3240 (iptables)]: family:1, type:2, protocol:0
[   64.910871] firmadyne: sys_socket[PID: 3240 (iptables)]: family:2, type:3, protocol:255
[   64.914018] firmadyne: sys_setsockopt[PID: 3240 (iptables)]: fd:1, level:0, optname:64
[   64.914617] firmadyne: sys_setsockopt[PID: 3240 (iptables)]: fd:1, level:0, optname:65
[   64.946629] firmadyne: sys_socket[PID: 3241 (iptables)]: family:1, type:2, protocol:0
[   64.947403] firmadyne: sys_socket[PID: 3241 (iptables)]: family:2, type:3, protocol:255
[   64.950147] firmadyne: sys_setsockopt[PID: 3241 (iptables)]: fd:1, level:0, optname:64
[   64.950747] firmadyne: sys_setsockopt[PID: 3241 (iptables)]: fd:1, level:0, optname:65
[   64.974165] firmadyne: sys_socket[PID: 3242 (ip6tables)]: family:1, type:2, protocol:0
[   64.975784] firmadyne: sys_socket[PID: 3242 (ip6tables)]: family:10, type:3, protocol:255
[   64.978358] firmadyne: sys_setsockopt[PID: 3242 (ip6tables)]: fd:1, level:41, optname:64
[   64.978865] firmadyne: sys_setsockopt[PID: 3242 (ip6tables)]: fd:1, level:41, optname:65
[   64.992507] firmadyne: inet_accept[PID: 2339 (uhttpd)]:
[   64.992810] firmadyne: inet_accept[PID: 2339 (uhttpd)]:
[   64.993004] firmadyne: inet_accept[PID: 2339 (uhttpd)]:
[   64.993192] firmadyne: inet_accept[PID: 2339 (uhttpd)]:
[   64.993375] firmadyne: inet_accept[PID: 2339 (uhttpd)]:
[   64.993590] firmadyne: inet_accept[PID: 2339 (uhttpd)]:
[   65.009183] firmadyne: sys_socket[PID: 3243 (ip6tables)]: family:10, type:524289, protocol:17
[   65.009889] firmadyne: sys_socket[PID: 3243 (ip6tables)]: family:10, type:524289, protocol:17
[   65.013500] firmadyne: sys_socket[PID: 3243 (ip6tables)]: family:1, type:2, protocol:0
[   65.013892] firmadyne: sys_socket[PID: 3243 (ip6tables)]: family:10, type:3, protocol:255
[   65.016949] firmadyne: sys_setsockopt[PID: 3243 (ip6tables)]: fd:1, level:41, optname:64
[   65.017517] firmadyne: sys_setsockopt[PID: 3243 (ip6tables)]: fd:1, level:41, optname:65
[   65.040322] firmadyne: sys_socket[PID: 3244 (ip6tables)]: family:1, type:2, protocol:0
[   65.040764] firmadyne: sys_socket[PID: 3244 (ip6tables)]: family:10, type:3, protocol:255
[   65.043689] firmadyne: sys_setsockopt[PID: 3244 (ip6tables)]: fd:1, level:41, optname:64
[   65.044254] firmadyne: sys_setsockopt[PID: 3244 (ip6tables)]: fd:1, level:41, optname:65
[   65.088206] firmadyne: sys_socket[PID: 3246 (iptables)]: family:1, type:2, protocol:0
[   65.088705] firmadyne: sys_socket[PID: 3246 (iptables)]: family:2, type:3, protocol:255
[   65.092193] firmadyne: sys_setsockopt[PID: 3246 (iptables)]: fd:1, level:0, optname:64
[   65.092793] firmadyne: sys_setsockopt[PID: 3246 (iptables)]: fd:1, level:0, optname:65
[   65.114437] firmadyne: sys_socket[PID: 3247 (ip6tables)]: family:1, type:2, protocol:0
[   65.114880] firmadyne: sys_socket[PID: 3247 (ip6tables)]: family:10, type:3, protocol:255
[   65.118156] firmadyne: sys_setsockopt[PID: 3247 (ip6tables)]: fd:1, level:41, optname:64
[   65.118764] firmadyne: sys_setsockopt[PID: 3247 (ip6tables)]: fd:1, level:41, optname:65
[   65.163505] firmadyne: sys_socket[PID: 3249 (iptables)]: family:1, type:2, protocol:0
[   65.163982] firmadyne: sys_socket[PID: 3249 (iptables)]: family:2, type:3, protocol:255
[   65.166553] firmadyne: sys_setsockopt[PID: 3249 (iptables)]: fd:1, level:0, optname:64
[   65.167318] firmadyne: sys_setsockopt[PID: 3249 (iptables)]: fd:1, level:0, optname:65
[   65.189778] firmadyne: sys_socket[PID: 3250 (iptables)]: family:1, type:2, protocol:0
[   65.190219] firmadyne: sys_socket[PID: 3250 (iptables)]: family:2, type:3, protocol:255
[   65.201312] firmadyne: sys_setsockopt[PID: 3250 (iptables)]: fd:1, level:0, optname:64
[   65.201859] firmadyne: sys_setsockopt[PID: 3250 (iptables)]: fd:1, level:0, optname:65
[   65.215315] firmadyne: sys_socket[PID: 3251 (ifconfig)]: family:2, type:1, protocol:0
[   65.216902] firmadyne: __inet_insert_ifa[PID: 3251 (ifconfig)]: device:eth1 ifa:0x00000000
[   65.254618] firmadyne: sys_socket[PID: 3252 (iptables)]: family:1, type:2, protocol:0
[   65.256975] firmadyne: sys_socket[PID: 3253 (brctl)]: family:2, type:2, protocol:0
[   65.257847] firmadyne: sys_socket[PID: 3253 (brctl)]: family:1, type:524289, protocol:0
[   65.258673] firmadyne: sys_socket[PID: 3253 (brctl)]: family:1, type:524289, protocol:0
[   65.259000] firmadyne: sys_socket[PID: 3253 (brctl)]: family:1, type:524289, protocol:0
[   65.263216] firmadyne: sys_socket[PID: 3252 (iptables)]: family:2, type:3, protocol:255
[   65.266179] firmadyne: sys_setsockopt[PID: 3252 (iptables)]: fd:1, level:0, optname:64
[   65.266693] firmadyne: sys_setsockopt[PID: 3252 (iptables)]: fd:1, level:0, optname:65
[   65.304429] firmadyne: sys_socket[PID: 3256 (iptables)]: family:1, type:2, protocol:0
[   65.304947] firmadyne: sys_socket[PID: 3256 (iptables)]: family:2, type:3, protocol:255
[   65.319634] firmadyne: sys_socket[PID: 3255 (iptables)]: family:1, type:2, protocol:0
[   65.320111] firmadyne: sys_socket[PID: 3255 (iptables)]: family:2, type:3, protocol:255
[   65.372180] firmadyne: sys_socket[PID: 3258 (iptables)]: family:1, type:2, protocol:0
[   65.372644] firmadyne: sys_socket[PID: 3258 (iptables)]: family:2, type:3, protocol:255
[   65.423817] firmadyne: sys_socket[PID: 3259 (iptables)]: family:1, type:2, protocol:0
[   65.424282] firmadyne: sys_socket[PID: 3259 (iptables)]: family:2, type:3, protocol:255
[   65.476177] firmadyne: sys_socket[PID: 3260 (iptables)]: family:1, type:2, protocol:0
[   65.476660] firmadyne: sys_socket[PID: 3260 (iptables)]: family:2, type:3, protocol:255
[   65.666639] firmadyne: sys_socket[PID: 3268 (iptables)]: family:1, type:2, protocol:0
[   65.667400] firmadyne: sys_socket[PID: 3268 (iptables)]: family:2, type:3, protocol:255
[   65.694714] firmadyne: sys_socket[PID: 3269 (iptables)]: family:1, type:2, protocol:0
[   65.695381] firmadyne: sys_socket[PID: 3269 (iptables)]: family:2, type:3, protocol:255
[   65.697807] firmadyne: sys_setsockopt[PID: 3269 (iptables)]: fd:1, level:0, optname:64
[   65.724836] firmadyne: sys_socket[PID: 3272 (iptables)]: family:1, type:2, protocol:0
[   65.725315] firmadyne: sys_socket[PID: 3272 (iptables)]: family:2, type:3, protocol:255
[   65.745707] firmadyne: sys_socket[PID: 3273 (iptables)]: family:1, type:2, protocol:0
[   65.746149] firmadyne: sys_socket[PID: 3273 (iptables)]: family:2, type:3, protocol:255
[   65.773313] firmadyne: sys_socket[PID: 3274 (iptables)]: family:1, type:2, protocol:0
[   65.773796] firmadyne: sys_socket[PID: 3274 (iptables)]: family:2, type:3, protocol:255
[   65.940760] firmadyne: sys_socket[PID: 3283 (iptables)]: family:1, type:2, protocol:0
[   65.941277] firmadyne: sys_socket[PID: 3283 (iptables)]: family:2, type:3, protocol:255
[   65.957640] firmadyne: sys_socket[PID: 3284 (iptables)]: family:1, type:2, protocol:0
[   65.958091] firmadyne: sys_socket[PID: 3284 (iptables)]: family:2, type:3, protocol:255
[   65.980014] firmadyne: sys_socket[PID: 3285 (iptables)]: family:1, type:2, protocol:0
[   65.980465] firmadyne: sys_socket[PID: 3285 (iptables)]: family:2, type:3, protocol:255
[   66.002430] firmadyne: sys_socket[PID: 3286 (iptables)]: family:1, type:2, protocol:0
[   66.002919] firmadyne: sys_socket[PID: 3286 (iptables)]: family:2, type:3, protocol:255
[   66.017777] firmadyne: sys_socket[PID: 3287 (iptables)]: family:1, type:2, protocol:0
[   66.018220] firmadyne: sys_socket[PID: 3287 (iptables)]: family:2, type:3, protocol:255
[   66.040113] firmadyne: sys_socket[PID: 3288 (iptables)]: family:1, type:2, protocol:0
[   66.040594] firmadyne: sys_socket[PID: 3288 (iptables)]: family:2, type:3, protocol:255
[   66.151926] firmadyne: sys_socket[PID: 3293 (ubus)]: family:1, type:2, protocol:0
[   66.228319] firmadyne: sys_socket[PID: 3296 (logger)]: family:1, type:524289, protocol:0
[   66.251561] firmadyne: sys_socket[PID: 3297 (iptables)]: family:1, type:2, protocol:0
[   66.252011] firmadyne: sys_socket[PID: 3297 (iptables)]: family:2, type:3, protocol:255
[   66.265912] firmadyne: sys_socket[PID: 3298 (iptables)]: family:1, type:2, protocol:0
[   66.266383] firmadyne: sys_socket[PID: 3298 (iptables)]: family:2, type:3, protocol:255
[   66.287321] firmadyne: sys_socket[PID: 3299 (iptables)]: family:1, type:2, protocol:0
[   66.287789] firmadyne: sys_socket[PID: 3299 (iptables)]: family:2, type:3, protocol:255
[   66.305394] firmadyne: sys_socket[PID: 3300 (ip)]: family:16, type:524291, protocol:0
[   66.305783] firmadyne: sys_setsockopt[PID: 3300 (ip)]: fd:0, level:65535, optname:4097
[   66.306108] firmadyne: sys_setsockopt[PID: 3300 (ip)]: fd:0, level:65535, optname:4098
[   66.328731] firmadyne: sys_socket[PID: 3301 (ipset)]: family:16, type:3, protocol:12
[   66.346074] firmadyne: sys_socket[PID: 3304 (ipset)]: family:16, type:3, protocol:12
[   66.363775] firmadyne: sys_socket[PID: 3307 (ipset)]: family:16, type:3, protocol:12
[   66.381017] firmadyne: sys_socket[PID: 3310 (ipset)]: family:16, type:3, protocol:12
[   66.398446] firmadyne: sys_socket[PID: 3313 (ipset)]: family:16, type:3, protocol:12
[   66.415742] firmadyne: sys_socket[PID: 3316 (ipset)]: family:16, type:3, protocol:12
[   66.458394] firmadyne: sys_socket[PID: 3320 (ipset)]: family:16, type:3, protocol:12
[   66.476037] firmadyne: sys_socket[PID: 3323 (ipset)]: family:16, type:3, protocol:12
[   66.607459] firmadyne: sys_socket[PID: 3331 (iptables)]: family:1, type:2, protocol:0
[   66.607959] firmadyne: sys_socket[PID: 3331 (iptables)]: family:2, type:3, protocol:255
[   66.629874] firmadyne: sys_socket[PID: 3332 (iptables)]: family:1, type:2, protocol:0
[   66.630340] firmadyne: sys_socket[PID: 3332 (iptables)]: family:2, type:3, protocol:255
[   66.632069] firmadyne: sys_socket[PID: 3332 (iptables)]: family:2, type:3, protocol:255
[   66.652520] firmadyne: sys_socket[PID: 3337 (iptables)]: family:1, type:2, protocol:0
[   66.653050] firmadyne: sys_socket[PID: 3337 (iptables)]: family:2, type:3, protocol:255
[   66.654140] firmadyne: sys_socket[PID: 3337 (iptables)]: family:2, type:3, protocol:255
[   66.674915] firmadyne: sys_socket[PID: 3342 (ip6tables)]: family:1, type:2, protocol:0
[   66.675402] firmadyne: sys_socket[PID: 3342 (ip6tables)]: family:10, type:3, protocol:255
[   66.749200] firmadyne: sys_socket[PID: 3346 (iptables)]: family:1, type:2, protocol:0
[   66.749703] firmadyne: sys_socket[PID: 3346 (iptables)]: family:2, type:3, protocol:255
[   66.775753] firmadyne: sys_socket[PID: 3348 (iptables)]: family:1, type:2, protocol:0
[   66.776231] firmadyne: sys_socket[PID: 3348 (iptables)]: family:2, type:3, protocol:255
[   66.799660] firmadyne: sys_socket[PID: 3349 (iptables)]: family:1, type:2, protocol:0
[   66.800126] firmadyne: sys_socket[PID: 3349 (iptables)]: family:2, type:3, protocol:255
[   66.801262] firmadyne: sys_socket[PID: 3349 (iptables)]: family:2, type:3, protocol:255
[   66.834047] firmadyne: sys_socket[PID: 3355 (iptables)]: family:1, type:2, protocol:0
[   66.834507] firmadyne: sys_socket[PID: 3355 (iptables)]: family:2, type:3, protocol:255
[   66.835878] firmadyne: sys_socket[PID: 3355 (iptables)]: family:2, type:3, protocol:255
[   66.858577] firmadyne: sys_socket[PID: 3361 (iptables)]: family:1, type:2, protocol:0
[   66.859042] firmadyne: sys_socket[PID: 3361 (iptables)]: family:2, type:3, protocol:255
[   66.860373] firmadyne: sys_socket[PID: 3361 (iptables)]: family:2, type:3, protocol:255
[   66.884782] firmadyne: sys_socket[PID: 3367 (ip6tables)]: family:1, type:2, protocol:0
[   66.885200] firmadyne: sys_socket[PID: 3367 (ip6tables)]: family:10, type:3, protocol:255
[   66.909216] firmadyne: sys_socket[PID: 3369 (ip6tables)]: family:1, type:2, protocol:0
[   66.909660] firmadyne: sys_socket[PID: 3369 (ip6tables)]: family:10, type:3, protocol:255
[   66.915700] firmadyne: sys_socket[PID: 3192 (fw3)]: family:16, type:524291, protocol:0
[   67.013225] firmadyne: inet_accept[PID: 2339 (uhttpd)]:
[   67.013593] firmadyne: inet_accept[PID: 2339 (uhttpd)]:
[   67.013799] firmadyne: inet_accept[PID: 2339 (uhttpd)]:
[   67.013988] firmadyne: inet_accept[PID: 2339 (uhttpd)]:
[   67.014176] firmadyne: inet_accept[PID: 2339 (uhttpd)]:
[   67.014362] firmadyne: inet_accept[PID: 2339 (uhttpd)]:
```
