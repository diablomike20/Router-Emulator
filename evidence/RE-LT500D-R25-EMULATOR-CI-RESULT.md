# RE-LT500D R25 emulator CI result

Commit: 5b371ec954b35cef136c3ff05970d28ec4971d10
Firmware download/verify: success
Image build: success
QEMU/HTTP gate: success
Run: https://github.com/diablomike20/Router-Emulator/actions/runs/35429662319

## HTTP headers
```text
HTTP/1.1 200 OK
Connection: Keep-Alive
Keep-Alive: timeout=20
ETag: "a19-25c-6890597d"
Last-Modified: Mon, 04 Aug 2025 06:55:57 GMT
Date: Sat, 19 Sep 2026 07:35:44 GMT
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
[   68.617442] firmadyne: sys_socket[PID: 3218 (fw3)]: family:10, type:524289, protocol:17
[   68.617809] firmadyne: sys_socket[PID: 3218 (fw3)]: family:10, type:524289, protocol:17
[   68.618149] firmadyne: sys_socket[PID: 3218 (fw3)]: family:10, type:524289, protocol:17
[   68.618439] firmadyne: sys_socket[PID: 3218 (fw3)]: family:10, type:524289, protocol:17
[   68.624492] firmadyne: sys_setsockopt[PID: 3218 (fw3)]: fd:7, level:0, optname:64
[   68.626256] firmadyne: sys_socket[PID: 3218 (fw3)]: family:2, type:3, protocol:255
[   68.627377] firmadyne: sys_socket[PID: 3218 (fw3)]: family:2, type:3, protocol:255
[   68.628236] firmadyne: sys_socket[PID: 3218 (fw3)]: family:10, type:3, protocol:255
[   68.632676] firmadyne: sys_setsockopt[PID: 3218 (fw3)]: fd:10, level:41, optname:64
[   68.634360] firmadyne: sys_setsockopt[PID: 3218 (fw3)]: fd:10, level:41, optname:65
[   68.635584] firmadyne: sys_socket[PID: 3218 (fw3)]: family:10, type:3, protocol:255
[   68.636160] firmadyne: sys_socket[PID: 3218 (fw3)]: family:10, type:3, protocol:255
[   68.636675] firmadyne: sys_socket[PID: 3218 (fw3)]: family:10, type:3, protocol:255
[   68.640630] firmadyne: sys_socket[PID: 3218 (fw3)]: family:10, type:524289, protocol:17
[   68.641037] firmadyne: sys_socket[PID: 3218 (fw3)]: family:10, type:524289, protocol:17
[   68.644469] firmadyne: sys_socket[PID: 3218 (fw3)]: family:10, type:524289, protocol:17
[   68.644889] firmadyne: sys_socket[PID: 3218 (fw3)]: family:10, type:524289, protocol:17
[   68.645344] firmadyne: sys_socket[PID: 3218 (fw3)]: family:10, type:524289, protocol:17
[   68.645688] firmadyne: sys_socket[PID: 3218 (fw3)]: family:10, type:524289, protocol:17
[   68.646179] firmadyne: sys_socket[PID: 3218 (fw3)]: family:10, type:524289, protocol:17
[   68.646476] firmadyne: sys_socket[PID: 3218 (fw3)]: family:10, type:524289, protocol:17
[   68.647400] firmadyne: sys_socket[PID: 3218 (fw3)]: family:10, type:524289, protocol:17
[   68.647759] firmadyne: sys_socket[PID: 3218 (fw3)]: family:10, type:524289, protocol:17
[   68.648283] firmadyne: sys_socket[PID: 3218 (fw3)]: family:10, type:524289, protocol:17
[   68.648610] firmadyne: sys_socket[PID: 3218 (fw3)]: family:10, type:524289, protocol:17
[   68.649448] firmadyne: sys_socket[PID: 3218 (fw3)]: family:10, type:524289, protocol:17
[   68.649821] firmadyne: sys_socket[PID: 3218 (fw3)]: family:10, type:524289, protocol:17
[   68.650146] firmadyne: sys_socket[PID: 3218 (fw3)]: family:10, type:524289, protocol:17
[   68.650431] firmadyne: sys_socket[PID: 3218 (fw3)]: family:10, type:524289, protocol:17
[   68.653779] firmadyne: sys_setsockopt[PID: 3218 (fw3)]: fd:13, level:41, optname:64
[   68.655437] firmadyne: sys_socket[PID: 3218 (fw3)]: family:10, type:3, protocol:255
[   68.656101] firmadyne: sys_socket[PID: 3218 (fw3)]: family:10, type:3, protocol:255
[   68.656706] firmadyne: sys_socket[PID: 3218 (fw3)]: family:16, type:524291, protocol:0
[   68.736208] firmadyne: sys_socket[PID: 3227 (iptables)]: family:1, type:2, protocol:0
[   68.736981] firmadyne: sys_socket[PID: 3227 (iptables)]: family:2, type:3, protocol:255
[   68.776228] firmadyne: sys_socket[PID: 3230 (iptables)]: family:1, type:2, protocol:0
[   68.776776] firmadyne: sys_socket[PID: 3230 (iptables)]: family:2, type:3, protocol:255
[   68.799575] firmadyne: sys_socket[PID: 3229 (ipset)]: family:16, type:3, protocol:12
[   68.835151] firmadyne: sys_socket[PID: 3231 (iptables)]: family:1, type:2, protocol:0
[   68.835677] firmadyne: sys_socket[PID: 3231 (iptables)]: family:2, type:3, protocol:255
[   68.841945] firmadyne: sys_socket[PID: 3234 (ipset)]: family:16, type:3, protocol:12
[   68.890998] firmadyne: sys_socket[PID: 3235 (iptables)]: family:1, type:2, protocol:0
[   68.891500] firmadyne: sys_socket[PID: 3235 (iptables)]: family:2, type:3, protocol:255
[   68.909435] firmadyne: sys_socket[PID: 3239 (ipset)]: family:16, type:3, protocol:12
[   68.936805] firmadyne: sys_socket[PID: 3243 (ipset)]: family:16, type:3, protocol:12
[   68.954986] firmadyne: sys_socket[PID: 3246 (ipset)]: family:16, type:3, protocol:12
[   68.973041] firmadyne: sys_socket[PID: 3249 (ipset)]: family:16, type:3, protocol:12
[   68.991692] firmadyne: sys_socket[PID: 3252 (ipset)]: family:16, type:3, protocol:12
[   69.003860] firmadyne: inet_accept[PID: 2510 (uhttpd)]:
[   69.004179] firmadyne: inet_accept[PID: 2510 (uhttpd)]:
[   69.004378] firmadyne: inet_accept[PID: 2510 (uhttpd)]:
[   69.004594] firmadyne: inet_accept[PID: 2510 (uhttpd)]:
[   69.004785] firmadyne: inet_accept[PID: 2510 (uhttpd)]:
[   69.004968] firmadyne: inet_accept[PID: 2510 (uhttpd)]:
[   69.017895] firmadyne: sys_socket[PID: 3255 (ipset)]: family:16, type:3, protocol:12
[   69.065683] firmadyne: sys_socket[PID: 3259 (iptables)]: family:1, type:2, protocol:0
[   69.066196] firmadyne: sys_socket[PID: 3259 (iptables)]: family:2, type:3, protocol:255
[   69.069897] firmadyne: sys_setsockopt[PID: 3259 (iptables)]: fd:1, level:0, optname:64
[   69.070426] firmadyne: sys_setsockopt[PID: 3259 (iptables)]: fd:1, level:0, optname:65
[   69.093383] firmadyne: sys_socket[PID: 3260 (iptables)]: family:1, type:2, protocol:0
[   69.093938] firmadyne: sys_socket[PID: 3260 (iptables)]: family:2, type:3, protocol:255
[   69.119856] firmadyne: sys_socket[PID: 3261 (ip6tables)]: family:1, type:2, protocol:0
[   69.120326] firmadyne: sys_socket[PID: 3261 (ip6tables)]: family:10, type:3, protocol:255
[   69.124332] firmadyne: sys_setsockopt[PID: 3261 (ip6tables)]: fd:1, level:41, optname:64
[   69.124889] firmadyne: sys_setsockopt[PID: 3261 (ip6tables)]: fd:1, level:41, optname:65
[   69.148148] firmadyne: sys_socket[PID: 3262 (ip6tables)]: family:1, type:2, protocol:0
[   69.148641] firmadyne: sys_socket[PID: 3262 (ip6tables)]: family:10, type:3, protocol:255
[   69.172327] firmadyne: sys_socket[PID: 3263 (iptables)]: family:1, type:2, protocol:0
[   69.172876] firmadyne: sys_socket[PID: 3263 (iptables)]: family:2, type:3, protocol:255
[   69.175948] firmadyne: sys_setsockopt[PID: 3263 (iptables)]: fd:1, level:0, optname:64
[   69.176500] firmadyne: sys_setsockopt[PID: 3263 (iptables)]: fd:1, level:0, optname:65
[   69.197586] firmadyne: sys_socket[PID: 3264 (iptables)]: family:1, type:2, protocol:0
[   69.198142] firmadyne: sys_socket[PID: 3264 (iptables)]: family:2, type:3, protocol:255
[   69.201435] firmadyne: sys_setsockopt[PID: 3264 (iptables)]: fd:1, level:0, optname:64
[   69.201994] firmadyne: sys_setsockopt[PID: 3264 (iptables)]: fd:1, level:0, optname:65
[   69.223800] firmadyne: sys_socket[PID: 3265 (ip6tables)]: family:1, type:2, protocol:0
[   69.224270] firmadyne: sys_socket[PID: 3265 (ip6tables)]: family:10, type:3, protocol:255
[   69.227297] firmadyne: sys_setsockopt[PID: 3265 (ip6tables)]: fd:1, level:41, optname:64
[   69.227838] firmadyne: sys_setsockopt[PID: 3265 (ip6tables)]: fd:1, level:41, optname:65
[   69.248581] firmadyne: sys_socket[PID: 3266 (ip6tables)]: family:1, type:2, protocol:0
[   69.249058] firmadyne: sys_socket[PID: 3266 (ip6tables)]: family:10, type:3, protocol:255
[   69.252022] firmadyne: sys_setsockopt[PID: 3266 (ip6tables)]: fd:1, level:41, optname:64
[   69.252557] firmadyne: sys_setsockopt[PID: 3266 (ip6tables)]: fd:1, level:41, optname:65
[   69.325167] firmadyne: sys_socket[PID: 3269 (iptables)]: family:1, type:2, protocol:0
[   69.325696] firmadyne: sys_socket[PID: 3269 (iptables)]: family:2, type:3, protocol:255
[   69.328909] firmadyne: sys_setsockopt[PID: 3269 (iptables)]: fd:1, level:0, optname:64
[   69.329479] firmadyne: sys_setsockopt[PID: 3269 (iptables)]: fd:1, level:0, optname:65
[   69.354122] firmadyne: sys_socket[PID: 3270 (iptables)]: family:10, type:524289, protocol:17
[   69.355306] firmadyne: sys_socket[PID: 3270 (iptables)]: family:10, type:524289, protocol:17
[   69.358329] firmadyne: sys_socket[PID: 3270 (iptables)]: family:1, type:2, protocol:0
[   69.359213] firmadyne: sys_socket[PID: 3270 (iptables)]: family:2, type:3, protocol:255
[   69.362136] firmadyne: sys_setsockopt[PID: 3270 (iptables)]: fd:1, level:0, optname:64
[   69.363096] firmadyne: sys_setsockopt[PID: 3270 (iptables)]: fd:1, level:0, optname:65
[   69.379971] firmadyne: sys_socket[PID: 3271 (iptables)]: family:1, type:2, protocol:0
[   69.380539] firmadyne: sys_socket[PID: 3271 (iptables)]: family:2, type:3, protocol:255
[   69.383739] firmadyne: sys_setsockopt[PID: 3271 (iptables)]: fd:1, level:0, optname:64
[   69.384357] firmadyne: sys_setsockopt[PID: 3271 (iptables)]: fd:1, level:0, optname:65
[   69.405629] firmadyne: sys_socket[PID: 3272 (ip6tables)]: family:1, type:2, protocol:0
[   69.406113] firmadyne: sys_socket[PID: 3272 (ip6tables)]: family:10, type:3, protocol:255
[   69.409150] firmadyne: sys_setsockopt[PID: 3272 (ip6tables)]: fd:1, level:41, optname:64
[   69.409688] firmadyne: sys_setsockopt[PID: 3272 (ip6tables)]: fd:1, level:41, optname:65
[   69.434169] firmadyne: sys_socket[PID: 3273 (ip6tables)]: family:10, type:524289, protocol:17
[   69.435285] firmadyne: sys_socket[PID: 3273 (ip6tables)]: family:10, type:524289, protocol:17
[   69.438465] firmadyne: sys_socket[PID: 3273 (ip6tables)]: family:1, type:2, protocol:0
[   69.439237] firmadyne: sys_socket[PID: 3273 (ip6tables)]: family:10, type:3, protocol:255
[   69.442173] firmadyne: sys_setsockopt[PID: 3273 (ip6tables)]: fd:1, level:41, optname:64
[   69.443064] firmadyne: sys_setsockopt[PID: 3273 (ip6tables)]: fd:1, level:41, optname:65
[   69.467407] firmadyne: sys_socket[PID: 3274 (ip6tables)]: family:1, type:2, protocol:0
[   69.467920] firmadyne: sys_socket[PID: 3274 (ip6tables)]: family:10, type:3, protocol:255
[   69.471074] firmadyne: sys_setsockopt[PID: 3274 (ip6tables)]: fd:1, level:41, optname:64
[   69.471723] firmadyne: sys_setsockopt[PID: 3274 (ip6tables)]: fd:1, level:41, optname:65
[   69.509390] firmadyne: sys_socket[PID: 3276 (iptables)]: family:1, type:2, protocol:0
[   69.509941] firmadyne: sys_socket[PID: 3276 (iptables)]: family:2, type:3, protocol:255
[   69.513383] firmadyne: sys_setsockopt[PID: 3276 (iptables)]: fd:1, level:0, optname:64
[   69.514015] firmadyne: sys_setsockopt[PID: 3276 (iptables)]: fd:1, level:0, optname:65
[   69.536996] firmadyne: sys_socket[PID: 3277 (ip6tables)]: family:1, type:2, protocol:0
[   69.537483] firmadyne: sys_socket[PID: 3277 (ip6tables)]: family:10, type:3, protocol:255
[   69.540943] firmadyne: sys_setsockopt[PID: 3277 (ip6tables)]: fd:1, level:41, optname:64
[   69.541584] firmadyne: sys_setsockopt[PID: 3277 (ip6tables)]: fd:1, level:41, optname:65
[   69.589008] firmadyne: sys_socket[PID: 3279 (iptables)]: family:1, type:2, protocol:0
[   69.589562] firmadyne: sys_socket[PID: 3279 (iptables)]: family:2, type:3, protocol:255
[   69.593451] firmadyne: sys_setsockopt[PID: 3279 (iptables)]: fd:1, level:0, optname:64
[   69.594013] firmadyne: sys_setsockopt[PID: 3279 (iptables)]: fd:1, level:0, optname:65
[   69.616040] firmadyne: sys_socket[PID: 3280 (iptables)]: family:1, type:2, protocol:0
[   69.616609] firmadyne: sys_socket[PID: 3280 (iptables)]: family:2, type:3, protocol:255
[   69.619908] firmadyne: sys_setsockopt[PID: 3280 (iptables)]: fd:1, level:0, optname:64
[   69.620452] firmadyne: sys_setsockopt[PID: 3280 (iptables)]: fd:1, level:0, optname:65
[   69.642795] firmadyne: sys_socket[PID: 3281 (iptables)]: family:1, type:2, protocol:0
[   69.643349] firmadyne: sys_socket[PID: 3281 (iptables)]: family:2, type:3, protocol:255
[   69.646493] firmadyne: sys_setsockopt[PID: 3281 (iptables)]: fd:1, level:0, optname:64
[   69.647490] firmadyne: sys_setsockopt[PID: 3281 (iptables)]: fd:1, level:0, optname:65
[   69.673158] firmadyne: sys_socket[PID: 3282 (iptables)]: family:1, type:2, protocol:0
[   69.673708] firmadyne: sys_socket[PID: 3282 (iptables)]: family:2, type:3, protocol:255
[   69.935759] firmadyne: sys_socket[PID: 3290 (iptables)]: family:1, type:2, protocol:0
[   69.936273] firmadyne: sys_socket[PID: 3290 (iptables)]: family:2, type:3, protocol:255
[   69.965487] firmadyne: sys_socket[PID: 3291 (iptables)]: family:1, type:2, protocol:0
[   69.966033] firmadyne: sys_socket[PID: 3291 (iptables)]: family:2, type:3, protocol:255
[   69.968952] firmadyne: sys_setsockopt[PID: 3291 (iptables)]: fd:1, level:0, optname:64
[   69.996910] firmadyne: sys_socket[PID: 3294 (iptables)]: family:1, type:2, protocol:0
[   69.997420] firmadyne: sys_socket[PID: 3294 (iptables)]: family:2, type:3, protocol:255
[   70.027534] firmadyne: sys_socket[PID: 3295 (iptables)]: family:1, type:2, protocol:0
[   70.028045] firmadyne: sys_socket[PID: 3295 (iptables)]: family:2, type:3, protocol:255
[   70.046749] firmadyne: sys_socket[PID: 3296 (iptables)]: family:1, type:2, protocol:0
[   70.047218] firmadyne: sys_socket[PID: 3296 (iptables)]: family:2, type:3, protocol:255
[   70.221655] firmadyne: sys_socket[PID: 3305 (iptables)]: family:1, type:2, protocol:0
[   70.222153] firmadyne: sys_socket[PID: 3305 (iptables)]: family:2, type:3, protocol:255
[   70.248367] firmadyne: sys_socket[PID: 3306 (iptables)]: family:1, type:2, protocol:0
[   70.248959] firmadyne: sys_socket[PID: 3306 (iptables)]: family:2, type:3, protocol:255
[   70.273226] firmadyne: sys_socket[PID: 3307 (iptables)]: family:1, type:2, protocol:0
[   70.273783] firmadyne: sys_socket[PID: 3307 (iptables)]: family:2, type:3, protocol:255
[   70.297707] firmadyne: sys_socket[PID: 3308 (iptables)]: family:1, type:2, protocol:0
[   70.298222] firmadyne: sys_socket[PID: 3308 (iptables)]: family:2, type:3, protocol:255
[   70.321877] firmadyne: sys_socket[PID: 3309 (iptables)]: family:1, type:2, protocol:0
[   70.322388] firmadyne: sys_socket[PID: 3309 (iptables)]: family:2, type:3, protocol:255
[   70.345837] firmadyne: sys_socket[PID: 3310 (iptables)]: family:1, type:2, protocol:0
[   70.346356] firmadyne: sys_socket[PID: 3310 (iptables)]: family:2, type:3, protocol:255
[   70.455377] firmadyne: sys_socket[PID: 3315 (ubus)]: family:1, type:2, protocol:0
[   70.533946] firmadyne: sys_socket[PID: 3318 (logger)]: family:1, type:524289, protocol:0
[   70.559598] firmadyne: sys_socket[PID: 3319 (iptables)]: family:1, type:2, protocol:0
[   70.560120] firmadyne: sys_socket[PID: 3319 (iptables)]: family:2, type:3, protocol:255
[   70.575242] firmadyne: sys_socket[PID: 3320 (iptables)]: family:1, type:2, protocol:0
[   70.575727] firmadyne: sys_socket[PID: 3320 (iptables)]: family:2, type:3, protocol:255
[   70.597778] firmadyne: sys_socket[PID: 3321 (iptables)]: family:1, type:2, protocol:0
[   70.598274] firmadyne: sys_socket[PID: 3321 (iptables)]: family:2, type:3, protocol:255
[   70.617745] firmadyne: sys_socket[PID: 3322 (ip)]: family:16, type:524291, protocol:0
[   70.618160] firmadyne: sys_setsockopt[PID: 3322 (ip)]: fd:0, level:65535, optname:4097
[   70.618485] firmadyne: sys_setsockopt[PID: 3322 (ip)]: fd:0, level:65535, optname:4098
[   70.642784] firmadyne: sys_socket[PID: 3323 (ipset)]: family:16, type:3, protocol:12
[   70.661450] firmadyne: sys_socket[PID: 3326 (ipset)]: family:16, type:3, protocol:12
[   70.680121] firmadyne: sys_socket[PID: 3329 (ipset)]: family:16, type:3, protocol:12
[   70.699151] firmadyne: sys_socket[PID: 3332 (ipset)]: family:16, type:3, protocol:12
[   70.718365] firmadyne: sys_socket[PID: 3335 (ipset)]: family:16, type:3, protocol:12
[   70.737401] firmadyne: sys_socket[PID: 3338 (ipset)]: family:16, type:3, protocol:12
[   70.783673] firmadyne: sys_socket[PID: 3342 (ipset)]: family:16, type:3, protocol:12
[   70.804377] firmadyne: sys_socket[PID: 3345 (ipset)]: family:16, type:3, protocol:12
[   70.934580] firmadyne: sys_socket[PID: 3353 (iptables)]: family:1, type:2, protocol:0
[   70.935129] firmadyne: sys_socket[PID: 3353 (iptables)]: family:2, type:3, protocol:255
[   70.957828] firmadyne: sys_socket[PID: 3354 (iptables)]: family:1, type:2, protocol:0
[   70.958344] firmadyne: sys_socket[PID: 3354 (iptables)]: family:2, type:3, protocol:255
[   70.960290] firmadyne: sys_socket[PID: 3354 (iptables)]: family:2, type:3, protocol:255
[   70.982321] firmadyne: sys_socket[PID: 3359 (iptables)]: family:1, type:2, protocol:0
[   70.982919] firmadyne: sys_socket[PID: 3359 (iptables)]: family:2, type:3, protocol:255
[   70.984078] firmadyne: sys_socket[PID: 3359 (iptables)]: family:2, type:3, protocol:255
[   71.004005] firmadyne: inet_accept[PID: 2510 (uhttpd)]:
[   71.004288] firmadyne: inet_accept[PID: 2510 (uhttpd)]:
[   71.004540] firmadyne: inet_accept[PID: 2510 (uhttpd)]:
[   71.004740] firmadyne: inet_accept[PID: 2510 (uhttpd)]:
[   71.004928] firmadyne: inet_accept[PID: 2510 (uhttpd)]:
[   71.005113] firmadyne: inet_accept[PID: 2510 (uhttpd)]:
[   71.012710] firmadyne: sys_socket[PID: 3364 (ip6tables)]: family:1, type:2, protocol:0
[   71.013149] firmadyne: sys_socket[PID: 3364 (ip6tables)]: family:10, type:3, protocol:255
[   71.096504] firmadyne: sys_socket[PID: 3368 (iptables)]: family:1, type:2, protocol:0
[   71.097061] firmadyne: sys_socket[PID: 3368 (iptables)]: family:2, type:3, protocol:255
[   71.124483] firmadyne: sys_socket[PID: 3370 (iptables)]: family:1, type:2, protocol:0
[   71.125028] firmadyne: sys_socket[PID: 3370 (iptables)]: family:2, type:3, protocol:255
[   71.150098] firmadyne: sys_socket[PID: 3371 (iptables)]: family:1, type:2, protocol:0
[   71.150944] firmadyne: sys_socket[PID: 3371 (iptables)]: family:2, type:3, protocol:255
[   71.152299] firmadyne: sys_socket[PID: 3371 (iptables)]: family:2, type:3, protocol:255
[   71.192749] firmadyne: sys_socket[PID: 3377 (iptables)]: family:1, type:2, protocol:0
[   71.193248] firmadyne: sys_socket[PID: 3377 (iptables)]: family:2, type:3, protocol:255
[   71.197268] firmadyne: sys_socket[PID: 3377 (iptables)]: family:2, type:3, protocol:255
[   71.221615] firmadyne: sys_socket[PID: 3383 (iptables)]: family:1, type:2, protocol:0
[   71.222095] firmadyne: sys_socket[PID: 3383 (iptables)]: family:2, type:3, protocol:255
[   71.224068] firmadyne: sys_socket[PID: 3383 (iptables)]: family:2, type:3, protocol:255
[   71.264786] firmadyne: sys_socket[PID: 3389 (ip6tables)]: family:1, type:2, protocol:0
[   71.265275] firmadyne: sys_socket[PID: 3389 (ip6tables)]: family:10, type:3, protocol:255
[   71.293881] firmadyne: sys_socket[PID: 3391 (ip6tables)]: family:1, type:2, protocol:0
[   71.294362] firmadyne: sys_socket[PID: 3391 (ip6tables)]: family:10, type:3, protocol:255
[   71.301016] firmadyne: sys_socket[PID: 3218 (fw3)]: family:16, type:524291, protocol:0
[   71.362217] firmadyne: sys_socket[PID: 3393 (mosquitto)]: family:2, type:2, protocol:0
[   71.382338] firmadyne: sys_socket[PID: 3393 (mosquitto)]: family:1, type:524290, protocol:0
[   71.390056] firmadyne: sys_socket[PID: 3393 (mosquitto)]: family:1, type:524289, protocol:0
[   71.394714] firmadyne: sys_socket[PID: 3393 (mosquitto)]: family:2, type:2, protocol:6
[   71.395039] firmadyne: sys_setsockopt[PID: 3393 (mosquitto)]: fd:5, level:65535, optname:4
[   71.395313] firmadyne: sys_setsockopt[PID: 3393 (mosquitto)]: fd:5, level:41, optname:26
[   71.395706] firmadyne: inet_bind[PID: 3393 (mosquitto)]: proto:SOCK_STREAM, port:1883
[   71.396071] firmadyne: sys_socket[PID: 3393 (mosquitto)]: family:2, type:2, protocol:6
[   71.396334] firmadyne: sys_setsockopt[PID: 3393 (mosquitto)]: fd:6, level:65535, optname:4
[   71.396606] firmadyne: sys_setsockopt[PID: 3393 (mosquitto)]: fd:6, level:41, optname:26
[   71.396854] firmadyne: inet_bind[PID: 3393 (mosquitto)]: proto:SOCK_STREAM, port:8883
```
