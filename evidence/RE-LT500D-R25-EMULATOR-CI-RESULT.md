# RE-LT500D R25 emulator CI result

Commit: b779a7e215be3452fe69a582c5ad49ea2c5c2cc9
Firmware download/verify: success
Image build: success
QEMU/HTTP gate: failure
Run: https://github.com/diablomike20/Router-Emulator/actions/runs/35433171895

## HTTP headers
```text
HTTP/1.1 200 OK
Connection: Keep-Alive
Keep-Alive: timeout=20
ETag: "a19-25c-6890597d"
Last-Modified: Mon, 04 Aug 2025 06:55:57 GMT
Date: Sat, 19 Sep 2026 08:53:53 GMT
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
candidate=/cgi-bin/luci/
hop=1 scheme=http path=/cgi-bin/luci/ status=403
candidate=/cgi-bin/luci/admin
hop=1 scheme=http path=/cgi-bin/luci/admin status=403
https_static=200
[LT500D-EMU] LT500D_LAN_UCI_GATE=PASS network.lan.ipaddr=192.168.10.2
[LT500D-EMU] LT500D_LAN_IP_GATE=PASS br-lan=192.168.10.2
```

## Serial tail
```text
[   66.492934] firmadyne: sys_socket[PID: 3136 (fw3)]: family:10, type:524289, protocol:17
[   66.493575] firmadyne: sys_socket[PID: 3136 (fw3)]: family:10, type:524289, protocol:17
[   66.493889] firmadyne: sys_socket[PID: 3136 (fw3)]: family:10, type:524289, protocol:17
[   66.494972] firmadyne: sys_socket[PID: 3136 (fw3)]: family:10, type:524289, protocol:17
[   66.495780] firmadyne: sys_socket[PID: 3136 (fw3)]: family:10, type:524289, protocol:17
[   66.496229] firmadyne: sys_socket[PID: 3136 (fw3)]: family:10, type:524289, protocol:17
[   66.496560] firmadyne: sys_socket[PID: 3136 (fw3)]: family:10, type:524289, protocol:17
[   66.501558] firmadyne: sys_setsockopt[PID: 3136 (fw3)]: fd:7, level:0, optname:64
[   66.504548] firmadyne: sys_socket[PID: 3136 (fw3)]: family:2, type:3, protocol:255
[   66.505238] firmadyne: sys_socket[PID: 3136 (fw3)]: family:2, type:3, protocol:255
[   66.505980] firmadyne: sys_socket[PID: 3136 (fw3)]: family:10, type:3, protocol:255
[   66.512437] firmadyne: sys_setsockopt[PID: 3136 (fw3)]: fd:10, level:41, optname:64
[   66.514122] firmadyne: sys_setsockopt[PID: 3136 (fw3)]: fd:10, level:41, optname:65
[   66.514896] firmadyne: sys_socket[PID: 3136 (fw3)]: family:10, type:3, protocol:255
[   66.515809] firmadyne: sys_socket[PID: 3136 (fw3)]: family:10, type:3, protocol:255
[   66.516359] firmadyne: sys_socket[PID: 3136 (fw3)]: family:10, type:3, protocol:255
[   66.520136] firmadyne: sys_socket[PID: 3136 (fw3)]: family:10, type:524289, protocol:17
[   66.520535] firmadyne: sys_socket[PID: 3136 (fw3)]: family:10, type:524289, protocol:17
[   66.523926] firmadyne: sys_socket[PID: 3136 (fw3)]: family:10, type:524289, protocol:17
[   66.524312] firmadyne: sys_socket[PID: 3136 (fw3)]: family:10, type:524289, protocol:17
[   66.524753] firmadyne: sys_socket[PID: 3136 (fw3)]: family:10, type:524289, protocol:17
[   66.525061] firmadyne: sys_socket[PID: 3136 (fw3)]: family:10, type:524289, protocol:17
[   66.525587] firmadyne: sys_socket[PID: 3136 (fw3)]: family:10, type:524289, protocol:17
[   66.525890] firmadyne: sys_socket[PID: 3136 (fw3)]: family:10, type:524289, protocol:17
[   66.526336] firmadyne: sys_socket[PID: 3136 (fw3)]: family:10, type:524289, protocol:17
[   66.526644] firmadyne: sys_socket[PID: 3136 (fw3)]: family:10, type:524289, protocol:17
[   66.527669] firmadyne: sys_socket[PID: 3136 (fw3)]: family:10, type:524289, protocol:17
[   66.528015] firmadyne: sys_socket[PID: 3136 (fw3)]: family:10, type:524289, protocol:17
[   66.528768] firmadyne: sys_socket[PID: 3136 (fw3)]: family:10, type:524289, protocol:17
[   66.529111] firmadyne: sys_socket[PID: 3136 (fw3)]: family:10, type:524289, protocol:17
[   66.529466] firmadyne: sys_socket[PID: 3136 (fw3)]: family:10, type:524289, protocol:17
[   66.529765] firmadyne: sys_socket[PID: 3136 (fw3)]: family:10, type:524289, protocol:17
[   66.532762] firmadyne: sys_setsockopt[PID: 3136 (fw3)]: fd:13, level:41, optname:64
[   66.534081] firmadyne: sys_socket[PID: 3136 (fw3)]: family:10, type:3, protocol:255
[   66.534691] firmadyne: sys_socket[PID: 3136 (fw3)]: family:10, type:3, protocol:255
[   66.535607] firmadyne: sys_socket[PID: 3136 (fw3)]: family:16, type:524291, protocol:0
[   66.544134] firmadyne: inet_accept[PID: 2487 (uhttpd)]:
[   66.544548] firmadyne: inet_accept[PID: 2487 (uhttpd)]:
[   66.544759] firmadyne: inet_accept[PID: 2487 (uhttpd)]:
[   66.620755] firmadyne: sys_socket[PID: 3150 (ipset)]: family:16, type:3, protocol:12
[   66.641153] firmadyne: sys_socket[PID: 3153 (ipset)]: family:16, type:3, protocol:12
[   66.673214] firmadyne: sys_socket[PID: 3157 (ipset)]: family:16, type:3, protocol:12
[   66.691534] firmadyne: sys_socket[PID: 3160 (ipset)]: family:16, type:3, protocol:12
[   66.710024] firmadyne: sys_socket[PID: 3163 (ipset)]: family:16, type:3, protocol:12
[   66.729150] firmadyne: sys_socket[PID: 3166 (ipset)]: family:16, type:3, protocol:12
[   66.748083] firmadyne: sys_socket[PID: 3169 (ipset)]: family:16, type:3, protocol:12
[   66.766536] firmadyne: sys_socket[PID: 3172 (ipset)]: family:16, type:3, protocol:12
[   66.822197] firmadyne: sys_socket[PID: 3176 (iptables)]: family:1, type:2, protocol:0
[   66.823825] firmadyne: sys_socket[PID: 3176 (iptables)]: family:2, type:3, protocol:255
[   66.829236] firmadyne: sys_setsockopt[PID: 3176 (iptables)]: fd:1, level:0, optname:64
[   66.829824] firmadyne: sys_setsockopt[PID: 3176 (iptables)]: fd:1, level:0, optname:65
[   66.862742] firmadyne: sys_socket[PID: 3177 (iptables)]: family:1, type:2, protocol:0
[   66.863581] firmadyne: sys_socket[PID: 3177 (iptables)]: family:2, type:3, protocol:255
[   66.890996] firmadyne: sys_socket[PID: 3178 (ip6tables)]: family:1, type:2, protocol:0
[   66.891632] firmadyne: sys_socket[PID: 3178 (ip6tables)]: family:10, type:3, protocol:255
[   66.895644] firmadyne: sys_setsockopt[PID: 3178 (ip6tables)]: fd:1, level:41, optname:64
[   66.896206] firmadyne: sys_setsockopt[PID: 3178 (ip6tables)]: fd:1, level:41, optname:65
[   66.918824] firmadyne: sys_socket[PID: 3179 (ip6tables)]: family:1, type:2, protocol:0
[   66.919363] firmadyne: sys_socket[PID: 3179 (ip6tables)]: family:10, type:3, protocol:255
[   66.942327] firmadyne: sys_socket[PID: 3180 (iptables)]: family:1, type:2, protocol:0
[   66.942828] firmadyne: sys_socket[PID: 3180 (iptables)]: family:2, type:3, protocol:255
[   66.945875] firmadyne: sys_setsockopt[PID: 3180 (iptables)]: fd:1, level:0, optname:64
[   66.946426] firmadyne: sys_setsockopt[PID: 3180 (iptables)]: fd:1, level:0, optname:65
[   66.967634] firmadyne: sys_socket[PID: 3181 (iptables)]: family:1, type:2, protocol:0
[   66.968110] firmadyne: sys_socket[PID: 3181 (iptables)]: family:2, type:3, protocol:255
[   66.970998] firmadyne: sys_setsockopt[PID: 3181 (iptables)]: fd:1, level:0, optname:64
[   66.971913] firmadyne: sys_setsockopt[PID: 3181 (iptables)]: fd:1, level:0, optname:65
[   66.992131] firmadyne: sys_socket[PID: 3182 (ip6tables)]: family:1, type:2, protocol:0
[   66.992616] firmadyne: sys_socket[PID: 3182 (ip6tables)]: family:10, type:3, protocol:255
[   66.999411] firmadyne: sys_setsockopt[PID: 3182 (ip6tables)]: fd:1, level:41, optname:64
[   66.999904] firmadyne: sys_setsockopt[PID: 3182 (ip6tables)]: fd:1, level:41, optname:65
[   67.015965] firmadyne: sys_socket[PID: 3184 (ifconfig)]: family:2, type:1, protocol:0
[   67.017494] firmadyne: __inet_insert_ifa[PID: 3184 (ifconfig)]: device:eth1 ifa:0x00000000
[   67.045142] firmadyne: sys_socket[PID: 3183 (ip6tables)]: family:1, type:2, protocol:0
[   67.045625] firmadyne: sys_socket[PID: 3183 (ip6tables)]: family:10, type:3, protocol:255
[   67.056335] firmadyne: sys_setsockopt[PID: 3183 (ip6tables)]: fd:1, level:41, optname:64
[   67.056836] firmadyne: sys_setsockopt[PID: 3183 (ip6tables)]: fd:1, level:41, optname:65
[   67.067153] firmadyne: sys_socket[PID: 3185 (brctl)]: family:2, type:2, protocol:0
[   67.068123] firmadyne: sys_socket[PID: 3185 (brctl)]: family:1, type:524289, protocol:0
[   67.068976] firmadyne: sys_socket[PID: 3185 (brctl)]: family:1, type:524289, protocol:0
[   67.069343] firmadyne: sys_socket[PID: 3185 (brctl)]: family:1, type:524289, protocol:0
[   67.118571] firmadyne: sys_socket[PID: 3188 (iptables)]: family:1, type:2, protocol:0
[   67.127121] firmadyne: sys_socket[PID: 3188 (iptables)]: family:2, type:3, protocol:255
[   67.179469] firmadyne: sys_socket[PID: 3190 (iptables)]: family:1, type:2, protocol:0
[   67.179977] firmadyne: sys_socket[PID: 3190 (iptables)]: family:2, type:3, protocol:255
[   67.204874] firmadyne: sys_socket[PID: 3191 (iptables)]: family:1, type:2, protocol:0
[   67.205429] firmadyne: sys_socket[PID: 3191 (iptables)]: family:2, type:3, protocol:255
[   67.212314] firmadyne: sys_setsockopt[PID: 3191 (iptables)]: fd:1, level:0, optname:64
[   67.212861] firmadyne: sys_setsockopt[PID: 3191 (iptables)]: fd:1, level:0, optname:65
[   67.232678] firmadyne: sys_socket[PID: 3192 (iptables)]: family:1, type:2, protocol:0
[   67.233180] firmadyne: sys_socket[PID: 3192 (iptables)]: family:2, type:3, protocol:255
[   67.254614] firmadyne: sys_socket[PID: 3193 (iptables)]: family:10, type:524289, protocol:17
[   67.259410] firmadyne: sys_socket[PID: 3193 (iptables)]: family:10, type:524289, protocol:17
[   67.262401] firmadyne: sys_socket[PID: 3193 (iptables)]: family:1, type:2, protocol:0
[   67.262882] firmadyne: sys_socket[PID: 3193 (iptables)]: family:2, type:3, protocol:255
[   67.273605] firmadyne: sys_setsockopt[PID: 3193 (iptables)]: fd:1, level:0, optname:64
[   67.274232] firmadyne: sys_setsockopt[PID: 3193 (iptables)]: fd:1, level:0, optname:65
[   67.288763] firmadyne: sys_socket[PID: 3194 (iptables)]: family:1, type:2, protocol:0
[   67.289280] firmadyne: sys_socket[PID: 3194 (iptables)]: family:2, type:3, protocol:255
[   67.322812] firmadyne: sys_socket[PID: 3195 (iptables)]: family:1, type:2, protocol:0
[   67.323832] firmadyne: sys_socket[PID: 3195 (iptables)]: family:2, type:3, protocol:255
[   67.326655] firmadyne: sys_setsockopt[PID: 3195 (iptables)]: fd:1, level:0, optname:64
[   67.327625] firmadyne: sys_setsockopt[PID: 3195 (iptables)]: fd:1, level:0, optname:65
[   67.348983] firmadyne: sys_socket[PID: 3197 (ip6tables)]: family:1, type:2, protocol:0
[   67.349495] firmadyne: sys_socket[PID: 3197 (ip6tables)]: family:10, type:3, protocol:255
[   67.352405] firmadyne: sys_setsockopt[PID: 3197 (ip6tables)]: fd:1, level:41, optname:64
[   67.352911] firmadyne: sys_setsockopt[PID: 3197 (ip6tables)]: fd:1, level:41, optname:65
[   67.379812] firmadyne: sys_socket[PID: 3198 (ip6tables)]: family:10, type:524289, protocol:17
[   67.380636] firmadyne: sys_socket[PID: 3198 (ip6tables)]: family:10, type:524289, protocol:17
[   67.384137] firmadyne: sys_socket[PID: 3198 (ip6tables)]: family:1, type:2, protocol:0
[   67.384577] firmadyne: sys_socket[PID: 3198 (ip6tables)]: family:10, type:3, protocol:255
[   67.387730] firmadyne: sys_setsockopt[PID: 3198 (ip6tables)]: fd:1, level:41, optname:64
[   67.388335] firmadyne: sys_setsockopt[PID: 3198 (ip6tables)]: fd:1, level:41, optname:65
[   67.412620] firmadyne: sys_socket[PID: 3199 (ip6tables)]: family:1, type:2, protocol:0
[   67.413106] firmadyne: sys_socket[PID: 3199 (ip6tables)]: family:10, type:3, protocol:255
[   67.416220] firmadyne: sys_setsockopt[PID: 3199 (ip6tables)]: fd:1, level:41, optname:64
[   67.416835] firmadyne: sys_setsockopt[PID: 3199 (ip6tables)]: fd:1, level:41, optname:65
[   67.462653] firmadyne: sys_socket[PID: 3201 (iptables)]: family:1, type:2, protocol:0
[   67.463458] firmadyne: sys_socket[PID: 3201 (iptables)]: family:2, type:3, protocol:255
[   67.466472] firmadyne: sys_setsockopt[PID: 3201 (iptables)]: fd:1, level:0, optname:64
[   67.467335] firmadyne: sys_setsockopt[PID: 3201 (iptables)]: fd:1, level:0, optname:65
[   67.489806] firmadyne: sys_socket[PID: 3202 (ip6tables)]: family:1, type:2, protocol:0
[   67.490302] firmadyne: sys_socket[PID: 3202 (ip6tables)]: family:10, type:3, protocol:255
[   67.493694] firmadyne: sys_setsockopt[PID: 3202 (ip6tables)]: fd:1, level:41, optname:64
[   67.494320] firmadyne: sys_setsockopt[PID: 3202 (ip6tables)]: fd:1, level:41, optname:65
[   67.539106] firmadyne: sys_socket[PID: 3204 (iptables)]: family:1, type:2, protocol:0
[   67.539721] firmadyne: sys_socket[PID: 3204 (iptables)]: family:2, type:3, protocol:255
[   67.542389] firmadyne: sys_setsockopt[PID: 3204 (iptables)]: fd:1, level:0, optname:64
[   67.542930] firmadyne: sys_setsockopt[PID: 3204 (iptables)]: fd:1, level:0, optname:65
[   67.563713] firmadyne: sys_socket[PID: 3205 (iptables)]: family:1, type:2, protocol:0
[   67.564179] firmadyne: sys_socket[PID: 3205 (iptables)]: family:2, type:3, protocol:255
[   67.567886] firmadyne: sys_setsockopt[PID: 3205 (iptables)]: fd:1, level:0, optname:64
[   67.568436] firmadyne: sys_setsockopt[PID: 3205 (iptables)]: fd:1, level:0, optname:65
[   67.589161] firmadyne: sys_socket[PID: 3206 (iptables)]: family:1, type:2, protocol:0
[   67.589675] firmadyne: sys_socket[PID: 3206 (iptables)]: family:2, type:3, protocol:255
[   67.592996] firmadyne: sys_setsockopt[PID: 3206 (iptables)]: fd:1, level:0, optname:64
[   67.593565] firmadyne: sys_setsockopt[PID: 3206 (iptables)]: fd:1, level:0, optname:65
[   67.618254] firmadyne: sys_socket[PID: 3207 (iptables)]: family:1, type:2, protocol:0
[   67.618766] firmadyne: sys_socket[PID: 3207 (iptables)]: family:2, type:3, protocol:255
[   67.872740] firmadyne: sys_socket[PID: 3215 (iptables)]: family:1, type:2, protocol:0
[   67.873245] firmadyne: sys_socket[PID: 3215 (iptables)]: family:2, type:3, protocol:255
[   67.900919] firmadyne: sys_socket[PID: 3216 (iptables)]: family:1, type:2, protocol:0
[   67.901424] firmadyne: sys_socket[PID: 3216 (iptables)]: family:2, type:3, protocol:255
[   67.904214] firmadyne: sys_setsockopt[PID: 3216 (iptables)]: fd:1, level:0, optname:64
[   67.930685] firmadyne: sys_socket[PID: 3219 (iptables)]: family:1, type:2, protocol:0
[   67.931406] firmadyne: sys_socket[PID: 3219 (iptables)]: family:2, type:3, protocol:255
[   67.959499] firmadyne: sys_socket[PID: 3220 (iptables)]: family:1, type:2, protocol:0
[   67.959978] firmadyne: sys_socket[PID: 3220 (iptables)]: family:2, type:3, protocol:255
[   67.988278] firmadyne: sys_socket[PID: 3221 (iptables)]: family:1, type:2, protocol:0
[   67.988779] firmadyne: sys_socket[PID: 3221 (iptables)]: family:2, type:3, protocol:255
[   68.019580] firmadyne: inet_accept[PID: 2487 (uhttpd)]:
[   68.019917] firmadyne: inet_accept[PID: 2487 (uhttpd)]:
[   68.020118] firmadyne: inet_accept[PID: 2487 (uhttpd)]:
[   68.020340] firmadyne: inet_accept[PID: 2487 (uhttpd)]:
[   68.768948] firmadyne: inet_accept[PID: 2487 (uhttpd)]:
[   68.769304] firmadyne: inet_accept[PID: 2487 (uhttpd)]:
[   68.769507] firmadyne: inet_accept[PID: 2487 (uhttpd)]:
[   68.899332] firmadyne: sys_socket[PID: 3231 (iptables)]: family:1, type:2, protocol:0
[   68.899904] firmadyne: sys_socket[PID: 3231 (iptables)]: family:2, type:3, protocol:255
[   68.925315] firmadyne: sys_socket[PID: 3232 (iptables)]: family:1, type:2, protocol:0
[   68.925813] firmadyne: sys_socket[PID: 3232 (iptables)]: family:2, type:3, protocol:255
[   68.949112] firmadyne: sys_socket[PID: 3233 (iptables)]: family:1, type:2, protocol:0
[   68.949653] firmadyne: sys_socket[PID: 3233 (iptables)]: family:2, type:3, protocol:255
[   68.973300] firmadyne: sys_socket[PID: 3234 (iptables)]: family:1, type:2, protocol:0
[   68.973785] firmadyne: sys_socket[PID: 3234 (iptables)]: family:2, type:3, protocol:255
[   68.996214] firmadyne: sys_socket[PID: 3235 (iptables)]: family:1, type:2, protocol:0
[   68.996738] firmadyne: sys_socket[PID: 3235 (iptables)]: family:2, type:3, protocol:255
[   69.019991] firmadyne: sys_socket[PID: 3236 (iptables)]: family:1, type:2, protocol:0
[   69.020487] firmadyne: sys_socket[PID: 3236 (iptables)]: family:2, type:3, protocol:255
[   69.134507] firmadyne: sys_socket[PID: 3241 (ubus)]: family:1, type:2, protocol:0
[   69.214992] firmadyne: sys_socket[PID: 3244 (logger)]: family:1, type:524289, protocol:0
[   69.240179] firmadyne: sys_socket[PID: 3245 (iptables)]: family:1, type:2, protocol:0
[   69.240716] firmadyne: sys_socket[PID: 3245 (iptables)]: family:2, type:3, protocol:255
[   69.263734] firmadyne: sys_socket[PID: 3246 (iptables)]: family:1, type:2, protocol:0
[   69.264283] firmadyne: sys_socket[PID: 3246 (iptables)]: family:2, type:3, protocol:255
[   69.268532] firmadyne: inet_accept[PID: 2487 (uhttpd)]:
[   69.268814] firmadyne: inet_accept[PID: 2487 (uhttpd)]:
[   69.269012] firmadyne: inet_accept[PID: 2487 (uhttpd)]:
[   69.269225] firmadyne: inet_accept[PID: 2487 (uhttpd)]:
[   69.292133] firmadyne: sys_socket[PID: 3247 (iptables)]: family:1, type:2, protocol:0
[   69.292701] firmadyne: sys_socket[PID: 3247 (iptables)]: family:2, type:3, protocol:255
[   69.311797] firmadyne: sys_socket[PID: 3248 (ip)]: family:16, type:524291, protocol:0
[   69.312253] firmadyne: sys_setsockopt[PID: 3248 (ip)]: fd:0, level:65535, optname:4097
[   69.312607] firmadyne: sys_setsockopt[PID: 3248 (ip)]: fd:0, level:65535, optname:4098
[   69.335701] firmadyne: sys_socket[PID: 3249 (ipset)]: family:16, type:3, protocol:12
[   69.354173] firmadyne: sys_socket[PID: 3252 (ipset)]: family:16, type:3, protocol:12
[   69.377254] firmadyne: sys_socket[PID: 3255 (ipset)]: family:16, type:3, protocol:12
[   69.395716] firmadyne: sys_socket[PID: 3258 (ipset)]: family:16, type:3, protocol:12
[   69.414115] firmadyne: sys_socket[PID: 3261 (ipset)]: family:16, type:3, protocol:12
[   69.432951] firmadyne: sys_socket[PID: 3264 (ipset)]: family:16, type:3, protocol:12
[   69.478080] firmadyne: sys_socket[PID: 3268 (ipset)]: family:16, type:3, protocol:12
[   69.496474] firmadyne: sys_socket[PID: 3271 (ipset)]: family:16, type:3, protocol:12
[   69.646558] firmadyne: sys_socket[PID: 3279 (iptables)]: family:1, type:2, protocol:0
[   69.647113] firmadyne: sys_socket[PID: 3279 (iptables)]: family:2, type:3, protocol:255
[   69.669630] firmadyne: sys_socket[PID: 3280 (iptables)]: family:1, type:2, protocol:0
[   69.670110] firmadyne: sys_socket[PID: 3280 (iptables)]: family:2, type:3, protocol:255
[   69.671769] firmadyne: sys_socket[PID: 3280 (iptables)]: family:2, type:3, protocol:255
[   69.685386] firmadyne: sys_socket[PID: 3285 (iptables)]: family:1, type:2, protocol:0
[   69.685853] firmadyne: sys_socket[PID: 3285 (iptables)]: family:2, type:3, protocol:255
[   69.687126] firmadyne: sys_socket[PID: 3285 (iptables)]: family:2, type:3, protocol:255
[   69.707996] firmadyne: sys_socket[PID: 3290 (ip6tables)]: family:1, type:2, protocol:0
[   69.708463] firmadyne: sys_socket[PID: 3290 (ip6tables)]: family:10, type:3, protocol:255
[   69.801378] firmadyne: sys_socket[PID: 3294 (iptables)]: family:1, type:2, protocol:0
[   69.801917] firmadyne: sys_socket[PID: 3294 (iptables)]: family:2, type:3, protocol:255
[   69.827929] firmadyne: sys_socket[PID: 3296 (iptables)]: family:1, type:2, protocol:0
[   69.828458] firmadyne: sys_socket[PID: 3296 (iptables)]: family:2, type:3, protocol:255
[   69.852856] firmadyne: sys_socket[PID: 3297 (iptables)]: family:1, type:2, protocol:0
[   69.853408] firmadyne: sys_socket[PID: 3297 (iptables)]: family:2, type:3, protocol:255
[   69.854672] firmadyne: sys_socket[PID: 3297 (iptables)]: family:2, type:3, protocol:255
[   69.896029] firmadyne: sys_socket[PID: 3303 (iptables)]: family:1, type:2, protocol:0
[   69.896556] firmadyne: sys_socket[PID: 3303 (iptables)]: family:2, type:3, protocol:255
[   69.897848] firmadyne: sys_socket[PID: 3303 (iptables)]: family:2, type:3, protocol:255
[   69.922054] firmadyne: sys_socket[PID: 3309 (iptables)]: family:1, type:2, protocol:0
[   69.922588] firmadyne: sys_socket[PID: 3309 (iptables)]: family:2, type:3, protocol:255
[   69.924076] firmadyne: sys_socket[PID: 3309 (iptables)]: family:2, type:3, protocol:255
[   69.964725] firmadyne: sys_socket[PID: 3315 (ip6tables)]: family:1, type:2, protocol:0
[   69.965223] firmadyne: sys_socket[PID: 3315 (ip6tables)]: family:10, type:3, protocol:255
[   69.992126] firmadyne: sys_socket[PID: 3317 (ip6tables)]: family:1, type:2, protocol:0
[   69.992613] firmadyne: sys_socket[PID: 3317 (ip6tables)]: family:10, type:3, protocol:255
[   69.998779] firmadyne: sys_socket[PID: 3136 (fw3)]: family:16, type:524291, protocol:0
```
