# RE-LT500D R25 emulator CI result

Commit: 881c49a96978b8ec0ed4c17ddf5816f58b482b96
Firmware download/verify: success
Image build: success
QEMU/HTTP gate: success
Run: https://github.com/diablomike20/Router-Emulator/actions/runs/35436016335

## HTTP headers
```text
HTTP/1.1 200 OK
Connection: Keep-Alive
Keep-Alive: timeout=20
ETag: "a19-25c-6890597d"
Last-Modified: Mon, 04 Aug 2025 06:55:57 GMT
Date: Sat, 19 Sep 2026 09:56:49 GMT
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
[   43.962003] firmadyne: sys_socket[PID: 3439 (fw3)]: family:10, type:3, protocol:255
[   43.964485] firmadyne: sys_setsockopt[PID: 3439 (fw3)]: fd:10, level:41, optname:64
[   43.965535] firmadyne: sys_setsockopt[PID: 3439 (fw3)]: fd:10, level:41, optname:65
[   43.966157] firmadyne: sys_socket[PID: 3439 (fw3)]: family:10, type:3, protocol:255
[   43.966500] firmadyne: sys_socket[PID: 3439 (fw3)]: family:10, type:3, protocol:255
[   43.966792] firmadyne: sys_socket[PID: 3439 (fw3)]: family:10, type:3, protocol:255
[   43.968607] firmadyne: sys_socket[PID: 3439 (fw3)]: family:10, type:524289, protocol:17
[   43.968852] firmadyne: sys_socket[PID: 3439 (fw3)]: family:10, type:524289, protocol:17
[   43.970695] firmadyne: sys_socket[PID: 3439 (fw3)]: family:10, type:524289, protocol:17
[   43.970946] firmadyne: sys_socket[PID: 3439 (fw3)]: family:10, type:524289, protocol:17
[   43.971238] firmadyne: sys_socket[PID: 3439 (fw3)]: family:10, type:524289, protocol:17
[   43.971444] firmadyne: sys_socket[PID: 3439 (fw3)]: family:10, type:524289, protocol:17
[   43.971731] firmadyne: sys_socket[PID: 3439 (fw3)]: family:10, type:524289, protocol:17
[   43.971932] firmadyne: sys_socket[PID: 3439 (fw3)]: family:10, type:524289, protocol:17
[   43.972191] firmadyne: sys_socket[PID: 3439 (fw3)]: family:10, type:524289, protocol:17
[   43.972393] firmadyne: sys_socket[PID: 3439 (fw3)]: family:10, type:524289, protocol:17
[   43.972695] firmadyne: sys_socket[PID: 3439 (fw3)]: family:10, type:524289, protocol:17
[   43.972897] firmadyne: sys_socket[PID: 3439 (fw3)]: family:10, type:524289, protocol:17
[   43.973341] firmadyne: sys_socket[PID: 3439 (fw3)]: family:10, type:524289, protocol:17
[   43.973572] firmadyne: sys_socket[PID: 3439 (fw3)]: family:10, type:524289, protocol:17
[   43.973791] firmadyne: sys_socket[PID: 3439 (fw3)]: family:10, type:524289, protocol:17
[   43.974334] firmadyne: sys_socket[PID: 3439 (fw3)]: family:10, type:524289, protocol:17
[   43.975809] firmadyne: sys_setsockopt[PID: 3439 (fw3)]: fd:13, level:41, optname:64
[   43.976574] firmadyne: sys_socket[PID: 3439 (fw3)]: family:10, type:3, protocol:255
[   43.976938] firmadyne: sys_socket[PID: 3439 (fw3)]: family:10, type:3, protocol:255
[   43.977299] firmadyne: sys_socket[PID: 3439 (fw3)]: family:16, type:524291, protocol:0
[   44.018843] firmadyne: sys_socket[PID: 3447 (ipset)]: family:16, type:3, protocol:12
[   44.030440] firmadyne: sys_socket[PID: 3450 (ipset)]: family:16, type:3, protocol:12
[   44.048364] firmadyne: sys_socket[PID: 3454 (ipset)]: family:16, type:3, protocol:12
[   44.053548] firmadyne: sys_socket[PID: 3457 (ipset)]: family:16, type:3, protocol:12
[   44.064015] firmadyne: sys_socket[PID: 3460 (ipset)]: family:16, type:3, protocol:12
[   44.074417] firmadyne: sys_socket[PID: 3463 (ipset)]: family:16, type:3, protocol:12
[   44.099601] firmadyne: sys_socket[PID: 3466 (ipset)]: family:16, type:3, protocol:12
[   44.118069] firmadyne: sys_socket[PID: 3469 (ipset)]: family:16, type:3, protocol:12
[   44.144960] firmadyne: sys_socket[PID: 3473 (iptables)]: family:1, type:2, protocol:0
[   44.145308] firmadyne: sys_socket[PID: 3473 (iptables)]: family:2, type:3, protocol:255
[   44.147537] firmadyne: sys_setsockopt[PID: 3473 (iptables)]: fd:1, level:0, optname:64
[   44.147925] firmadyne: sys_setsockopt[PID: 3473 (iptables)]: fd:1, level:0, optname:65
[   44.160605] firmadyne: sys_socket[PID: 3474 (iptables)]: family:1, type:2, protocol:0
[   44.160929] firmadyne: sys_socket[PID: 3474 (iptables)]: family:2, type:3, protocol:255
[   44.175402] firmadyne: sys_socket[PID: 3475 (ip6tables)]: family:1, type:2, protocol:0
[   44.175700] firmadyne: sys_socket[PID: 3475 (ip6tables)]: family:10, type:3, protocol:255
[   44.178089] firmadyne: sys_setsockopt[PID: 3475 (ip6tables)]: fd:1, level:41, optname:64
[   44.178449] firmadyne: sys_setsockopt[PID: 3475 (ip6tables)]: fd:1, level:41, optname:65
[   44.191334] firmadyne: sys_socket[PID: 3476 (ip6tables)]: family:1, type:2, protocol:0
[   44.191632] firmadyne: sys_socket[PID: 3476 (ip6tables)]: family:10, type:3, protocol:255
[   44.204330] firmadyne: sys_socket[PID: 3477 (iptables)]: family:1, type:2, protocol:0
[   44.204641] firmadyne: sys_socket[PID: 3477 (iptables)]: family:2, type:3, protocol:255
[   44.206436] firmadyne: sys_setsockopt[PID: 3477 (iptables)]: fd:1, level:0, optname:64
[   44.206784] firmadyne: sys_setsockopt[PID: 3477 (iptables)]: fd:1, level:0, optname:65
[   44.218145] firmadyne: sys_socket[PID: 3478 (iptables)]: family:1, type:2, protocol:0
[   44.218451] firmadyne: sys_socket[PID: 3478 (iptables)]: family:2, type:3, protocol:255
[   44.220133] firmadyne: sys_setsockopt[PID: 3478 (iptables)]: fd:1, level:0, optname:64
[   44.220452] firmadyne: sys_setsockopt[PID: 3478 (iptables)]: fd:1, level:0, optname:65
[   44.231915] firmadyne: sys_socket[PID: 3479 (ip6tables)]: family:1, type:2, protocol:0
[   44.232257] firmadyne: sys_socket[PID: 3479 (ip6tables)]: family:10, type:3, protocol:255
[   44.234214] firmadyne: sys_setsockopt[PID: 3479 (ip6tables)]: fd:1, level:41, optname:64
[   44.234560] firmadyne: sys_setsockopt[PID: 3479 (ip6tables)]: fd:1, level:41, optname:65
[   44.247088] firmadyne: sys_socket[PID: 3480 (ip6tables)]: family:1, type:2, protocol:0
[   44.247399] firmadyne: sys_socket[PID: 3480 (ip6tables)]: family:10, type:3, protocol:255
[   44.249155] firmadyne: sys_setsockopt[PID: 3480 (ip6tables)]: fd:1, level:41, optname:64
[   44.249494] firmadyne: sys_setsockopt[PID: 3480 (ip6tables)]: fd:1, level:41, optname:65
[   44.285599] firmadyne: sys_socket[PID: 3483 (iptables)]: family:1, type:2, protocol:0
[   44.285953] firmadyne: sys_socket[PID: 3483 (iptables)]: family:2, type:3, protocol:255
[   44.287607] firmadyne: sys_setsockopt[PID: 3483 (iptables)]: fd:1, level:0, optname:64
[   44.287936] firmadyne: sys_setsockopt[PID: 3483 (iptables)]: fd:1, level:0, optname:65
[   44.301100] firmadyne: sys_socket[PID: 3484 (iptables)]: family:10, type:524289, protocol:17
[   44.301591] firmadyne: sys_socket[PID: 3484 (iptables)]: family:10, type:524289, protocol:17
[   44.303652] firmadyne: sys_socket[PID: 3484 (iptables)]: family:1, type:2, protocol:0
[   44.303969] firmadyne: sys_socket[PID: 3484 (iptables)]: family:2, type:3, protocol:255
[   44.305695] firmadyne: sys_setsockopt[PID: 3484 (iptables)]: fd:1, level:0, optname:64
[   44.306357] firmadyne: sys_setsockopt[PID: 3484 (iptables)]: fd:1, level:0, optname:65
[   44.319788] firmadyne: sys_socket[PID: 3485 (iptables)]: family:1, type:2, protocol:0
[   44.320111] firmadyne: sys_socket[PID: 3485 (iptables)]: family:2, type:3, protocol:255
[   44.321765] firmadyne: sys_setsockopt[PID: 3485 (iptables)]: fd:1, level:0, optname:64
[   44.322378] firmadyne: sys_setsockopt[PID: 3485 (iptables)]: fd:1, level:0, optname:65
[   44.334061] firmadyne: sys_socket[PID: 3486 (ip6tables)]: family:1, type:2, protocol:0
[   44.334350] firmadyne: sys_socket[PID: 3486 (ip6tables)]: family:10, type:3, protocol:255
[   44.335919] firmadyne: sys_setsockopt[PID: 3486 (ip6tables)]: fd:1, level:41, optname:64
[   44.336242] firmadyne: sys_setsockopt[PID: 3486 (ip6tables)]: fd:1, level:41, optname:65
[   44.349456] firmadyne: sys_socket[PID: 3487 (ip6tables)]: family:10, type:524289, protocol:17
[   44.350105] firmadyne: sys_socket[PID: 3487 (ip6tables)]: family:10, type:524289, protocol:17
[   44.352048] firmadyne: sys_socket[PID: 3487 (ip6tables)]: family:1, type:2, protocol:0
[   44.352300] firmadyne: sys_socket[PID: 3487 (ip6tables)]: family:10, type:3, protocol:255
[   44.354200] firmadyne: sys_setsockopt[PID: 3487 (ip6tables)]: fd:1, level:41, optname:64
[   44.354563] firmadyne: sys_setsockopt[PID: 3487 (ip6tables)]: fd:1, level:41, optname:65
[   44.367870] firmadyne: sys_socket[PID: 3488 (ip6tables)]: family:1, type:2, protocol:0
[   44.368179] firmadyne: sys_socket[PID: 3488 (ip6tables)]: family:10, type:3, protocol:255
[   44.369962] firmadyne: sys_setsockopt[PID: 3488 (ip6tables)]: fd:1, level:41, optname:64
[   44.370350] firmadyne: sys_setsockopt[PID: 3488 (ip6tables)]: fd:1, level:41, optname:65
[   44.395841] firmadyne: sys_socket[PID: 3490 (iptables)]: family:1, type:2, protocol:0
[   44.396151] firmadyne: sys_socket[PID: 3490 (iptables)]: family:2, type:3, protocol:255
[   44.398036] firmadyne: sys_setsockopt[PID: 3490 (iptables)]: fd:1, level:0, optname:64
[   44.398423] firmadyne: sys_setsockopt[PID: 3490 (iptables)]: fd:1, level:0, optname:65
[   44.406345] firmadyne: sys_socket[PID: 3491 (ip6tables)]: family:1, type:2, protocol:0
[   44.406634] firmadyne: sys_socket[PID: 3491 (ip6tables)]: family:10, type:3, protocol:255
[   44.408347] firmadyne: sys_setsockopt[PID: 3491 (ip6tables)]: fd:1, level:41, optname:64
[   44.408716] firmadyne: sys_setsockopt[PID: 3491 (ip6tables)]: fd:1, level:41, optname:65
[   44.420964] firmadyne: sys_socket[PID: 3493 (iptables)]: family:1, type:2, protocol:0
[   44.421288] firmadyne: sys_socket[PID: 3493 (iptables)]: family:2, type:3, protocol:255
[   44.423003] firmadyne: sys_setsockopt[PID: 3493 (iptables)]: fd:1, level:0, optname:64
[   44.423337] firmadyne: sys_setsockopt[PID: 3493 (iptables)]: fd:1, level:0, optname:65
[   44.434618] firmadyne: sys_socket[PID: 3494 (iptables)]: family:1, type:2, protocol:0
[   44.434941] firmadyne: sys_socket[PID: 3494 (iptables)]: family:2, type:3, protocol:255
[   44.436788] firmadyne: sys_setsockopt[PID: 3494 (iptables)]: fd:1, level:0, optname:64
[   44.437131] firmadyne: sys_setsockopt[PID: 3494 (iptables)]: fd:1, level:0, optname:65
[   44.448913] firmadyne: sys_socket[PID: 3495 (iptables)]: family:1, type:2, protocol:0
[   44.449240] firmadyne: sys_socket[PID: 3495 (iptables)]: family:2, type:3, protocol:255
[   44.451260] firmadyne: sys_setsockopt[PID: 3495 (iptables)]: fd:1, level:0, optname:64
[   44.451598] firmadyne: sys_setsockopt[PID: 3495 (iptables)]: fd:1, level:0, optname:65
[   44.466038] firmadyne: sys_socket[PID: 3496 (iptables)]: family:1, type:2, protocol:0
[   44.466342] firmadyne: sys_socket[PID: 3496 (iptables)]: family:2, type:3, protocol:255
[   44.597353] firmadyne: sys_socket[PID: 3504 (iptables)]: family:1, type:2, protocol:0
[   44.597668] firmadyne: sys_socket[PID: 3504 (iptables)]: family:2, type:3, protocol:255
[   44.612922] firmadyne: sys_socket[PID: 3505 (iptables)]: family:1, type:2, protocol:0
[   44.613265] firmadyne: sys_socket[PID: 3505 (iptables)]: family:2, type:3, protocol:255
[   44.614890] firmadyne: sys_setsockopt[PID: 3505 (iptables)]: fd:1, level:0, optname:64
[   44.630221] firmadyne: sys_socket[PID: 3508 (iptables)]: family:1, type:2, protocol:0
[   44.630533] firmadyne: sys_socket[PID: 3508 (iptables)]: family:2, type:3, protocol:255
[   44.646829] firmadyne: sys_socket[PID: 3509 (iptables)]: family:1, type:2, protocol:0
[   44.647139] firmadyne: sys_socket[PID: 3509 (iptables)]: family:2, type:3, protocol:255
[   44.663144] firmadyne: sys_socket[PID: 3510 (iptables)]: family:1, type:2, protocol:0
[   44.663438] firmadyne: sys_socket[PID: 3510 (iptables)]: family:2, type:3, protocol:255
[   44.747145] firmadyne: sys_socket[PID: 3519 (iptables)]: family:1, type:2, protocol:0
[   44.747478] firmadyne: sys_socket[PID: 3519 (iptables)]: family:2, type:3, protocol:255
[   44.761353] firmadyne: sys_socket[PID: 3520 (iptables)]: family:1, type:2, protocol:0
[   44.761651] firmadyne: sys_socket[PID: 3520 (iptables)]: family:2, type:3, protocol:255
[   44.774192] firmadyne: sys_socket[PID: 3521 (iptables)]: family:1, type:2, protocol:0
[   44.774483] firmadyne: sys_socket[PID: 3521 (iptables)]: family:2, type:3, protocol:255
[   44.786848] firmadyne: sys_socket[PID: 3522 (iptables)]: family:1, type:2, protocol:0
[   44.787151] firmadyne: sys_socket[PID: 3522 (iptables)]: family:2, type:3, protocol:255
[   44.799518] firmadyne: sys_socket[PID: 3523 (iptables)]: family:1, type:2, protocol:0
[   44.799812] firmadyne: sys_socket[PID: 3523 (iptables)]: family:2, type:3, protocol:255
[   44.811906] firmadyne: sys_socket[PID: 3524 (iptables)]: family:1, type:2, protocol:0
[   44.812235] firmadyne: sys_socket[PID: 3524 (iptables)]: family:2, type:3, protocol:255
[   44.853698] firmadyne: inet_accept[PID: 2239 (uhttpd)]:
[   44.853978] firmadyne: inet_accept[PID: 2239 (uhttpd)]:
[   44.854141] firmadyne: inet_accept[PID: 2239 (uhttpd)]:
[   44.878597] firmadyne: sys_socket[PID: 3529 (ubus)]: family:1, type:2, protocol:0
[   44.922068] firmadyne: sys_socket[PID: 3532 (logger)]: family:1, type:524289, protocol:0
[   44.931195] firmadyne: sys_socket[PID: 3533 (iptables)]: family:1, type:2, protocol:0
[   44.931504] firmadyne: sys_socket[PID: 3533 (iptables)]: family:2, type:3, protocol:255
[   44.943825] firmadyne: sys_socket[PID: 3534 (iptables)]: family:1, type:2, protocol:0
[   44.944146] firmadyne: sys_socket[PID: 3534 (iptables)]: family:2, type:3, protocol:255
[   44.956493] firmadyne: sys_socket[PID: 3535 (iptables)]: family:1, type:2, protocol:0
[   44.956803] firmadyne: sys_socket[PID: 3535 (iptables)]: family:2, type:3, protocol:255
[   44.967325] firmadyne: sys_socket[PID: 3536 (ip)]: family:16, type:524291, protocol:0
[   44.967584] firmadyne: sys_setsockopt[PID: 3536 (ip)]: fd:0, level:65535, optname:4097
[   44.967813] firmadyne: sys_setsockopt[PID: 3536 (ip)]: fd:0, level:65535, optname:4098
[   44.980605] firmadyne: sys_socket[PID: 3537 (ipset)]: family:16, type:3, protocol:12
[   44.990670] firmadyne: sys_socket[PID: 3540 (ipset)]: family:16, type:3, protocol:12
[   45.000493] firmadyne: sys_socket[PID: 3543 (ipset)]: family:16, type:3, protocol:12
[   45.010325] firmadyne: sys_socket[PID: 3546 (ipset)]: family:16, type:3, protocol:12
[   45.020033] firmadyne: sys_socket[PID: 3549 (ipset)]: family:16, type:3, protocol:12
[   45.029892] firmadyne: sys_socket[PID: 3552 (ipset)]: family:16, type:3, protocol:12
[   45.057021] firmadyne: sys_socket[PID: 3556 (ipset)]: family:16, type:3, protocol:12
[   45.067225] firmadyne: sys_socket[PID: 3559 (ipset)]: family:16, type:3, protocol:12
[   45.173141] firmadyne: sys_socket[PID: 3567 (iptables)]: family:1, type:2, protocol:0
[   45.173479] firmadyne: sys_socket[PID: 3567 (iptables)]: family:2, type:3, protocol:255
[   45.181767] firmadyne: sys_socket[PID: 3568 (iptables)]: family:1, type:2, protocol:0
[   45.182157] firmadyne: sys_socket[PID: 3568 (iptables)]: family:2, type:3, protocol:255
[   45.183118] firmadyne: sys_socket[PID: 3568 (iptables)]: family:2, type:3, protocol:255
[   45.194752] firmadyne: sys_socket[PID: 3573 (iptables)]: family:1, type:2, protocol:0
[   45.195081] firmadyne: sys_socket[PID: 3573 (iptables)]: family:2, type:3, protocol:255
[   45.195747] firmadyne: sys_socket[PID: 3573 (iptables)]: family:2, type:3, protocol:255
[   45.207542] firmadyne: sys_socket[PID: 3578 (ip6tables)]: family:1, type:2, protocol:0
[   45.207839] firmadyne: sys_socket[PID: 3578 (ip6tables)]: family:10, type:3, protocol:255
[   45.259788] firmadyne: sys_socket[PID: 3582 (iptables)]: family:1, type:2, protocol:0
[   45.260129] firmadyne: sys_socket[PID: 3582 (iptables)]: family:2, type:3, protocol:255
[   45.276085] firmadyne: sys_socket[PID: 3584 (iptables)]: family:1, type:2, protocol:0
[   45.276411] firmadyne: sys_socket[PID: 3584 (iptables)]: family:2, type:3, protocol:255
[   45.300585] firmadyne: sys_socket[PID: 3586 (iptables)]: family:1, type:2, protocol:0
[   45.300916] firmadyne: sys_socket[PID: 3586 (iptables)]: family:2, type:3, protocol:255
[   45.303251] firmadyne: sys_socket[PID: 3585 (softapd)]: family:1, type:524289, protocol:0
[   45.306391] firmadyne: sys_socket[PID: 3586 (iptables)]: family:2, type:3, protocol:255
[   45.309161] firmadyne: sys_socket[PID: 1 (procd)]: family:1, type:524289, protocol:0
[   45.331320] firmadyne: sys_socket[PID: 3592 (iptables)]: family:1, type:2, protocol:0
[   45.331650] firmadyne: sys_socket[PID: 3592 (iptables)]: family:2, type:3, protocol:255
[   45.333408] firmadyne: sys_socket[PID: 3592 (iptables)]: family:2, type:3, protocol:255
[   45.346419] firmadyne: sys_socket[PID: 3598 (iptables)]: family:1, type:2, protocol:0
[   45.346735] firmadyne: sys_socket[PID: 3598 (iptables)]: family:2, type:3, protocol:255
[   45.347397] firmadyne: sys_socket[PID: 3598 (iptables)]: family:2, type:3, protocol:255
[   45.354662] firmadyne: inet_accept[PID: 2239 (uhttpd)]:
[   45.354890] firmadyne: inet_accept[PID: 2239 (uhttpd)]:
[   45.369611] firmadyne: sys_socket[PID: 3604 (ip6tables)]: family:1, type:2, protocol:0
[   45.372766] firmadyne: sys_socket[PID: 3604 (ip6tables)]: family:10, type:3, protocol:255
[   45.386866] firmadyne: sys_socket[PID: 3606 (ip6tables)]: family:1, type:2, protocol:0
[   45.387155] firmadyne: sys_socket[PID: 3606 (ip6tables)]: family:10, type:3, protocol:255
[   45.390801] firmadyne: sys_socket[PID: 3439 (fw3)]: family:16, type:524291, protocol:0
[   45.412468] firmadyne: sys_socket[PID: 3608 (ifconfig)]: family:2, type:1, protocol:0
[   45.413437] firmadyne: __inet_insert_ifa[PID: 3608 (ifconfig)]: device:eth1 ifa:0x00000000
[   45.431878] firmadyne: sys_socket[PID: 3609 (brctl)]: family:2, type:2, protocol:0
[   45.432457] firmadyne: sys_socket[PID: 3609 (brctl)]: family:1, type:524289, protocol:0
[   45.433014] firmadyne: sys_socket[PID: 3609 (brctl)]: family:1, type:524289, protocol:0
[   45.433244] firmadyne: sys_socket[PID: 3609 (brctl)]: family:1, type:524289, protocol:0
[   45.449906] firmadyne: sys_socket[PID: 3611 (iptables)]: family:1, type:2, protocol:0
[   45.450220] firmadyne: sys_socket[PID: 3611 (iptables)]: family:2, type:3, protocol:255
[   45.465221] firmadyne: sys_socket[PID: 3612 (iptables)]: family:1, type:2, protocol:0
[   45.465534] firmadyne: sys_socket[PID: 3612 (iptables)]: family:2, type:3, protocol:255
[   45.480361] firmadyne: sys_socket[PID: 3613 (iptables)]: family:1, type:2, protocol:0
[   45.480681] firmadyne: sys_socket[PID: 3613 (iptables)]: family:2, type:3, protocol:255
[   45.495545] firmadyne: sys_socket[PID: 3614 (iptables)]: family:1, type:2, protocol:0
[   45.495864] firmadyne: sys_socket[PID: 3614 (iptables)]: family:2, type:3, protocol:255
[   46.580488] firmadyne: sys_socket[PID: 3616 (gcom)]: family:1, type:524289, protocol:0
[   46.916409] firmadyne: sys_socket[PID: 3617 (mosquitto)]: family:2, type:2, protocol:0
[   46.918825] firmadyne: inet_accept[PID: 2239 (uhttpd)]:
[   46.919068] firmadyne: inet_accept[PID: 2239 (uhttpd)]:
[   46.919202] firmadyne: inet_accept[PID: 2239 (uhttpd)]:
[   46.930757] firmadyne: sys_socket[PID: 3617 (mosquitto)]: family:1, type:524290, protocol:0
[   46.934985] firmadyne: sys_socket[PID: 3617 (mosquitto)]: family:1, type:524289, protocol:0
[   46.937579] firmadyne: sys_socket[PID: 3617 (mosquitto)]: family:2, type:2, protocol:6
[   46.937946] firmadyne: sys_setsockopt[PID: 3617 (mosquitto)]: fd:5, level:65535, optname:4
[   46.938169] firmadyne: sys_setsockopt[PID: 3617 (mosquitto)]: fd:5, level:41, optname:26
[   46.938419] firmadyne: inet_bind[PID: 3617 (mosquitto)]: proto:SOCK_STREAM, port:1883
[   46.938697] firmadyne: sys_socket[PID: 3617 (mosquitto)]: family:2, type:2, protocol:6
[   46.938882] firmadyne: sys_setsockopt[PID: 3617 (mosquitto)]: fd:6, level:65535, optname:4
[   46.939072] firmadyne: sys_setsockopt[PID: 3617 (mosquitto)]: fd:6, level:41, optname:26
[   46.939251] firmadyne: inet_bind[PID: 3617 (mosquitto)]: proto:SOCK_STREAM, port:8883
[   47.454600] firmadyne: inet_accept[PID: 2239 (uhttpd)]:
[   47.454987] firmadyne: inet_accept[PID: 2239 (uhttpd)]:
```
