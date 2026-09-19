# RE-LT500D R25 emulator CI result

Commit: 85ab57ce6fe18d1df5addcd6ccb24653e1963ac9
Firmware download/verify: success
Image build: success
QEMU/HTTP gate: failure
Run: https://github.com/diablomike20/Router-Emulator/actions/runs/35432786861

## HTTP headers
```text
HTTP/1.1 200 OK
Connection: Keep-Alive
Keep-Alive: timeout=20
ETag: "a19-25c-6890597d"
Last-Modified: Mon, 04 Aug 2025 06:55:57 GMT
Date: Sat, 19 Sep 2026 08:45:33 GMT
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
[   65.701689] firmadyne: sys_socket[PID: 3089 (fw3)]: family:2, type:3, protocol:255
[   65.740969] firmadyne: sys_socket[PID: 3089 (fw3)]: family:10, type:524289, protocol:17
[   65.743334] firmadyne: sys_socket[PID: 3089 (fw3)]: family:10, type:524289, protocol:17
[   65.755511] firmadyne: sys_socket[PID: 3089 (fw3)]: family:10, type:524289, protocol:17
[   65.756044] firmadyne: sys_socket[PID: 3089 (fw3)]: family:10, type:524289, protocol:17
[   65.756547] firmadyne: sys_socket[PID: 3089 (fw3)]: family:10, type:524289, protocol:17
[   65.756895] firmadyne: sys_socket[PID: 3089 (fw3)]: family:10, type:524289, protocol:17
[   65.761533] firmadyne: sys_socket[PID: 3089 (fw3)]: family:10, type:524289, protocol:17
[   65.761946] firmadyne: sys_socket[PID: 3089 (fw3)]: family:10, type:524289, protocol:17
[   65.762667] firmadyne: sys_socket[PID: 3089 (fw3)]: family:10, type:524289, protocol:17
[   65.763029] firmadyne: sys_socket[PID: 3089 (fw3)]: family:10, type:524289, protocol:17
[   65.763912] firmadyne: sys_socket[PID: 3089 (fw3)]: family:10, type:524289, protocol:17
[   65.764309] firmadyne: sys_socket[PID: 3089 (fw3)]: family:10, type:524289, protocol:17
[   65.764752] firmadyne: sys_socket[PID: 3089 (fw3)]: family:10, type:524289, protocol:17
[   65.769346] firmadyne: sys_socket[PID: 3089 (fw3)]: family:10, type:524289, protocol:17
[   65.770109] firmadyne: sys_socket[PID: 3089 (fw3)]: family:10, type:524289, protocol:17
[   65.770450] firmadyne: sys_socket[PID: 3089 (fw3)]: family:10, type:524289, protocol:17
[   65.771250] firmadyne: sys_socket[PID: 3089 (fw3)]: family:10, type:524289, protocol:17
[   65.771637] firmadyne: sys_socket[PID: 3089 (fw3)]: family:10, type:524289, protocol:17
[   65.772025] firmadyne: sys_socket[PID: 3089 (fw3)]: family:10, type:524289, protocol:17
[   65.772339] firmadyne: sys_socket[PID: 3089 (fw3)]: family:10, type:524289, protocol:17
[   65.780567] firmadyne: sys_setsockopt[PID: 3089 (fw3)]: fd:7, level:0, optname:64
[   65.797330] firmadyne: sys_socket[PID: 3089 (fw3)]: family:2, type:3, protocol:255
[   65.798177] firmadyne: sys_socket[PID: 3089 (fw3)]: family:2, type:3, protocol:255
[   65.799007] firmadyne: sys_socket[PID: 3089 (fw3)]: family:10, type:3, protocol:255
[   65.807400] firmadyne: sys_setsockopt[PID: 3089 (fw3)]: fd:10, level:41, optname:64
[   65.813248] firmadyne: sys_setsockopt[PID: 3089 (fw3)]: fd:10, level:41, optname:65
[   65.814217] firmadyne: sys_socket[PID: 3089 (fw3)]: family:10, type:3, protocol:255
[   65.814901] firmadyne: sys_socket[PID: 3089 (fw3)]: family:10, type:3, protocol:255
[   65.815437] firmadyne: sys_socket[PID: 3089 (fw3)]: family:10, type:3, protocol:255
[   65.823306] firmadyne: sys_socket[PID: 3089 (fw3)]: family:10, type:524289, protocol:17
[   65.823768] firmadyne: sys_socket[PID: 3089 (fw3)]: family:10, type:524289, protocol:17
[   65.830915] firmadyne: sys_socket[PID: 3089 (fw3)]: family:10, type:524289, protocol:17
[   65.831369] firmadyne: sys_socket[PID: 3089 (fw3)]: family:10, type:524289, protocol:17
[   65.831848] firmadyne: sys_socket[PID: 3089 (fw3)]: family:10, type:524289, protocol:17
[   65.832198] firmadyne: sys_socket[PID: 3089 (fw3)]: family:10, type:524289, protocol:17
[   65.832689] firmadyne: sys_socket[PID: 3089 (fw3)]: family:10, type:524289, protocol:17
[   65.837210] firmadyne: sys_socket[PID: 3089 (fw3)]: family:10, type:524289, protocol:17
[   65.837922] firmadyne: sys_socket[PID: 3089 (fw3)]: family:10, type:524289, protocol:17
[   65.838270] firmadyne: sys_socket[PID: 3089 (fw3)]: family:10, type:524289, protocol:17
[   65.838797] firmadyne: sys_socket[PID: 3089 (fw3)]: family:10, type:524289, protocol:17
[   65.839142] firmadyne: sys_socket[PID: 3089 (fw3)]: family:10, type:524289, protocol:17
[   65.839936] firmadyne: sys_socket[PID: 3089 (fw3)]: family:10, type:524289, protocol:17
[   65.840328] firmadyne: sys_socket[PID: 3089 (fw3)]: family:10, type:524289, protocol:17
[   65.840683] firmadyne: sys_socket[PID: 3089 (fw3)]: family:10, type:524289, protocol:17
[   65.845456] firmadyne: sys_socket[PID: 3089 (fw3)]: family:10, type:524289, protocol:17
[   65.848275] firmadyne: sys_setsockopt[PID: 3089 (fw3)]: fd:13, level:41, optname:64
[   65.854021] firmadyne: sys_socket[PID: 3089 (fw3)]: family:10, type:3, protocol:255
[   65.854744] firmadyne: sys_socket[PID: 3089 (fw3)]: family:10, type:3, protocol:255
[   65.855652] firmadyne: sys_socket[PID: 3089 (fw3)]: family:16, type:524291, protocol:0
[   65.876592] firmadyne: sys_socket[PID: 3100 (ubus)]: family:1, type:2, protocol:0
[   66.154168] firmadyne: sys_socket[PID: 3114 (ipset)]: family:16, type:3, protocol:12
[   66.214645] firmadyne: sys_socket[PID: 3121 (ipset)]: family:16, type:3, protocol:12
[   66.290682] firmadyne: sys_socket[PID: 1 (procd)]: family:1, type:524289, protocol:0
[   66.294689] firmadyne: sys_socket[PID: 3128 (ipset)]: family:16, type:3, protocol:12
[   66.313281] firmadyne: sys_socket[PID: 3131 (ipset)]: family:16, type:3, protocol:12
[   66.331730] firmadyne: sys_socket[PID: 3134 (ipset)]: family:16, type:3, protocol:12
[   66.350798] firmadyne: sys_socket[PID: 3137 (ipset)]: family:16, type:3, protocol:12
[   66.369665] firmadyne: sys_socket[PID: 3140 (ipset)]: family:16, type:3, protocol:12
[   66.388717] firmadyne: sys_socket[PID: 3143 (ipset)]: family:16, type:3, protocol:12
[   66.437294] firmadyne: sys_socket[PID: 3147 (iptables)]: family:1, type:2, protocol:0
[   66.437843] firmadyne: sys_socket[PID: 3147 (iptables)]: family:2, type:3, protocol:255
[   66.441760] firmadyne: sys_setsockopt[PID: 3147 (iptables)]: fd:1, level:0, optname:64
[   66.442378] firmadyne: sys_setsockopt[PID: 3147 (iptables)]: fd:1, level:0, optname:65
[   66.465695] firmadyne: sys_socket[PID: 3148 (iptables)]: family:1, type:2, protocol:0
[   66.466286] firmadyne: sys_socket[PID: 3148 (iptables)]: family:2, type:3, protocol:255
[   66.493012] firmadyne: sys_socket[PID: 3149 (ip6tables)]: family:1, type:2, protocol:0
[   66.493679] firmadyne: sys_socket[PID: 3149 (ip6tables)]: family:10, type:3, protocol:255
[   66.498033] firmadyne: sys_setsockopt[PID: 3149 (ip6tables)]: fd:1, level:41, optname:64
[   66.498629] firmadyne: sys_setsockopt[PID: 3149 (ip6tables)]: fd:1, level:41, optname:65
[   66.522015] firmadyne: sys_socket[PID: 3150 (ip6tables)]: family:1, type:2, protocol:0
[   66.522527] firmadyne: sys_socket[PID: 3150 (ip6tables)]: family:10, type:3, protocol:255
[   66.548651] firmadyne: sys_socket[PID: 3151 (iptables)]: family:1, type:2, protocol:0
[   66.549388] firmadyne: sys_socket[PID: 3151 (iptables)]: family:2, type:3, protocol:255
[   66.552456] firmadyne: sys_setsockopt[PID: 3151 (iptables)]: fd:1, level:0, optname:64
[   66.553536] firmadyne: sys_setsockopt[PID: 3151 (iptables)]: fd:1, level:0, optname:65
[   66.574468] firmadyne: sys_socket[PID: 3152 (iptables)]: family:1, type:2, protocol:0
[   66.575052] firmadyne: sys_socket[PID: 3152 (iptables)]: family:2, type:3, protocol:255
[   66.578421] firmadyne: sys_setsockopt[PID: 3152 (iptables)]: fd:1, level:0, optname:64
[   66.579033] firmadyne: sys_setsockopt[PID: 3152 (iptables)]: fd:1, level:0, optname:65
[   66.599907] firmadyne: sys_socket[PID: 3153 (ip6tables)]: family:1, type:2, protocol:0
[   66.600406] firmadyne: sys_socket[PID: 3153 (ip6tables)]: family:10, type:3, protocol:255
[   66.603448] firmadyne: sys_setsockopt[PID: 3153 (ip6tables)]: fd:1, level:41, optname:64
[   66.604005] firmadyne: sys_setsockopt[PID: 3153 (ip6tables)]: fd:1, level:41, optname:65
[   66.624212] firmadyne: sys_socket[PID: 3154 (ip6tables)]: family:1, type:2, protocol:0
[   66.624701] firmadyne: sys_socket[PID: 3154 (ip6tables)]: family:10, type:3, protocol:255
[   66.627732] firmadyne: sys_setsockopt[PID: 3154 (ip6tables)]: fd:1, level:41, optname:64
[   66.628271] firmadyne: sys_setsockopt[PID: 3154 (ip6tables)]: fd:1, level:41, optname:65
[   66.701121] firmadyne: sys_socket[PID: 3157 (iptables)]: family:1, type:2, protocol:0
[   66.701672] firmadyne: sys_socket[PID: 3157 (iptables)]: family:2, type:3, protocol:255
[   66.704491] firmadyne: sys_setsockopt[PID: 3157 (iptables)]: fd:1, level:0, optname:64
[   66.705535] firmadyne: sys_setsockopt[PID: 3157 (iptables)]: fd:1, level:0, optname:65
[   66.710666] firmadyne: inet_accept[PID: 2216 (uhttpd)]:
[   66.711049] firmadyne: inet_accept[PID: 2216 (uhttpd)]:
[   66.711289] firmadyne: inet_accept[PID: 2216 (uhttpd)]:
[   66.711494] firmadyne: inet_accept[PID: 2216 (uhttpd)]:
[   66.711692] firmadyne: inet_accept[PID: 2216 (uhttpd)]:
[   66.711904] firmadyne: inet_accept[PID: 2216 (uhttpd)]:
[   66.737679] firmadyne: sys_socket[PID: 3158 (iptables)]: family:10, type:524289, protocol:17
[   66.738526] firmadyne: sys_socket[PID: 3158 (iptables)]: family:10, type:524289, protocol:17
[   66.741958] firmadyne: sys_socket[PID: 3158 (iptables)]: family:1, type:2, protocol:0
[   66.742458] firmadyne: sys_socket[PID: 3158 (iptables)]: family:2, type:3, protocol:255
[   66.745736] firmadyne: sys_setsockopt[PID: 3158 (iptables)]: fd:1, level:0, optname:64
[   66.746404] firmadyne: sys_setsockopt[PID: 3158 (iptables)]: fd:1, level:0, optname:65
[   66.771014] firmadyne: sys_socket[PID: 3159 (iptables)]: family:1, type:2, protocol:0
[   66.771583] firmadyne: sys_socket[PID: 3159 (iptables)]: family:2, type:3, protocol:255
[   66.774899] firmadyne: sys_setsockopt[PID: 3159 (iptables)]: fd:1, level:0, optname:64
[   66.775552] firmadyne: sys_setsockopt[PID: 3159 (iptables)]: fd:1, level:0, optname:65
[   66.797111] firmadyne: sys_socket[PID: 3160 (ip6tables)]: family:1, type:2, protocol:0
[   66.797624] firmadyne: sys_socket[PID: 3160 (ip6tables)]: family:10, type:3, protocol:255
[   66.800350] firmadyne: sys_setsockopt[PID: 3160 (ip6tables)]: fd:1, level:41, optname:64
[   66.800906] firmadyne: sys_setsockopt[PID: 3160 (ip6tables)]: fd:1, level:41, optname:65
[   66.824666] firmadyne: sys_socket[PID: 3161 (ip6tables)]: family:10, type:524289, protocol:17
[   66.825616] firmadyne: sys_socket[PID: 3161 (ip6tables)]: family:10, type:524289, protocol:17
[   66.828864] firmadyne: sys_socket[PID: 3161 (ip6tables)]: family:1, type:2, protocol:0
[   66.829756] firmadyne: sys_socket[PID: 3161 (ip6tables)]: family:10, type:3, protocol:255
[   66.832766] firmadyne: sys_setsockopt[PID: 3161 (ip6tables)]: fd:1, level:41, optname:64
[   66.833767] firmadyne: sys_setsockopt[PID: 3161 (ip6tables)]: fd:1, level:41, optname:65
[   66.857844] firmadyne: sys_socket[PID: 3162 (ip6tables)]: family:1, type:2, protocol:0
[   66.858388] firmadyne: sys_socket[PID: 3162 (ip6tables)]: family:10, type:3, protocol:255
[   66.861556] firmadyne: sys_setsockopt[PID: 3162 (ip6tables)]: fd:1, level:41, optname:64
[   66.862234] firmadyne: sys_setsockopt[PID: 3162 (ip6tables)]: fd:1, level:41, optname:65
[   66.908019] firmadyne: sys_socket[PID: 3164 (iptables)]: family:1, type:2, protocol:0
[   66.908630] firmadyne: sys_socket[PID: 3164 (iptables)]: family:2, type:3, protocol:255
[   66.912181] firmadyne: sys_setsockopt[PID: 3164 (iptables)]: fd:1, level:0, optname:64
[   66.912838] firmadyne: sys_setsockopt[PID: 3164 (iptables)]: fd:1, level:0, optname:65
[   66.936690] firmadyne: sys_socket[PID: 3165 (ip6tables)]: family:1, type:2, protocol:0
[   66.937350] firmadyne: sys_socket[PID: 3165 (ip6tables)]: family:10, type:3, protocol:255
[   66.940488] firmadyne: sys_setsockopt[PID: 3165 (ip6tables)]: fd:1, level:41, optname:64
[   66.941539] firmadyne: sys_setsockopt[PID: 3165 (ip6tables)]: fd:1, level:41, optname:65
[   66.988333] firmadyne: sys_socket[PID: 3167 (iptables)]: family:1, type:2, protocol:0
[   66.988911] firmadyne: sys_socket[PID: 3167 (iptables)]: family:2, type:3, protocol:255
[   66.992011] firmadyne: sys_setsockopt[PID: 3167 (iptables)]: fd:1, level:0, optname:64
[   66.992584] firmadyne: sys_setsockopt[PID: 3167 (iptables)]: fd:1, level:0, optname:65
[   67.013311] firmadyne: sys_socket[PID: 3168 (iptables)]: family:1, type:2, protocol:0
[   67.013929] firmadyne: sys_socket[PID: 3168 (iptables)]: family:2, type:3, protocol:255
[   67.017008] firmadyne: sys_setsockopt[PID: 3168 (iptables)]: fd:1, level:0, optname:64
[   67.018069] firmadyne: sys_setsockopt[PID: 3168 (iptables)]: fd:1, level:0, optname:65
[   67.039193] firmadyne: sys_socket[PID: 3169 (iptables)]: family:1, type:2, protocol:0
[   67.039697] firmadyne: sys_socket[PID: 3169 (iptables)]: family:2, type:3, protocol:255
[   67.043172] firmadyne: sys_setsockopt[PID: 3169 (iptables)]: fd:1, level:0, optname:64
[   67.043741] firmadyne: sys_setsockopt[PID: 3169 (iptables)]: fd:1, level:0, optname:65
[   67.068409] firmadyne: sys_socket[PID: 3170 (iptables)]: family:1, type:2, protocol:0
[   67.069373] firmadyne: sys_socket[PID: 3170 (iptables)]: family:2, type:3, protocol:255
[   67.331673] firmadyne: sys_socket[PID: 3178 (iptables)]: family:1, type:2, protocol:0
[   67.332249] firmadyne: sys_socket[PID: 3178 (iptables)]: family:2, type:3, protocol:255
[   67.361821] firmadyne: sys_socket[PID: 3179 (iptables)]: family:1, type:2, protocol:0
[   67.362453] firmadyne: sys_socket[PID: 3179 (iptables)]: family:2, type:3, protocol:255
[   67.365427] firmadyne: sys_setsockopt[PID: 3179 (iptables)]: fd:1, level:0, optname:64
[   67.394463] firmadyne: sys_socket[PID: 3182 (iptables)]: family:1, type:2, protocol:0
[   67.395043] firmadyne: sys_socket[PID: 3182 (iptables)]: family:2, type:3, protocol:255
[   67.424224] firmadyne: sys_socket[PID: 3183 (iptables)]: family:1, type:2, protocol:0
[   67.424778] firmadyne: sys_socket[PID: 3183 (iptables)]: family:2, type:3, protocol:255
[   67.454227] firmadyne: sys_socket[PID: 3184 (iptables)]: family:1, type:2, protocol:0
[   67.454782] firmadyne: sys_socket[PID: 3184 (iptables)]: family:2, type:3, protocol:255
[   67.625794] firmadyne: sys_socket[PID: 3193 (iptables)]: family:1, type:2, protocol:0
[   67.626356] firmadyne: sys_socket[PID: 3193 (iptables)]: family:2, type:3, protocol:255
[   67.642852] firmadyne: sys_socket[PID: 3194 (iptables)]: family:1, type:2, protocol:0
[   67.643372] firmadyne: sys_socket[PID: 3194 (iptables)]: family:2, type:3, protocol:255
[   67.665789] firmadyne: sys_socket[PID: 3195 (iptables)]: family:1, type:2, protocol:0
[   67.666371] firmadyne: sys_socket[PID: 3195 (iptables)]: family:2, type:3, protocol:255
[   67.689051] firmadyne: sys_socket[PID: 3196 (iptables)]: family:1, type:2, protocol:0
[   67.689679] firmadyne: sys_socket[PID: 3196 (iptables)]: family:2, type:3, protocol:255
[   67.712626] firmadyne: sys_socket[PID: 3197 (iptables)]: family:1, type:2, protocol:0
[   67.713329] firmadyne: sys_socket[PID: 3197 (iptables)]: family:2, type:3, protocol:255
[   67.737318] firmadyne: sys_socket[PID: 3198 (iptables)]: family:1, type:2, protocol:0
[   67.737871] firmadyne: sys_socket[PID: 3198 (iptables)]: family:2, type:3, protocol:255
[   67.848035] firmadyne: sys_socket[PID: 3203 (ubus)]: family:1, type:2, protocol:0
[   67.928387] firmadyne: sys_socket[PID: 3206 (logger)]: family:1, type:524289, protocol:0
[   67.953684] firmadyne: sys_socket[PID: 3207 (iptables)]: family:1, type:2, protocol:0
[   67.954266] firmadyne: sys_socket[PID: 3207 (iptables)]: family:2, type:3, protocol:255
[   67.977649] firmadyne: sys_socket[PID: 3208 (iptables)]: family:1, type:2, protocol:0
[   67.978260] firmadyne: sys_socket[PID: 3208 (iptables)]: family:2, type:3, protocol:255
[   68.001791] firmadyne: sys_socket[PID: 3209 (iptables)]: family:1, type:2, protocol:0
[   68.002877] firmadyne: sys_socket[PID: 3209 (iptables)]: family:2, type:3, protocol:255
[   68.023923] firmadyne: sys_socket[PID: 3210 (ip)]: family:16, type:524291, protocol:0
[   68.024379] firmadyne: sys_setsockopt[PID: 3210 (ip)]: fd:0, level:65535, optname:4097
[   68.024788] firmadyne: sys_setsockopt[PID: 3210 (ip)]: fd:0, level:65535, optname:4098
[   68.048920] firmadyne: sys_socket[PID: 3211 (ipset)]: family:16, type:3, protocol:12
[   68.068787] firmadyne: sys_socket[PID: 3214 (ipset)]: family:16, type:3, protocol:12
[   68.088162] firmadyne: sys_socket[PID: 3217 (ipset)]: family:16, type:3, protocol:12
[   68.099754] firmadyne: sys_socket[PID: 3220 (ipset)]: family:16, type:3, protocol:12
[   68.118308] firmadyne: sys_socket[PID: 3223 (ipset)]: family:16, type:3, protocol:12
[   68.138043] firmadyne: sys_socket[PID: 3226 (ipset)]: family:16, type:3, protocol:12
[   68.185440] firmadyne: sys_socket[PID: 3230 (ipset)]: family:16, type:3, protocol:12
[   68.204807] firmadyne: sys_socket[PID: 3233 (ipset)]: family:16, type:3, protocol:12
[   68.346569] firmadyne: sys_socket[PID: 3241 (iptables)]: family:1, type:2, protocol:0
[   68.347144] firmadyne: sys_socket[PID: 3241 (iptables)]: family:2, type:3, protocol:255
[   68.359994] firmadyne: sys_socket[PID: 3242 (iptables)]: family:1, type:2, protocol:0
[   68.360445] firmadyne: sys_socket[PID: 3242 (iptables)]: family:2, type:3, protocol:255
[   68.362445] firmadyne: sys_socket[PID: 3242 (iptables)]: family:2, type:3, protocol:255
[   68.384033] firmadyne: sys_socket[PID: 3247 (iptables)]: family:1, type:2, protocol:0
[   68.384573] firmadyne: sys_socket[PID: 3247 (iptables)]: family:2, type:3, protocol:255
[   68.386507] firmadyne: sys_socket[PID: 3247 (iptables)]: family:2, type:3, protocol:255
[   68.401273] firmadyne: sys_socket[PID: 3252 (ip6tables)]: family:1, type:2, protocol:0
[   68.401752] firmadyne: sys_socket[PID: 3252 (ip6tables)]: family:10, type:3, protocol:255
[   68.495505] firmadyne: sys_socket[PID: 3256 (iptables)]: family:1, type:2, protocol:0
[   68.496077] firmadyne: sys_socket[PID: 3256 (iptables)]: family:2, type:3, protocol:255
[   68.523870] firmadyne: sys_socket[PID: 3258 (iptables)]: family:1, type:2, protocol:0
[   68.524443] firmadyne: sys_socket[PID: 3258 (iptables)]: family:2, type:3, protocol:255
[   68.550233] firmadyne: sys_socket[PID: 3259 (iptables)]: family:1, type:2, protocol:0
[   68.550786] firmadyne: sys_socket[PID: 3259 (iptables)]: family:2, type:3, protocol:255
[   68.552261] firmadyne: sys_socket[PID: 3259 (iptables)]: family:2, type:3, protocol:255
[   68.595844] firmadyne: sys_socket[PID: 3265 (iptables)]: family:1, type:2, protocol:0
[   68.596436] firmadyne: sys_socket[PID: 3265 (iptables)]: family:2, type:3, protocol:255
[   68.598727] firmadyne: sys_socket[PID: 3265 (iptables)]: family:2, type:3, protocol:255
[   68.622973] firmadyne: sys_socket[PID: 3271 (iptables)]: family:1, type:2, protocol:0
[   68.623579] firmadyne: sys_socket[PID: 3271 (iptables)]: family:2, type:3, protocol:255
[   68.625051] firmadyne: sys_socket[PID: 3271 (iptables)]: family:2, type:3, protocol:255
[   68.675973] firmadyne: sys_socket[PID: 3277 (ip6tables)]: family:1, type:2, protocol:0
[   68.676518] firmadyne: sys_socket[PID: 3277 (ip6tables)]: family:10, type:3, protocol:255
[   68.707718] firmadyne: sys_socket[PID: 3279 (ip6tables)]: family:1, type:2, protocol:0
[   68.708269] firmadyne: sys_socket[PID: 3279 (ip6tables)]: family:10, type:3, protocol:255
[   68.710645] firmadyne: inet_accept[PID: 2216 (uhttpd)]:
[   68.710986] firmadyne: inet_accept[PID: 2216 (uhttpd)]:
[   68.711245] firmadyne: inet_accept[PID: 2216 (uhttpd)]:
[   68.711526] firmadyne: inet_accept[PID: 2216 (uhttpd)]:
[   68.711833] firmadyne: inet_accept[PID: 2216 (uhttpd)]:
[   68.712138] firmadyne: inet_accept[PID: 2216 (uhttpd)]:
[   68.723104] firmadyne: sys_socket[PID: 3089 (fw3)]: family:16, type:524291, protocol:0
```
