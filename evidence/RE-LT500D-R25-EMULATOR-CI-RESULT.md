# RE-LT500D R25 emulator CI result

Commit: c3e903680b90c53f023e210bb616792aaf395c1a
Firmware download/verify: success
Image build: success
QEMU/HTTP gate: success
Run: https://github.com/diablomike20/Router-Emulator/actions/runs/35433292407

## HTTP headers
```text
HTTP/1.1 200 OK
Connection: Keep-Alive
Keep-Alive: timeout=20
ETag: "a19-25c-6890597d"
Last-Modified: Mon, 04 Aug 2025 06:55:57 GMT
Date: Sat, 19 Sep 2026 08:56:31 GMT
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
[   42.903583] firmadyne: sys_socket[PID: 3289 (fw3)]: family:2, type:3, protocol:255
[   42.904050] firmadyne: sys_socket[PID: 3289 (fw3)]: family:10, type:3, protocol:255
[   42.906738] firmadyne: sys_setsockopt[PID: 3289 (fw3)]: fd:10, level:41, optname:64
[   42.907789] firmadyne: sys_setsockopt[PID: 3289 (fw3)]: fd:10, level:41, optname:65
[   42.908236] firmadyne: sys_socket[PID: 3289 (fw3)]: family:10, type:3, protocol:255
[   42.908567] firmadyne: sys_socket[PID: 3289 (fw3)]: family:10, type:3, protocol:255
[   42.908861] firmadyne: sys_socket[PID: 3289 (fw3)]: family:10, type:3, protocol:255
[   42.911118] firmadyne: sys_socket[PID: 3289 (fw3)]: family:10, type:524289, protocol:17
[   42.911381] firmadyne: sys_socket[PID: 3289 (fw3)]: family:10, type:524289, protocol:17
[   42.913071] firmadyne: sys_socket[PID: 3289 (fw3)]: family:10, type:524289, protocol:17
[   42.913512] firmadyne: sys_socket[PID: 3289 (fw3)]: family:10, type:524289, protocol:17
[   42.913846] firmadyne: sys_socket[PID: 3289 (fw3)]: family:10, type:524289, protocol:17
[   42.914050] firmadyne: sys_socket[PID: 3289 (fw3)]: family:10, type:524289, protocol:17
[   42.914353] firmadyne: sys_socket[PID: 3289 (fw3)]: family:10, type:524289, protocol:17
[   42.914562] firmadyne: sys_socket[PID: 3289 (fw3)]: family:10, type:524289, protocol:17
[   42.914814] firmadyne: sys_socket[PID: 3289 (fw3)]: family:10, type:524289, protocol:17
[   42.915008] firmadyne: sys_socket[PID: 3289 (fw3)]: family:10, type:524289, protocol:17
[   42.915313] firmadyne: sys_socket[PID: 3289 (fw3)]: family:10, type:524289, protocol:17
[   42.915518] firmadyne: sys_socket[PID: 3289 (fw3)]: family:10, type:524289, protocol:17
[   42.915967] firmadyne: sys_socket[PID: 3289 (fw3)]: family:10, type:524289, protocol:17
[   42.916192] firmadyne: sys_socket[PID: 3289 (fw3)]: family:10, type:524289, protocol:17
[   42.916402] firmadyne: sys_socket[PID: 3289 (fw3)]: family:10, type:524289, protocol:17
[   42.916605] firmadyne: sys_socket[PID: 3289 (fw3)]: family:10, type:524289, protocol:17
[   42.918505] firmadyne: sys_setsockopt[PID: 3289 (fw3)]: fd:13, level:41, optname:64
[   42.919379] firmadyne: sys_socket[PID: 3289 (fw3)]: family:10, type:3, protocol:255
[   42.919747] firmadyne: sys_socket[PID: 3289 (fw3)]: family:10, type:3, protocol:255
[   42.920090] firmadyne: sys_socket[PID: 3289 (fw3)]: family:16, type:524291, protocol:0
[   42.964021] firmadyne: sys_socket[PID: 3297 (ipset)]: family:16, type:3, protocol:12
[   42.976983] firmadyne: sys_socket[PID: 3300 (ipset)]: family:16, type:3, protocol:12
[   42.996495] firmadyne: sys_socket[PID: 3304 (ipset)]: family:16, type:3, protocol:12
[   43.007110] firmadyne: sys_socket[PID: 3307 (ipset)]: family:16, type:3, protocol:12
[   43.017434] firmadyne: sys_socket[PID: 3310 (ipset)]: family:16, type:3, protocol:12
[   43.027668] firmadyne: sys_socket[PID: 3313 (ipset)]: family:16, type:3, protocol:12
[   43.037913] firmadyne: sys_socket[PID: 3316 (ipset)]: family:16, type:3, protocol:12
[   43.047932] firmadyne: sys_socket[PID: 3319 (ipset)]: family:16, type:3, protocol:12
[   43.073793] firmadyne: sys_socket[PID: 3323 (iptables)]: family:1, type:2, protocol:0
[   43.074107] firmadyne: sys_socket[PID: 3323 (iptables)]: family:2, type:3, protocol:255
[   43.076257] firmadyne: sys_setsockopt[PID: 3323 (iptables)]: fd:1, level:0, optname:64
[   43.076642] firmadyne: sys_setsockopt[PID: 3323 (iptables)]: fd:1, level:0, optname:65
[   43.088981] firmadyne: sys_socket[PID: 3324 (iptables)]: family:1, type:2, protocol:0
[   43.089436] firmadyne: sys_socket[PID: 3324 (iptables)]: family:2, type:3, protocol:255
[   43.099378] firmadyne: sys_socket[PID: 3325 (ip6tables)]: family:1, type:2, protocol:0
[   43.099685] firmadyne: sys_socket[PID: 3325 (ip6tables)]: family:10, type:3, protocol:255
[   43.102061] firmadyne: sys_setsockopt[PID: 3325 (ip6tables)]: fd:1, level:41, optname:64
[   43.102418] firmadyne: sys_setsockopt[PID: 3325 (ip6tables)]: fd:1, level:41, optname:65
[   43.114775] firmadyne: sys_socket[PID: 3326 (ip6tables)]: family:1, type:2, protocol:0
[   43.115057] firmadyne: sys_socket[PID: 3326 (ip6tables)]: family:10, type:3, protocol:255
[   43.127486] firmadyne: sys_socket[PID: 3327 (iptables)]: family:1, type:2, protocol:0
[   43.127786] firmadyne: sys_socket[PID: 3327 (iptables)]: family:2, type:3, protocol:255
[   43.129536] firmadyne: sys_setsockopt[PID: 3327 (iptables)]: fd:1, level:0, optname:64
[   43.129871] firmadyne: sys_setsockopt[PID: 3327 (iptables)]: fd:1, level:0, optname:65
[   43.141091] firmadyne: sys_socket[PID: 3328 (iptables)]: family:1, type:2, protocol:0
[   43.141470] firmadyne: sys_socket[PID: 3328 (iptables)]: family:2, type:3, protocol:255
[   43.143170] firmadyne: sys_setsockopt[PID: 3328 (iptables)]: fd:1, level:0, optname:64
[   43.143499] firmadyne: sys_setsockopt[PID: 3328 (iptables)]: fd:1, level:0, optname:65
[   43.154735] firmadyne: sys_socket[PID: 3329 (ip6tables)]: family:1, type:2, protocol:0
[   43.155017] firmadyne: sys_socket[PID: 3329 (ip6tables)]: family:10, type:3, protocol:255
[   43.156553] firmadyne: sys_setsockopt[PID: 3329 (ip6tables)]: fd:1, level:41, optname:64
[   43.156855] firmadyne: sys_setsockopt[PID: 3329 (ip6tables)]: fd:1, level:41, optname:65
[   43.168097] firmadyne: sys_socket[PID: 3330 (ip6tables)]: family:1, type:2, protocol:0
[   43.168380] firmadyne: sys_socket[PID: 3330 (ip6tables)]: family:10, type:3, protocol:255
[   43.170392] firmadyne: sys_setsockopt[PID: 3330 (ip6tables)]: fd:1, level:41, optname:64
[   43.170711] firmadyne: sys_setsockopt[PID: 3330 (ip6tables)]: fd:1, level:41, optname:65
[   43.174200] firmadyne: inet_accept[PID: 2408 (uhttpd)]:
[   43.174437] firmadyne: inet_accept[PID: 2408 (uhttpd)]:
[   43.212342] firmadyne: sys_socket[PID: 3333 (iptables)]: family:1, type:2, protocol:0
[   43.212690] firmadyne: sys_socket[PID: 3333 (iptables)]: family:2, type:3, protocol:255
[   43.214531] firmadyne: sys_setsockopt[PID: 3333 (iptables)]: fd:1, level:0, optname:64
[   43.214888] firmadyne: sys_setsockopt[PID: 3333 (iptables)]: fd:1, level:0, optname:65
[   43.227968] firmadyne: sys_socket[PID: 3334 (iptables)]: family:10, type:524289, protocol:17
[   43.228445] firmadyne: sys_socket[PID: 3334 (iptables)]: family:10, type:524289, protocol:17
[   43.230484] firmadyne: sys_socket[PID: 3334 (iptables)]: family:1, type:2, protocol:0
[   43.230777] firmadyne: sys_socket[PID: 3334 (iptables)]: family:2, type:3, protocol:255
[   43.232568] firmadyne: sys_setsockopt[PID: 3334 (iptables)]: fd:1, level:0, optname:64
[   43.232933] firmadyne: sys_setsockopt[PID: 3334 (iptables)]: fd:1, level:0, optname:65
[   43.245828] firmadyne: sys_socket[PID: 3335 (iptables)]: family:1, type:2, protocol:0
[   43.246120] firmadyne: sys_socket[PID: 3335 (iptables)]: family:2, type:3, protocol:255
[   43.247709] firmadyne: sys_setsockopt[PID: 3335 (iptables)]: fd:1, level:0, optname:64
[   43.248079] firmadyne: sys_setsockopt[PID: 3335 (iptables)]: fd:1, level:0, optname:65
[   43.259366] firmadyne: sys_socket[PID: 3336 (ip6tables)]: family:1, type:2, protocol:0
[   43.259657] firmadyne: sys_socket[PID: 3336 (ip6tables)]: family:10, type:3, protocol:255
[   43.261169] firmadyne: sys_setsockopt[PID: 3336 (ip6tables)]: fd:1, level:41, optname:64
[   43.261723] firmadyne: sys_setsockopt[PID: 3336 (ip6tables)]: fd:1, level:41, optname:65
[   43.274348] firmadyne: sys_socket[PID: 3337 (ip6tables)]: family:10, type:524289, protocol:17
[   43.274806] firmadyne: sys_socket[PID: 3337 (ip6tables)]: family:10, type:524289, protocol:17
[   43.276667] firmadyne: sys_socket[PID: 3337 (ip6tables)]: family:1, type:2, protocol:0
[   43.276920] firmadyne: sys_socket[PID: 3337 (ip6tables)]: family:10, type:3, protocol:255
[   43.278825] firmadyne: sys_setsockopt[PID: 3337 (ip6tables)]: fd:1, level:41, optname:64
[   43.279175] firmadyne: sys_setsockopt[PID: 3337 (ip6tables)]: fd:1, level:41, optname:65
[   43.292383] firmadyne: sys_socket[PID: 3338 (ip6tables)]: family:1, type:2, protocol:0
[   43.292679] firmadyne: sys_socket[PID: 3338 (ip6tables)]: family:10, type:3, protocol:255
[   43.294405] firmadyne: sys_setsockopt[PID: 3338 (ip6tables)]: fd:1, level:41, optname:64
[   43.294778] firmadyne: sys_setsockopt[PID: 3338 (ip6tables)]: fd:1, level:41, optname:65
[   43.319913] firmadyne: sys_socket[PID: 3340 (iptables)]: family:1, type:2, protocol:0
[   43.320207] firmadyne: sys_socket[PID: 3340 (iptables)]: family:2, type:3, protocol:255
[   43.322158] firmadyne: sys_setsockopt[PID: 3340 (iptables)]: fd:1, level:0, optname:64
[   43.322537] firmadyne: sys_setsockopt[PID: 3340 (iptables)]: fd:1, level:0, optname:65
[   43.334994] firmadyne: sys_socket[PID: 3341 (ip6tables)]: family:1, type:2, protocol:0
[   43.335277] firmadyne: sys_socket[PID: 3341 (ip6tables)]: family:10, type:3, protocol:255
[   43.337056] firmadyne: sys_setsockopt[PID: 3341 (ip6tables)]: fd:1, level:41, optname:64
[   43.337634] firmadyne: sys_setsockopt[PID: 3341 (ip6tables)]: fd:1, level:41, optname:65
[   43.362907] firmadyne: sys_socket[PID: 3343 (iptables)]: family:1, type:2, protocol:0
[   43.363211] firmadyne: sys_socket[PID: 3343 (iptables)]: family:2, type:3, protocol:255
[   43.364722] firmadyne: sys_setsockopt[PID: 3343 (iptables)]: fd:1, level:0, optname:64
[   43.365036] firmadyne: sys_setsockopt[PID: 3343 (iptables)]: fd:1, level:0, optname:65
[   43.376675] firmadyne: sys_socket[PID: 3344 (iptables)]: family:1, type:2, protocol:0
[   43.376974] firmadyne: sys_socket[PID: 3344 (iptables)]: family:2, type:3, protocol:255
[   43.378884] firmadyne: sys_setsockopt[PID: 3344 (iptables)]: fd:1, level:0, optname:64
[   43.379208] firmadyne: sys_setsockopt[PID: 3344 (iptables)]: fd:1, level:0, optname:65
[   43.390633] firmadyne: sys_socket[PID: 3345 (iptables)]: family:1, type:2, protocol:0
[   43.390961] firmadyne: sys_socket[PID: 3345 (iptables)]: family:2, type:3, protocol:255
[   43.392719] firmadyne: sys_setsockopt[PID: 3345 (iptables)]: fd:1, level:0, optname:64
[   43.393038] firmadyne: sys_setsockopt[PID: 3345 (iptables)]: fd:1, level:0, optname:65
[   43.406441] firmadyne: sys_socket[PID: 3346 (iptables)]: family:1, type:2, protocol:0
[   43.406761] firmadyne: sys_socket[PID: 3346 (iptables)]: family:2, type:3, protocol:255
[   43.548870] firmadyne: sys_socket[PID: 3354 (iptables)]: family:1, type:2, protocol:0
[   43.549186] firmadyne: sys_socket[PID: 3354 (iptables)]: family:2, type:3, protocol:255
[   43.564794] firmadyne: sys_socket[PID: 3355 (iptables)]: family:1, type:2, protocol:0
[   43.565097] firmadyne: sys_socket[PID: 3355 (iptables)]: family:2, type:3, protocol:255
[   43.566726] firmadyne: sys_setsockopt[PID: 3355 (iptables)]: fd:1, level:0, optname:64
[   43.581903] firmadyne: sys_socket[PID: 3358 (iptables)]: family:1, type:2, protocol:0
[   43.582205] firmadyne: sys_socket[PID: 3358 (iptables)]: family:2, type:3, protocol:255
[   43.597732] firmadyne: sys_socket[PID: 3359 (iptables)]: family:1, type:2, protocol:0
[   43.598021] firmadyne: sys_socket[PID: 3359 (iptables)]: family:2, type:3, protocol:255
[   43.613541] firmadyne: sys_socket[PID: 3360 (iptables)]: family:1, type:2, protocol:0
[   43.613863] firmadyne: sys_socket[PID: 3360 (iptables)]: family:2, type:3, protocol:255
[   43.708021] firmadyne: sys_socket[PID: 3369 (iptables)]: family:1, type:2, protocol:0
[   43.708339] firmadyne: sys_socket[PID: 3369 (iptables)]: family:2, type:3, protocol:255
[   43.721976] firmadyne: sys_socket[PID: 3370 (iptables)]: family:1, type:2, protocol:0
[   43.722269] firmadyne: sys_socket[PID: 3370 (iptables)]: family:2, type:3, protocol:255
[   43.736454] firmadyne: sys_socket[PID: 3371 (iptables)]: family:1, type:2, protocol:0
[   43.736768] firmadyne: sys_socket[PID: 3371 (iptables)]: family:2, type:3, protocol:255
[   43.749046] firmadyne: sys_socket[PID: 3372 (iptables)]: family:1, type:2, protocol:0
[   43.749510] firmadyne: sys_socket[PID: 3372 (iptables)]: family:2, type:3, protocol:255
[   43.757720] firmadyne: sys_socket[PID: 3373 (iptables)]: family:1, type:2, protocol:0
[   43.758009] firmadyne: sys_socket[PID: 3373 (iptables)]: family:2, type:3, protocol:255
[   43.770373] firmadyne: sys_socket[PID: 3374 (iptables)]: family:1, type:2, protocol:0
[   43.770699] firmadyne: sys_socket[PID: 3374 (iptables)]: family:2, type:3, protocol:255
[   43.834344] firmadyne: sys_socket[PID: 3379 (ubus)]: family:1, type:2, protocol:0
[   43.878118] firmadyne: sys_socket[PID: 3382 (logger)]: family:1, type:524289, protocol:0
[   43.891388] firmadyne: sys_socket[PID: 3383 (iptables)]: family:1, type:2, protocol:0
[   43.891720] firmadyne: sys_socket[PID: 3383 (iptables)]: family:2, type:3, protocol:255
[   43.903882] firmadyne: sys_socket[PID: 3384 (iptables)]: family:1, type:2, protocol:0
[   43.904175] firmadyne: sys_socket[PID: 3384 (iptables)]: family:2, type:3, protocol:255
[   43.916250] firmadyne: sys_socket[PID: 3385 (iptables)]: family:1, type:2, protocol:0
[   43.916559] firmadyne: sys_socket[PID: 3385 (iptables)]: family:2, type:3, protocol:255
[   43.927161] firmadyne: sys_socket[PID: 3386 (ip)]: family:16, type:524291, protocol:0
[   43.927413] firmadyne: sys_setsockopt[PID: 3386 (ip)]: fd:0, level:65535, optname:4097
[   43.927645] firmadyne: sys_setsockopt[PID: 3386 (ip)]: fd:0, level:65535, optname:4098
[   43.940650] firmadyne: sys_socket[PID: 3387 (ipset)]: family:16, type:3, protocol:12
[   43.950872] firmadyne: sys_socket[PID: 3390 (ipset)]: family:16, type:3, protocol:12
[   43.960913] firmadyne: sys_socket[PID: 3393 (ipset)]: family:16, type:3, protocol:12
[   43.971255] firmadyne: sys_socket[PID: 3396 (ipset)]: family:16, type:3, protocol:12
[   43.981321] firmadyne: sys_socket[PID: 3399 (ipset)]: family:16, type:3, protocol:12
[   43.991407] firmadyne: sys_socket[PID: 3402 (ipset)]: family:16, type:3, protocol:12
[   44.016539] firmadyne: sys_socket[PID: 3406 (ipset)]: family:16, type:3, protocol:12
[   44.026497] firmadyne: sys_socket[PID: 3409 (ipset)]: family:16, type:3, protocol:12
[   44.102196] firmadyne: sys_socket[PID: 3417 (iptables)]: family:1, type:2, protocol:0
[   44.102540] firmadyne: sys_socket[PID: 3417 (iptables)]: family:2, type:3, protocol:255
[   44.115040] firmadyne: sys_socket[PID: 3418 (iptables)]: family:1, type:2, protocol:0
[   44.115360] firmadyne: sys_socket[PID: 3418 (iptables)]: family:2, type:3, protocol:255
[   44.116281] firmadyne: sys_socket[PID: 3418 (iptables)]: family:2, type:3, protocol:255
[   44.127977] firmadyne: sys_socket[PID: 3423 (iptables)]: family:1, type:2, protocol:0
[   44.128280] firmadyne: sys_socket[PID: 3423 (iptables)]: family:2, type:3, protocol:255
[   44.128954] firmadyne: sys_socket[PID: 3423 (iptables)]: family:2, type:3, protocol:255
[   44.140757] firmadyne: sys_socket[PID: 3428 (ip6tables)]: family:1, type:2, protocol:0
[   44.141038] firmadyne: sys_socket[PID: 3428 (ip6tables)]: family:10, type:3, protocol:255
[   44.176944] firmadyne: sys_socket[PID: 3431 (hyfibrd)]: family:1, type:524289, protocol:0
[   44.182242] firmadyne: sys_socket[PID: 3431 (hyfibrd)]: family:16, type:3, protocol:26
[   44.190614] firmadyne: sys_socket[PID: 1 (procd)]: family:1, type:524289, protocol:0
[   44.194907] firmadyne: sys_socket[PID: 3433 (iptables)]: family:1, type:2, protocol:0
[   44.195209] firmadyne: sys_socket[PID: 3433 (iptables)]: family:2, type:3, protocol:255
[   44.214791] firmadyne: sys_socket[PID: 3437 (iptables)]: family:1, type:2, protocol:0
[   44.215096] firmadyne: sys_socket[PID: 3437 (iptables)]: family:2, type:3, protocol:255
[   44.223772] firmadyne: sys_socket[PID: 3438 (iptables)]: family:1, type:2, protocol:0
[   44.224069] firmadyne: sys_socket[PID: 3438 (iptables)]: family:2, type:3, protocol:255
[   44.224789] firmadyne: sys_socket[PID: 3438 (iptables)]: family:2, type:3, protocol:255
[   44.238482] firmadyne: sys_socket[PID: 3444 (iptables)]: family:1, type:2, protocol:0
[   44.238803] firmadyne: sys_socket[PID: 3444 (iptables)]: family:2, type:3, protocol:255
[   44.239742] firmadyne: sys_socket[PID: 3444 (iptables)]: family:2, type:3, protocol:255
[   44.252686] firmadyne: sys_socket[PID: 3450 (iptables)]: family:1, type:2, protocol:0
[   44.252992] firmadyne: sys_socket[PID: 3450 (iptables)]: family:2, type:3, protocol:255
[   44.253847] firmadyne: sys_socket[PID: 3450 (iptables)]: family:2, type:3, protocol:255
[   44.272229] firmadyne: sys_socket[PID: 3456 (ip6tables)]: family:1, type:2, protocol:0
[   44.272524] firmadyne: sys_socket[PID: 3456 (ip6tables)]: family:10, type:3, protocol:255
[   44.286734] firmadyne: sys_socket[PID: 3458 (ip6tables)]: family:1, type:2, protocol:0
[   44.287022] firmadyne: sys_socket[PID: 3458 (ip6tables)]: family:10, type:3, protocol:255
[   44.290665] firmadyne: sys_socket[PID: 3289 (fw3)]: family:16, type:524291, protocol:0
[   44.495686] firmadyne: sys_socket[PID: 3460 (mosquitto)]: family:2, type:2, protocol:0
[   44.507159] firmadyne: sys_socket[PID: 3460 (mosquitto)]: family:1, type:524290, protocol:0
[   44.511390] firmadyne: sys_socket[PID: 3460 (mosquitto)]: family:1, type:524289, protocol:0
[   44.514123] firmadyne: sys_socket[PID: 3460 (mosquitto)]: family:2, type:2, protocol:6
[   44.514346] firmadyne: sys_setsockopt[PID: 3460 (mosquitto)]: fd:5, level:65535, optname:4
[   44.514551] firmadyne: sys_setsockopt[PID: 3460 (mosquitto)]: fd:5, level:41, optname:26
[   44.514797] firmadyne: inet_bind[PID: 3460 (mosquitto)]: proto:SOCK_STREAM, port:1883
[   44.515052] firmadyne: sys_socket[PID: 3460 (mosquitto)]: family:2, type:2, protocol:6
[   44.515234] firmadyne: sys_setsockopt[PID: 3460 (mosquitto)]: fd:6, level:65535, optname:4
[   44.515414] firmadyne: sys_setsockopt[PID: 3460 (mosquitto)]: fd:6, level:41, optname:26
[   44.515601] firmadyne: inet_bind[PID: 3460 (mosquitto)]: proto:SOCK_STREAM, port:8883
[   44.686249] firmadyne: inet_accept[PID: 2408 (uhttpd)]:
[   44.686714] firmadyne: inet_accept[PID: 2408 (uhttpd)]:
[   44.686873] firmadyne: inet_accept[PID: 2408 (uhttpd)]:
[   44.922428] firmadyne: sys_socket[PID: 3461 (softapd)]: family:1, type:524289, protocol:0
[   45.318554] firmadyne: inet_accept[PID: 2408 (uhttpd)]:
[   45.318965] firmadyne: inet_accept[PID: 2408 (uhttpd)]:
[   45.330080] firmadyne: sys_socket[PID: 3462 (ifconfig)]: family:2, type:1, protocol:0
[   45.331029] firmadyne: __inet_insert_ifa[PID: 3462 (ifconfig)]: device:eth1 ifa:0x00000000
[   45.344011] firmadyne: sys_socket[PID: 3463 (brctl)]: family:2, type:2, protocol:0
[   45.344581] firmadyne: sys_socket[PID: 3463 (brctl)]: family:1, type:524289, protocol:0
[   45.345129] firmadyne: sys_socket[PID: 3463 (brctl)]: family:1, type:524289, protocol:0
[   45.349399] firmadyne: sys_socket[PID: 3463 (brctl)]: family:1, type:524289, protocol:0
[   45.363788] firmadyne: sys_socket[PID: 3465 (iptables)]: family:1, type:2, protocol:0
[   45.364107] firmadyne: sys_socket[PID: 3465 (iptables)]: family:2, type:3, protocol:255
[   45.378835] firmadyne: sys_socket[PID: 3466 (iptables)]: family:1, type:2, protocol:0
[   45.379127] firmadyne: sys_socket[PID: 3466 (iptables)]: family:2, type:3, protocol:255
[   45.393276] firmadyne: sys_socket[PID: 3467 (iptables)]: family:1, type:2, protocol:0
[   45.393613] firmadyne: sys_socket[PID: 3467 (iptables)]: family:2, type:3, protocol:255
[   45.407821] firmadyne: sys_socket[PID: 3468 (iptables)]: family:1, type:2, protocol:0
[   45.408134] firmadyne: sys_socket[PID: 3468 (iptables)]: family:2, type:3, protocol:255
[   46.280541] firmadyne: sys_socket[PID: 3470 (gcom)]: family:1, type:524289, protocol:0
```
