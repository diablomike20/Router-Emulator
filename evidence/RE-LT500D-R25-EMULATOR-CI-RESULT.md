# RE-LT500D R25 emulator CI result

Commit: 5a74660433388f7d6b67ee143b912db32d02cbbf
Firmware download/verify: success
Image build: success
QEMU/HTTP gate: success
Run: https://github.com/diablomike20/Router-Emulator/actions/runs/35433375491

## HTTP headers
```text
HTTP/1.1 200 OK
Connection: Keep-Alive
Keep-Alive: timeout=20
ETag: "a19-25c-6890597d"
Last-Modified: Mon, 04 Aug 2025 06:55:57 GMT
Date: Sat, 19 Sep 2026 08:59:00 GMT
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
[   66.283072] firmadyne: sys_socket[PID: 3195 (mosquitto)]: family:1, type:524289, protocol:0
[   66.313120] firmadyne: sys_socket[PID: 3195 (mosquitto)]: family:2, type:2, protocol:6
[   66.313506] firmadyne: sys_setsockopt[PID: 3195 (mosquitto)]: fd:5, level:65535, optname:4
[   66.313821] firmadyne: sys_setsockopt[PID: 3195 (mosquitto)]: fd:5, level:41, optname:26
[   66.314192] firmadyne: inet_bind[PID: 3195 (mosquitto)]: proto:SOCK_STREAM, port:1883
[   66.314564] firmadyne: sys_socket[PID: 3195 (mosquitto)]: family:2, type:2, protocol:6
[   66.314866] firmadyne: sys_setsockopt[PID: 3195 (mosquitto)]: fd:6, level:65535, optname:4
[   66.315124] firmadyne: sys_setsockopt[PID: 3195 (mosquitto)]: fd:6, level:41, optname:26
[   66.339421] firmadyne: inet_bind[PID: 3195 (mosquitto)]: proto:SOCK_STREAM, port:8883
[   66.432320] firmadyne: inet_accept[PID: 2243 (uhttpd)]:
[   66.432808] firmadyne: inet_accept[PID: 2243 (uhttpd)]:
[   66.453855] firmadyne: sys_socket[PID: 3184 (luci)]: family:1, type:2, protocol:0
[   66.558141] firmadyne: sys_socket[PID: 3184 (luci)]: family:16, type:524291, protocol:0
[   66.671306] firmadyne: sys_socket[PID: 3217 (brctl)]: family:2, type:2, protocol:0
[   66.687611] firmadyne: sys_socket[PID: 3217 (brctl)]: family:1, type:524289, protocol:0
[   66.688387] firmadyne: sys_socket[PID: 3217 (brctl)]: family:1, type:524289, protocol:0
[   66.688726] firmadyne: sys_socket[PID: 3217 (brctl)]: family:1, type:524289, protocol:0
[   66.884245] firmadyne: sys_socket[PID: 3225 (bdinfo)]: family:1, type:524289, protocol:0
[   66.932708] firmadyne: inet_accept[PID: 2243 (uhttpd)]:
[   66.933003] firmadyne: inet_accept[PID: 2243 (uhttpd)]:
[   66.933252] firmadyne: inet_accept[PID: 2243 (uhttpd)]:
[   66.933469] firmadyne: inet_accept[PID: 2243 (uhttpd)]:
[   66.933688] firmadyne: inet_accept[PID: 2243 (uhttpd)]:
[   67.008483] firmadyne: sys_socket[PID: 3231 (bdinfo)]: family:1, type:524289, protocol:0
[   67.098748] firmadyne: sys_socket[PID: 3238 (ubus)]: family:1, type:2, protocol:0
[   67.415162] firmadyne: sys_socket[PID: 3250 (bdinfo)]: family:1, type:524289, protocol:0
[   67.483995] firmadyne: inet_accept[PID: 2243 (uhttpd)]:
[   67.485205] firmadyne: inet_accept[PID: 2243 (uhttpd)]:
[   67.645706] firmadyne: sys_socket[PID: 3259 (ifconfig)]: family:2, type:1, protocol:0
[   67.787477] firmadyne: sys_socket[PID: 3270 (ubus)]: family:1, type:2, protocol:0
[   67.833253] firmadyne: sys_socket[PID: 3272 (ubus)]: family:1, type:2, protocol:0
[   67.963970] firmadyne: sys_socket[PID: 3277 (ifconfig)]: family:2, type:1, protocol:0
[   68.276678] firmadyne: sys_socket[PID: 3292 (ubus)]: family:1, type:2, protocol:0
[   68.432147] firmadyne: inet_accept[PID: 2243 (uhttpd)]:
[   68.432440] firmadyne: inet_accept[PID: 2243 (uhttpd)]:
[   68.442105] firmadyne: sys_socket[PID: 3299 (ubus)]: family:1, type:2, protocol:0
[   68.932283] firmadyne: inet_accept[PID: 2243 (uhttpd)]:
[   68.932977] firmadyne: inet_accept[PID: 2243 (uhttpd)]:
[   68.933183] firmadyne: inet_accept[PID: 2243 (uhttpd)]:
[   68.933377] firmadyne: inet_accept[PID: 2243 (uhttpd)]:
[   68.933566] firmadyne: inet_accept[PID: 2243 (uhttpd)]:
[   68.967250] firmadyne: sys_socket[PID: 3325 (ubus)]: family:1, type:2, protocol:0
[   69.407233] firmadyne: sys_socket[PID: 3348 (ubus)]: family:1, type:2, protocol:0
[   69.497088] firmadyne: sys_socket[PID: 3350 (crond)]: family:1, type:524289, protocol:0
[   69.739465] firmadyne: sys_socket[PID: 3361 (ifconfig)]: family:2, type:1, protocol:0
[   69.741179] firmadyne: __inet_insert_ifa[PID: 3361 (ifconfig)]: device:eth1 ifa:0x00000000
[   69.772143] firmadyne: sys_socket[PID: 3360 (fw3)]: family:1, type:2, protocol:0
[   69.817039] firmadyne: sys_socket[PID: 3364 (brctl)]: family:2, type:2, protocol:0
[   69.817925] firmadyne: sys_socket[PID: 3364 (brctl)]: family:1, type:524289, protocol:0
[   69.818757] firmadyne: sys_socket[PID: 3364 (brctl)]: family:1, type:524289, protocol:0
[   69.819079] firmadyne: sys_socket[PID: 3364 (brctl)]: family:1, type:524289, protocol:0
[   69.869341] firmadyne: sys_socket[PID: 3360 (fw3)]: family:2, type:3, protocol:255
[   69.907735] firmadyne: sys_setsockopt[PID: 3360 (fw3)]: fd:4, level:0, optname:64
[   69.908261] firmadyne: sys_setsockopt[PID: 3360 (fw3)]: fd:4, level:0, optname:65
[   69.908996] firmadyne: sys_socket[PID: 3360 (fw3)]: family:2, type:3, protocol:255
[   69.909568] firmadyne: sys_socket[PID: 3360 (fw3)]: family:2, type:3, protocol:255
[   69.910154] firmadyne: sys_socket[PID: 3360 (fw3)]: family:2, type:3, protocol:255
[   69.964013] firmadyne: sys_socket[PID: 3368 (iptables)]: family:1, type:2, protocol:0
[   69.964510] firmadyne: sys_socket[PID: 3368 (iptables)]: family:2, type:3, protocol:255
[   69.970747] firmadyne: sys_socket[PID: 3360 (fw3)]: family:10, type:524289, protocol:17
[   69.983908] firmadyne: sys_socket[PID: 3360 (fw3)]: family:10, type:524289, protocol:17
[   70.003909] firmadyne: sys_socket[PID: 3360 (fw3)]: family:10, type:524289, protocol:17
[   70.004305] firmadyne: sys_socket[PID: 3360 (fw3)]: family:10, type:524289, protocol:17
[   70.004788] firmadyne: sys_socket[PID: 3360 (fw3)]: family:10, type:524289, protocol:17
[   70.005101] firmadyne: sys_socket[PID: 3360 (fw3)]: family:10, type:524289, protocol:17
[   70.005559] firmadyne: sys_socket[PID: 3360 (fw3)]: family:10, type:524289, protocol:17
[   70.005894] firmadyne: sys_socket[PID: 3360 (fw3)]: family:10, type:524289, protocol:17
[   70.006564] firmadyne: sys_socket[PID: 3360 (fw3)]: family:10, type:524289, protocol:17
[   70.006896] firmadyne: sys_socket[PID: 3360 (fw3)]: family:10, type:524289, protocol:17
[   70.019969] firmadyne: sys_socket[PID: 3360 (fw3)]: family:10, type:524289, protocol:17
[   70.020332] firmadyne: sys_socket[PID: 3360 (fw3)]: family:10, type:524289, protocol:17
[   70.020798] firmadyne: sys_socket[PID: 3360 (fw3)]: family:10, type:524289, protocol:17
[   70.021108] firmadyne: sys_socket[PID: 3360 (fw3)]: family:10, type:524289, protocol:17
[   70.021670] firmadyne: sys_socket[PID: 3360 (fw3)]: family:10, type:524289, protocol:17
[   70.022012] firmadyne: sys_socket[PID: 3360 (fw3)]: family:10, type:524289, protocol:17
[   70.022824] firmadyne: sys_socket[PID: 3360 (fw3)]: family:10, type:524289, protocol:17
[   70.023170] firmadyne: sys_socket[PID: 3360 (fw3)]: family:10, type:524289, protocol:17
[   70.026668] firmadyne: sys_socket[PID: 3372 (ubus)]: family:1, type:2, protocol:0
[   70.039541] firmadyne: sys_socket[PID: 3360 (fw3)]: family:10, type:524289, protocol:17
[   70.039900] firmadyne: sys_socket[PID: 3360 (fw3)]: family:10, type:524289, protocol:17
[   70.052822] firmadyne: sys_setsockopt[PID: 3360 (fw3)]: fd:7, level:0, optname:64
[   70.062266] firmadyne: sys_socket[PID: 3373 (iptables)]: family:1, type:2, protocol:0
[   70.062743] firmadyne: sys_socket[PID: 3373 (iptables)]: family:2, type:3, protocol:255
[   70.072267] firmadyne: sys_socket[PID: 3360 (fw3)]: family:2, type:3, protocol:255
[   70.072953] firmadyne: sys_socket[PID: 3360 (fw3)]: family:2, type:3, protocol:255
[   70.073725] firmadyne: sys_socket[PID: 3360 (fw3)]: family:10, type:3, protocol:255
[   70.089955] firmadyne: sys_setsockopt[PID: 3360 (fw3)]: fd:10, level:41, optname:64
[   70.102370] firmadyne: sys_setsockopt[PID: 3360 (fw3)]: fd:10, level:41, optname:65
[   70.103184] firmadyne: sys_socket[PID: 3360 (fw3)]: family:10, type:3, protocol:255
[   70.119780] firmadyne: sys_socket[PID: 3360 (fw3)]: family:10, type:3, protocol:255
[   70.120298] firmadyne: sys_socket[PID: 3360 (fw3)]: family:10, type:3, protocol:255
[   70.140162] firmadyne: sys_socket[PID: 3360 (fw3)]: family:10, type:524289, protocol:17
[   70.140579] firmadyne: sys_socket[PID: 3360 (fw3)]: family:10, type:524289, protocol:17
[   70.159917] firmadyne: sys_socket[PID: 3360 (fw3)]: family:10, type:524289, protocol:17
[   70.160330] firmadyne: sys_socket[PID: 3360 (fw3)]: family:10, type:524289, protocol:17
[   70.160822] firmadyne: sys_socket[PID: 3360 (fw3)]: family:10, type:524289, protocol:17
[   70.161132] firmadyne: sys_socket[PID: 3360 (fw3)]: family:10, type:524289, protocol:17
[   70.161657] firmadyne: sys_socket[PID: 3360 (fw3)]: family:10, type:524289, protocol:17
[   70.161967] firmadyne: sys_socket[PID: 3360 (fw3)]: family:10, type:524289, protocol:17
[   70.162384] firmadyne: sys_socket[PID: 3360 (fw3)]: family:10, type:524289, protocol:17
[   70.162712] firmadyne: sys_socket[PID: 3360 (fw3)]: family:10, type:524289, protocol:17
[   70.163238] firmadyne: sys_socket[PID: 3360 (fw3)]: family:10, type:524289, protocol:17
[   70.179443] firmadyne: sys_socket[PID: 3360 (fw3)]: family:10, type:524289, protocol:17
[   70.180317] firmadyne: sys_socket[PID: 3360 (fw3)]: family:10, type:524289, protocol:17
[   70.180701] firmadyne: sys_socket[PID: 3360 (fw3)]: family:10, type:524289, protocol:17
[   70.181034] firmadyne: sys_socket[PID: 3360 (fw3)]: family:10, type:524289, protocol:17
[   70.181327] firmadyne: sys_socket[PID: 3360 (fw3)]: family:10, type:524289, protocol:17
[   70.204176] firmadyne: sys_setsockopt[PID: 3360 (fw3)]: fd:13, level:41, optname:64
[   70.206247] firmadyne: sys_socket[PID: 3379 (iptables)]: family:1, type:2, protocol:0
[   70.206719] firmadyne: sys_socket[PID: 3379 (iptables)]: family:2, type:3, protocol:255
[   70.220186] firmadyne: sys_socket[PID: 3360 (fw3)]: family:10, type:3, protocol:255
[   70.220846] firmadyne: sys_socket[PID: 3360 (fw3)]: family:10, type:3, protocol:255
[   70.221395] firmadyne: sys_socket[PID: 3360 (fw3)]: family:16, type:524291, protocol:0
[   70.342736] firmadyne: sys_socket[PID: 3386 (iptables)]: family:1, type:2, protocol:0
[   70.343242] firmadyne: sys_socket[PID: 3386 (iptables)]: family:2, type:3, protocol:255
[   70.512140] firmadyne: sys_socket[PID: 3394 (ipset)]: family:16, type:3, protocol:12
[   70.536130] firmadyne: sys_socket[PID: 3395 (ubus)]: family:1, type:2, protocol:0
[   70.579061] firmadyne: sys_socket[PID: 3399 (ipset)]: family:16, type:3, protocol:12
[   70.686642] firmadyne: sys_socket[PID: 3408 (ipset)]: family:16, type:3, protocol:12
[   70.784495] firmadyne: sys_socket[PID: 3414 (ipset)]: family:16, type:3, protocol:12
[   70.826529] firmadyne: sys_socket[PID: 3421 (ipset)]: family:16, type:3, protocol:12
[   70.900536] firmadyne: sys_socket[PID: 3425 (ipset)]: family:16, type:3, protocol:12
[   70.932703] firmadyne: inet_accept[PID: 2243 (uhttpd)]:
[   70.932985] firmadyne: inet_accept[PID: 2243 (uhttpd)]:
[   70.933185] firmadyne: inet_accept[PID: 2243 (uhttpd)]:
[   70.933377] firmadyne: inet_accept[PID: 2243 (uhttpd)]:
[   70.933569] firmadyne: inet_accept[PID: 2243 (uhttpd)]:
[   70.933798] firmadyne: inet_accept[PID: 2243 (uhttpd)]:
[   70.988738] firmadyne: sys_socket[PID: 3432 (ipset)]: family:16, type:3, protocol:12
[   71.032647] firmadyne: sys_socket[PID: 3437 (ipset)]: family:16, type:3, protocol:12
[   71.088937] firmadyne: sys_socket[PID: 1 (procd)]: family:1, type:524289, protocol:0
[   71.151783] firmadyne: sys_socket[PID: 3443 (iptables)]: family:1, type:2, protocol:0
[   71.152292] firmadyne: sys_socket[PID: 3443 (iptables)]: family:2, type:3, protocol:255
[   71.159789] firmadyne: sys_setsockopt[PID: 3443 (iptables)]: fd:1, level:0, optname:64
[   71.160318] firmadyne: sys_setsockopt[PID: 3443 (iptables)]: fd:1, level:0, optname:65
[   71.198355] firmadyne: sys_socket[PID: 3445 (iptables)]: family:1, type:2, protocol:0
[   71.198833] firmadyne: sys_socket[PID: 3445 (iptables)]: family:2, type:3, protocol:255
[   71.249595] firmadyne: sys_socket[PID: 3447 (ip6tables)]: family:1, type:2, protocol:0
[   71.250094] firmadyne: sys_socket[PID: 3447 (ip6tables)]: family:10, type:3, protocol:255
[   71.258230] firmadyne: sys_setsockopt[PID: 3447 (ip6tables)]: fd:1, level:41, optname:64
[   71.258801] firmadyne: sys_setsockopt[PID: 3447 (ip6tables)]: fd:1, level:41, optname:65
[   71.311822] firmadyne: sys_socket[PID: 3449 (ip6tables)]: family:1, type:2, protocol:0
[   71.312272] firmadyne: sys_socket[PID: 3449 (ip6tables)]: family:10, type:3, protocol:255
[   71.360158] firmadyne: sys_socket[PID: 3451 (iptables)]: family:1, type:2, protocol:0
[   71.360655] firmadyne: sys_socket[PID: 3451 (iptables)]: family:2, type:3, protocol:255
[   71.368158] firmadyne: sys_setsockopt[PID: 3451 (iptables)]: fd:1, level:0, optname:64
[   71.368729] firmadyne: sys_setsockopt[PID: 3451 (iptables)]: fd:1, level:0, optname:65
[   71.409166] firmadyne: sys_socket[PID: 3454 (iptables)]: family:1, type:2, protocol:0
[   71.409669] firmadyne: sys_socket[PID: 3454 (iptables)]: family:2, type:3, protocol:255
[   71.416721] firmadyne: sys_setsockopt[PID: 3454 (iptables)]: fd:1, level:0, optname:64
[   71.417234] firmadyne: sys_setsockopt[PID: 3454 (iptables)]: fd:1, level:0, optname:65
[   71.449679] firmadyne: sys_socket[PID: 3456 (ip6tables)]: family:1, type:2, protocol:0
[   71.450101] firmadyne: sys_socket[PID: 3456 (ip6tables)]: family:10, type:3, protocol:255
[   71.460722] firmadyne: sys_setsockopt[PID: 3456 (ip6tables)]: fd:1, level:41, optname:64
[   71.461245] firmadyne: sys_setsockopt[PID: 3456 (ip6tables)]: fd:1, level:41, optname:65
[   71.475605] firmadyne: sys_socket[PID: 3455 (mosquitto)]: family:2, type:2, protocol:0
[   71.517452] firmadyne: sys_socket[PID: 3458 (ip6tables)]: family:1, type:2, protocol:0
[   71.517926] firmadyne: sys_socket[PID: 3458 (ip6tables)]: family:10, type:3, protocol:255
[   71.528658] firmadyne: sys_setsockopt[PID: 3458 (ip6tables)]: fd:1, level:41, optname:64
[   71.529154] firmadyne: sys_setsockopt[PID: 3458 (ip6tables)]: fd:1, level:41, optname:65
[   71.534425] firmadyne: sys_socket[PID: 3455 (mosquitto)]: family:1, type:524290, protocol:0
[   71.557625] firmadyne: sys_socket[PID: 3455 (mosquitto)]: family:1, type:524289, protocol:0
[   71.570136] firmadyne: sys_socket[PID: 3455 (mosquitto)]: family:2, type:2, protocol:6
[   71.570461] firmadyne: sys_setsockopt[PID: 3455 (mosquitto)]: fd:5, level:65535, optname:4
[   71.570768] firmadyne: sys_setsockopt[PID: 3455 (mosquitto)]: fd:5, level:41, optname:26
[   71.571140] firmadyne: inet_bind[PID: 3455 (mosquitto)]: proto:SOCK_STREAM, port:1883
[   71.579578] firmadyne: sys_socket[PID: 3455 (mosquitto)]: family:2, type:2, protocol:6
[   71.579891] firmadyne: sys_setsockopt[PID: 3455 (mosquitto)]: fd:6, level:65535, optname:4
[   71.580154] firmadyne: sys_setsockopt[PID: 3455 (mosquitto)]: fd:6, level:41, optname:26
[   71.580415] firmadyne: inet_bind[PID: 3455 (mosquitto)]: proto:SOCK_STREAM, port:8883
[   71.694066] firmadyne: sys_socket[PID: 3464 (iptables)]: family:1, type:2, protocol:0
[   71.694715] firmadyne: sys_socket[PID: 3464 (iptables)]: family:2, type:3, protocol:255
[   71.701634] firmadyne: sys_setsockopt[PID: 3464 (iptables)]: fd:1, level:0, optname:64
[   71.702166] firmadyne: sys_setsockopt[PID: 3464 (iptables)]: fd:1, level:0, optname:65
[   71.751843] firmadyne: sys_socket[PID: 3466 (iptables)]: family:10, type:524289, protocol:17
[   71.752561] firmadyne: sys_socket[PID: 3466 (iptables)]: family:10, type:524289, protocol:17
[   71.763632] firmadyne: sys_socket[PID: 3466 (iptables)]: family:1, type:2, protocol:0
[   71.764126] firmadyne: sys_socket[PID: 3466 (iptables)]: family:2, type:3, protocol:255
[   71.766843] firmadyne: sys_setsockopt[PID: 3466 (iptables)]: fd:1, level:0, optname:64
[   71.771547] firmadyne: sys_setsockopt[PID: 3466 (iptables)]: fd:1, level:0, optname:65
[   71.817231] firmadyne: sys_socket[PID: 3468 (iptables)]: family:1, type:2, protocol:0
[   71.817755] firmadyne: sys_socket[PID: 3468 (iptables)]: family:2, type:3, protocol:255
[   71.824799] firmadyne: sys_setsockopt[PID: 3468 (iptables)]: fd:1, level:0, optname:64
[   71.825395] firmadyne: sys_setsockopt[PID: 3468 (iptables)]: fd:1, level:0, optname:65
[   71.868378] firmadyne: sys_socket[PID: 3470 (ip6tables)]: family:1, type:2, protocol:0
[   71.868861] firmadyne: sys_socket[PID: 3470 (ip6tables)]: family:10, type:3, protocol:255
[   71.875539] firmadyne: sys_setsockopt[PID: 3470 (ip6tables)]: fd:1, level:41, optname:64
[   71.876052] firmadyne: sys_setsockopt[PID: 3470 (ip6tables)]: fd:1, level:41, optname:65
[   71.924642] firmadyne: sys_socket[PID: 3472 (ip6tables)]: family:10, type:524289, protocol:17
[   71.925396] firmadyne: sys_socket[PID: 3472 (ip6tables)]: family:10, type:524289, protocol:17
[   71.932663] firmadyne: sys_socket[PID: 3472 (ip6tables)]: family:1, type:2, protocol:0
[   71.933070] firmadyne: sys_socket[PID: 3472 (ip6tables)]: family:10, type:3, protocol:255
[   71.940158] firmadyne: sys_setsockopt[PID: 3472 (ip6tables)]: fd:1, level:41, optname:64
[   71.940788] firmadyne: sys_setsockopt[PID: 3472 (ip6tables)]: fd:1, level:41, optname:65
[   71.987132] firmadyne: sys_socket[PID: 3474 (ip6tables)]: family:1, type:2, protocol:0
[   71.992173] firmadyne: sys_socket[PID: 3474 (ip6tables)]: family:10, type:3, protocol:255
[   71.994971] firmadyne: sys_setsockopt[PID: 3474 (ip6tables)]: fd:1, level:41, optname:64
[   71.999706] firmadyne: sys_setsockopt[PID: 3474 (ip6tables)]: fd:1, level:41, optname:65
[   72.089604] firmadyne: sys_socket[PID: 3479 (iptables)]: family:1, type:2, protocol:0
[   72.090105] firmadyne: sys_socket[PID: 3479 (iptables)]: family:2, type:3, protocol:255
[   72.101097] firmadyne: sys_setsockopt[PID: 3479 (iptables)]: fd:1, level:0, optname:64
[   72.101731] firmadyne: sys_setsockopt[PID: 3479 (iptables)]: fd:1, level:0, optname:65
[   72.142525] firmadyne: sys_socket[PID: 3481 (ip6tables)]: family:1, type:2, protocol:0
[   72.143031] firmadyne: sys_socket[PID: 3481 (ip6tables)]: family:10, type:3, protocol:255
[   72.154261] firmadyne: sys_setsockopt[PID: 3481 (ip6tables)]: fd:1, level:41, optname:64
[   72.154895] firmadyne: sys_setsockopt[PID: 3481 (ip6tables)]: fd:1, level:41, optname:65
[   72.233296] firmadyne: sys_socket[PID: 3486 (iptables)]: family:1, type:2, protocol:0
[   72.233825] firmadyne: sys_socket[PID: 3486 (iptables)]: family:2, type:3, protocol:255
[   72.240438] firmadyne: sys_setsockopt[PID: 3486 (iptables)]: fd:1, level:0, optname:64
[   72.241007] firmadyne: sys_setsockopt[PID: 3486 (iptables)]: fd:1, level:0, optname:65
[   72.284165] firmadyne: sys_socket[PID: 3487 (iptables)]: family:1, type:2, protocol:0
[   72.284684] firmadyne: sys_socket[PID: 3487 (iptables)]: family:2, type:3, protocol:255
[   72.291771] firmadyne: sys_setsockopt[PID: 3487 (iptables)]: fd:1, level:0, optname:64
[   72.292307] firmadyne: sys_setsockopt[PID: 3487 (iptables)]: fd:1, level:0, optname:65
[   72.333324] firmadyne: sys_socket[PID: 3490 (iptables)]: family:1, type:2, protocol:0
[   72.333821] firmadyne: sys_socket[PID: 3490 (iptables)]: family:2, type:3, protocol:255
[   72.341744] firmadyne: sys_setsockopt[PID: 3490 (iptables)]: fd:1, level:0, optname:64
[   72.342265] firmadyne: sys_setsockopt[PID: 3490 (iptables)]: fd:1, level:0, optname:65
[   72.376575] firmadyne: sys_socket[PID: 3492 (iptables)]: family:1, type:2, protocol:0
[   72.377032] firmadyne: sys_socket[PID: 3492 (iptables)]: family:2, type:3, protocol:255
```
