# RE-LT500D R25 emulator CI result

Commit: 3e04de51fee6423d2967d1c7695a286f4d0d36ba
Firmware download/verify: success
Image build: success
QEMU/HTTP gate: success
Run: https://github.com/diablomike20/Router-Emulator/actions/runs/35434315572

## HTTP headers
```text
HTTP/1.1 200 OK
Connection: Keep-Alive
Keep-Alive: timeout=20
ETag: "a19-25c-6890597d"
Last-Modified: Mon, 04 Aug 2025 06:55:57 GMT
Date: Sat, 19 Sep 2026 09:19:22 GMT
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
[   52.533515] firmadyne: sys_socket[PID: 3174 (fw3)]: family:10, type:3, protocol:255
[   52.536969] firmadyne: sys_setsockopt[PID: 3174 (fw3)]: fd:10, level:41, optname:64
[   52.538485] firmadyne: sys_setsockopt[PID: 3174 (fw3)]: fd:10, level:41, optname:65
[   52.539081] firmadyne: sys_socket[PID: 3174 (fw3)]: family:10, type:3, protocol:255
[   52.539508] firmadyne: sys_socket[PID: 3174 (fw3)]: family:10, type:3, protocol:255
[   52.539930] firmadyne: sys_socket[PID: 3174 (fw3)]: family:10, type:3, protocol:255
[   52.542725] firmadyne: sys_socket[PID: 3174 (fw3)]: family:10, type:524289, protocol:17
[   52.543040] firmadyne: sys_socket[PID: 3174 (fw3)]: family:10, type:524289, protocol:17
[   52.545079] firmadyne: sys_socket[PID: 3174 (fw3)]: family:10, type:524289, protocol:17
[   52.545350] firmadyne: sys_socket[PID: 3174 (fw3)]: family:10, type:524289, protocol:17
[   52.545686] firmadyne: sys_socket[PID: 3174 (fw3)]: family:10, type:524289, protocol:17
[   52.546249] firmadyne: sys_socket[PID: 3174 (fw3)]: family:10, type:524289, protocol:17
[   52.546722] firmadyne: sys_socket[PID: 3174 (fw3)]: family:10, type:524289, protocol:17
[   52.546980] firmadyne: sys_socket[PID: 3174 (fw3)]: family:10, type:524289, protocol:17
[   52.547304] firmadyne: sys_socket[PID: 3174 (fw3)]: family:10, type:524289, protocol:17
[   52.547726] firmadyne: sys_socket[PID: 3174 (fw3)]: family:10, type:524289, protocol:17
[   52.548140] firmadyne: sys_socket[PID: 3174 (fw3)]: family:10, type:524289, protocol:17
[   52.548391] firmadyne: sys_socket[PID: 3174 (fw3)]: family:10, type:524289, protocol:17
[   52.549002] firmadyne: sys_socket[PID: 3174 (fw3)]: family:10, type:524289, protocol:17
[   52.549296] firmadyne: sys_socket[PID: 3174 (fw3)]: family:10, type:524289, protocol:17
[   52.549563] firmadyne: sys_socket[PID: 3174 (fw3)]: family:10, type:524289, protocol:17
[   52.549816] firmadyne: sys_socket[PID: 3174 (fw3)]: family:10, type:524289, protocol:17
[   52.552176] firmadyne: sys_setsockopt[PID: 3174 (fw3)]: fd:13, level:41, optname:64
[   52.553203] firmadyne: sys_socket[PID: 3174 (fw3)]: family:10, type:3, protocol:255
[   52.553673] firmadyne: sys_socket[PID: 3174 (fw3)]: family:10, type:3, protocol:255
[   52.554414] firmadyne: sys_socket[PID: 3174 (fw3)]: family:16, type:524291, protocol:0
[   52.610671] firmadyne: sys_socket[PID: 3192 (ipset)]: family:16, type:3, protocol:12
[   52.625531] firmadyne: sys_socket[PID: 3195 (ipset)]: family:16, type:3, protocol:12
[   52.650204] firmadyne: sys_socket[PID: 3199 (ipset)]: family:16, type:3, protocol:12
[   52.663933] firmadyne: sys_socket[PID: 3202 (ipset)]: family:16, type:3, protocol:12
[   52.677846] firmadyne: sys_socket[PID: 3205 (ipset)]: family:16, type:3, protocol:12
[   52.691636] firmadyne: sys_socket[PID: 3208 (ipset)]: family:16, type:3, protocol:12
[   52.705342] firmadyne: sys_socket[PID: 3211 (ipset)]: family:16, type:3, protocol:12
[   52.719160] firmadyne: sys_socket[PID: 3214 (ipset)]: family:16, type:3, protocol:12
[   52.738860] firmadyne: inet_accept[PID: 2234 (uhttpd)]:
[   52.739134] firmadyne: inet_accept[PID: 2234 (uhttpd)]:
[   52.739299] firmadyne: inet_accept[PID: 2234 (uhttpd)]:
[   52.739457] firmadyne: inet_accept[PID: 2234 (uhttpd)]:
[   52.759872] firmadyne: sys_socket[PID: 3218 (iptables)]: family:1, type:2, protocol:0
[   52.760465] firmadyne: sys_socket[PID: 3218 (iptables)]: family:2, type:3, protocol:255
[   52.767566] firmadyne: sys_setsockopt[PID: 3218 (iptables)]: fd:1, level:0, optname:64
[   52.768041] firmadyne: sys_setsockopt[PID: 3218 (iptables)]: fd:1, level:0, optname:65
[   52.787912] firmadyne: sys_socket[PID: 3219 (gcom)]: family:1, type:524289, protocol:0
[   52.801109] firmadyne: sys_socket[PID: 3220 (iptables)]: family:1, type:2, protocol:0
[   52.801495] firmadyne: sys_socket[PID: 3220 (iptables)]: family:2, type:3, protocol:255
[   52.823878] firmadyne: sys_socket[PID: 3221 (ip6tables)]: family:1, type:2, protocol:0
[   52.824263] firmadyne: sys_socket[PID: 3221 (ip6tables)]: family:10, type:3, protocol:255
[   52.827435] firmadyne: sys_setsockopt[PID: 3221 (ip6tables)]: fd:1, level:41, optname:64
[   52.827894] firmadyne: sys_setsockopt[PID: 3221 (ip6tables)]: fd:1, level:41, optname:65
[   52.845839] firmadyne: sys_socket[PID: 3222 (ip6tables)]: family:1, type:2, protocol:0
[   52.846292] firmadyne: sys_socket[PID: 3222 (ip6tables)]: family:10, type:3, protocol:255
[   52.864108] firmadyne: sys_socket[PID: 3223 (iptables)]: family:1, type:2, protocol:0
[   52.864539] firmadyne: sys_socket[PID: 3223 (iptables)]: family:2, type:3, protocol:255
[   52.866996] firmadyne: sys_setsockopt[PID: 3223 (iptables)]: fd:1, level:0, optname:64
[   52.867449] firmadyne: sys_setsockopt[PID: 3223 (iptables)]: fd:1, level:0, optname:65
[   52.876977] firmadyne: sys_socket[PID: 3224 (iptables)]: family:1, type:2, protocol:0
[   52.877342] firmadyne: sys_socket[PID: 3224 (iptables)]: family:2, type:3, protocol:255
[   52.879887] firmadyne: sys_setsockopt[PID: 3224 (iptables)]: fd:1, level:0, optname:64
[   52.880314] firmadyne: sys_setsockopt[PID: 3224 (iptables)]: fd:1, level:0, optname:65
[   52.895694] firmadyne: sys_socket[PID: 3225 (ip6tables)]: family:1, type:2, protocol:0
[   52.896066] firmadyne: sys_socket[PID: 3225 (ip6tables)]: family:10, type:3, protocol:255
[   52.898327] firmadyne: sys_setsockopt[PID: 3225 (ip6tables)]: fd:1, level:41, optname:64
[   52.898741] firmadyne: sys_setsockopt[PID: 3225 (ip6tables)]: fd:1, level:41, optname:65
[   52.914340] firmadyne: sys_socket[PID: 3226 (ip6tables)]: family:1, type:2, protocol:0
[   52.914715] firmadyne: sys_socket[PID: 3226 (ip6tables)]: family:10, type:3, protocol:255
[   52.916760] firmadyne: sys_setsockopt[PID: 3226 (ip6tables)]: fd:1, level:41, optname:64
[   52.917159] firmadyne: sys_setsockopt[PID: 3226 (ip6tables)]: fd:1, level:41, optname:65
[   52.971007] firmadyne: sys_socket[PID: 3229 (iptables)]: family:1, type:2, protocol:0
[   52.971420] firmadyne: sys_socket[PID: 3229 (iptables)]: family:2, type:3, protocol:255
[   52.973600] firmadyne: sys_setsockopt[PID: 3229 (iptables)]: fd:1, level:0, optname:64
[   52.974323] firmadyne: sys_setsockopt[PID: 3229 (iptables)]: fd:1, level:0, optname:65
[   52.992007] firmadyne: sys_socket[PID: 3230 (iptables)]: family:10, type:524289, protocol:17
[   52.992606] firmadyne: sys_socket[PID: 3230 (iptables)]: family:10, type:524289, protocol:17
[   52.995255] firmadyne: sys_socket[PID: 3230 (iptables)]: family:1, type:2, protocol:0
[   52.995631] firmadyne: sys_socket[PID: 3230 (iptables)]: family:2, type:3, protocol:255
[   52.998065] firmadyne: sys_setsockopt[PID: 3230 (iptables)]: fd:1, level:0, optname:64
[   52.998546] firmadyne: sys_setsockopt[PID: 3230 (iptables)]: fd:1, level:0, optname:65
[   53.016655] firmadyne: sys_socket[PID: 3231 (iptables)]: family:1, type:2, protocol:0
[   53.017063] firmadyne: sys_socket[PID: 3231 (iptables)]: family:2, type:3, protocol:255
[   53.019772] firmadyne: sys_setsockopt[PID: 3231 (iptables)]: fd:1, level:0, optname:64
[   53.020267] firmadyne: sys_setsockopt[PID: 3231 (iptables)]: fd:1, level:0, optname:65
[   53.036076] firmadyne: sys_socket[PID: 3232 (ip6tables)]: family:1, type:2, protocol:0
[   53.036432] firmadyne: sys_socket[PID: 3232 (ip6tables)]: family:10, type:3, protocol:255
[   53.039066] firmadyne: sys_setsockopt[PID: 3232 (ip6tables)]: fd:1, level:41, optname:64
[   53.039474] firmadyne: sys_setsockopt[PID: 3232 (ip6tables)]: fd:1, level:41, optname:65
[   53.057155] firmadyne: sys_socket[PID: 3233 (ip6tables)]: family:10, type:524289, protocol:17
[   53.057761] firmadyne: sys_socket[PID: 3233 (ip6tables)]: family:10, type:524289, protocol:17
[   53.060569] firmadyne: sys_socket[PID: 3233 (ip6tables)]: family:1, type:2, protocol:0
[   53.060911] firmadyne: sys_socket[PID: 3233 (ip6tables)]: family:10, type:3, protocol:255
[   53.063375] firmadyne: sys_setsockopt[PID: 3233 (ip6tables)]: fd:1, level:41, optname:64
[   53.063854] firmadyne: sys_setsockopt[PID: 3233 (ip6tables)]: fd:1, level:41, optname:65
[   53.081810] firmadyne: sys_socket[PID: 3234 (ip6tables)]: family:1, type:2, protocol:0
[   53.082244] firmadyne: sys_socket[PID: 3234 (ip6tables)]: family:10, type:3, protocol:255
[   53.084386] firmadyne: sys_setsockopt[PID: 3234 (ip6tables)]: fd:1, level:41, optname:64
[   53.084867] firmadyne: sys_setsockopt[PID: 3234 (ip6tables)]: fd:1, level:41, optname:65
[   53.119765] firmadyne: sys_socket[PID: 3236 (iptables)]: family:1, type:2, protocol:0
[   53.120213] firmadyne: sys_socket[PID: 3236 (iptables)]: family:2, type:3, protocol:255
[   53.122910] firmadyne: sys_setsockopt[PID: 3236 (iptables)]: fd:1, level:0, optname:64
[   53.123412] firmadyne: sys_setsockopt[PID: 3236 (iptables)]: fd:1, level:0, optname:65
[   53.140660] firmadyne: sys_socket[PID: 3237 (ip6tables)]: family:1, type:2, protocol:0
[   53.141046] firmadyne: sys_socket[PID: 3237 (ip6tables)]: family:10, type:3, protocol:255
[   53.143681] firmadyne: sys_setsockopt[PID: 3237 (ip6tables)]: fd:1, level:41, optname:64
[   53.144180] firmadyne: sys_setsockopt[PID: 3237 (ip6tables)]: fd:1, level:41, optname:65
[   53.179154] firmadyne: sys_socket[PID: 3239 (iptables)]: family:1, type:2, protocol:0
[   53.179559] firmadyne: sys_socket[PID: 3239 (iptables)]: family:2, type:3, protocol:255
[   53.181637] firmadyne: sys_setsockopt[PID: 3239 (iptables)]: fd:1, level:0, optname:64
[   53.182383] firmadyne: sys_setsockopt[PID: 3239 (iptables)]: fd:1, level:0, optname:65
[   53.198122] firmadyne: sys_socket[PID: 3240 (iptables)]: family:1, type:2, protocol:0
[   53.198543] firmadyne: sys_socket[PID: 3240 (iptables)]: family:2, type:3, protocol:255
[   53.200941] firmadyne: sys_setsockopt[PID: 3240 (iptables)]: fd:1, level:0, optname:64
[   53.201357] firmadyne: sys_setsockopt[PID: 3240 (iptables)]: fd:1, level:0, optname:65
[   53.217186] firmadyne: sys_socket[PID: 3241 (iptables)]: family:1, type:2, protocol:0
[   53.217584] firmadyne: sys_socket[PID: 3241 (iptables)]: family:2, type:3, protocol:255
[   53.220185] firmadyne: sys_setsockopt[PID: 3241 (iptables)]: fd:1, level:0, optname:64
[   53.220615] firmadyne: sys_setsockopt[PID: 3241 (iptables)]: fd:1, level:0, optname:65
[   53.239062] firmadyne: inet_accept[PID: 2234 (uhttpd)]:
[   53.239322] firmadyne: inet_accept[PID: 2234 (uhttpd)]:
[   53.242077] firmadyne: sys_socket[PID: 3242 (iptables)]: family:1, type:2, protocol:0
[   53.242456] firmadyne: sys_socket[PID: 3242 (iptables)]: family:2, type:3, protocol:255
[   53.435114] firmadyne: sys_socket[PID: 3250 (iptables)]: family:1, type:2, protocol:0
[   53.435542] firmadyne: sys_socket[PID: 3250 (iptables)]: family:2, type:3, protocol:255
[   53.457843] firmadyne: sys_socket[PID: 3251 (iptables)]: family:1, type:2, protocol:0
[   53.458337] firmadyne: sys_socket[PID: 3251 (iptables)]: family:2, type:3, protocol:255
[   53.460287] firmadyne: sys_setsockopt[PID: 3251 (iptables)]: fd:1, level:0, optname:64
[   53.481351] firmadyne: sys_socket[PID: 3254 (iptables)]: family:1, type:2, protocol:0
[   53.481760] firmadyne: sys_socket[PID: 3254 (iptables)]: family:2, type:3, protocol:255
[   53.503985] firmadyne: sys_socket[PID: 3255 (iptables)]: family:1, type:2, protocol:0
[   53.504416] firmadyne: sys_socket[PID: 3255 (iptables)]: family:2, type:3, protocol:255
[   53.526196] firmadyne: sys_socket[PID: 3256 (iptables)]: family:1, type:2, protocol:0
[   53.526576] firmadyne: sys_socket[PID: 3256 (iptables)]: family:2, type:3, protocol:255
[   53.678073] firmadyne: sys_socket[PID: 3265 (iptables)]: family:1, type:2, protocol:0
[   53.678545] firmadyne: sys_socket[PID: 3265 (iptables)]: family:2, type:3, protocol:255
[   53.692365] firmadyne: sys_socket[PID: 3266 (ifconfig)]: family:2, type:1, protocol:0
[   53.693734] firmadyne: __inet_insert_ifa[PID: 3266 (ifconfig)]: device:eth1 ifa:0x00000000
[   53.723465] firmadyne: sys_socket[PID: 3267 (iptables)]: family:1, type:2, protocol:0
[   53.723881] firmadyne: sys_socket[PID: 3267 (iptables)]: family:2, type:3, protocol:255
[   53.729498] firmadyne: sys_socket[PID: 3268 (brctl)]: family:2, type:2, protocol:0
[   53.731974] firmadyne: sys_socket[PID: 3268 (brctl)]: family:1, type:524289, protocol:0
[   53.732660] firmadyne: sys_socket[PID: 3268 (brctl)]: family:1, type:524289, protocol:0
[   53.732955] firmadyne: sys_socket[PID: 3268 (brctl)]: family:1, type:524289, protocol:0
[   53.761427] firmadyne: sys_socket[PID: 3270 (iptables)]: family:1, type:2, protocol:0
[   53.761828] firmadyne: sys_socket[PID: 3270 (iptables)]: family:2, type:3, protocol:255
[   53.773781] firmadyne: sys_socket[PID: 3271 (iptables)]: family:1, type:2, protocol:0
[   53.778210] firmadyne: sys_socket[PID: 3271 (iptables)]: family:2, type:3, protocol:255
[   53.799947] firmadyne: sys_socket[PID: 3272 (iptables)]: family:1, type:2, protocol:0
[   53.800333] firmadyne: sys_socket[PID: 3272 (iptables)]: family:2, type:3, protocol:255
[   53.812049] firmadyne: sys_socket[PID: 3273 (iptables)]: family:1, type:2, protocol:0
[   53.812431] firmadyne: sys_socket[PID: 3273 (iptables)]: family:2, type:3, protocol:255
[   53.838524] firmadyne: sys_socket[PID: 3274 (iptables)]: family:1, type:2, protocol:0
[   53.838949] firmadyne: sys_socket[PID: 3274 (iptables)]: family:2, type:3, protocol:255
[   53.853851] firmadyne: sys_socket[PID: 3275 (iptables)]: family:1, type:2, protocol:0
[   53.858211] firmadyne: sys_socket[PID: 3275 (iptables)]: family:2, type:3, protocol:255
[   53.872506] firmadyne: sys_socket[PID: 3276 (iptables)]: family:1, type:2, protocol:0
[   53.872906] firmadyne: sys_socket[PID: 3276 (iptables)]: family:2, type:3, protocol:255
[   53.892819] firmadyne: sys_socket[PID: 3277 (iptables)]: family:1, type:2, protocol:0
[   53.893189] firmadyne: sys_socket[PID: 3277 (iptables)]: family:2, type:3, protocol:255
[   53.983866] firmadyne: sys_socket[PID: 3283 (ubus)]: family:1, type:2, protocol:0
[   54.045057] firmadyne: sys_socket[PID: 3286 (logger)]: family:1, type:524289, protocol:0
[   54.064043] firmadyne: sys_socket[PID: 3287 (iptables)]: family:1, type:2, protocol:0
[   54.064436] firmadyne: sys_socket[PID: 3287 (iptables)]: family:2, type:3, protocol:255
[   54.081216] firmadyne: sys_socket[PID: 3288 (iptables)]: family:1, type:2, protocol:0
[   54.081613] firmadyne: sys_socket[PID: 3288 (iptables)]: family:2, type:3, protocol:255
[   54.100445] firmadyne: sys_socket[PID: 3289 (iptables)]: family:1, type:2, protocol:0
[   54.100900] firmadyne: sys_socket[PID: 3289 (iptables)]: family:2, type:3, protocol:255
[   54.115329] firmadyne: sys_socket[PID: 3290 (ip)]: family:16, type:524291, protocol:0
[   54.115648] firmadyne: sys_setsockopt[PID: 3290 (ip)]: fd:0, level:65535, optname:4097
[   54.115937] firmadyne: sys_setsockopt[PID: 3290 (ip)]: fd:0, level:65535, optname:4098
[   54.133348] firmadyne: sys_socket[PID: 3291 (ipset)]: family:16, type:3, protocol:12
[   54.147171] firmadyne: sys_socket[PID: 3294 (ipset)]: family:16, type:3, protocol:12
[   54.160811] firmadyne: sys_socket[PID: 3297 (ipset)]: family:16, type:3, protocol:12
[   54.174676] firmadyne: sys_socket[PID: 3300 (ipset)]: family:16, type:3, protocol:12
[   54.188627] firmadyne: sys_socket[PID: 3303 (ipset)]: family:16, type:3, protocol:12
[   54.202490] firmadyne: sys_socket[PID: 3306 (ipset)]: family:16, type:3, protocol:12
[   54.236521] firmadyne: sys_socket[PID: 3310 (ipset)]: family:16, type:3, protocol:12
[   54.253977] firmadyne: sys_socket[PID: 3313 (ipset)]: family:16, type:3, protocol:12
[   54.357256] firmadyne: sys_socket[PID: 3321 (iptables)]: family:1, type:2, protocol:0
[   54.357669] firmadyne: sys_socket[PID: 3321 (iptables)]: family:2, type:3, protocol:255
[   54.374896] firmadyne: sys_socket[PID: 3322 (iptables)]: family:1, type:2, protocol:0
[   54.375311] firmadyne: sys_socket[PID: 3322 (iptables)]: family:2, type:3, protocol:255
[   54.376532] firmadyne: sys_socket[PID: 3322 (iptables)]: family:2, type:3, protocol:255
[   54.392782] firmadyne: sys_socket[PID: 3327 (iptables)]: family:1, type:2, protocol:0
[   54.393207] firmadyne: sys_socket[PID: 3327 (iptables)]: family:2, type:3, protocol:255
[   54.394212] firmadyne: sys_socket[PID: 3327 (iptables)]: family:2, type:3, protocol:255
[   54.410658] firmadyne: sys_socket[PID: 3332 (ip6tables)]: family:1, type:2, protocol:0
[   54.411038] firmadyne: sys_socket[PID: 3332 (ip6tables)]: family:10, type:3, protocol:255
[   54.479317] firmadyne: sys_socket[PID: 3336 (iptables)]: family:1, type:2, protocol:0
[   54.479732] firmadyne: sys_socket[PID: 3336 (iptables)]: family:2, type:3, protocol:255
[   54.500883] firmadyne: sys_socket[PID: 3338 (iptables)]: family:1, type:2, protocol:0
[   54.501280] firmadyne: sys_socket[PID: 3338 (iptables)]: family:2, type:3, protocol:255
[   54.519812] firmadyne: sys_socket[PID: 3339 (iptables)]: family:1, type:2, protocol:0
[   54.520222] firmadyne: sys_socket[PID: 3339 (iptables)]: family:2, type:3, protocol:255
[   54.521220] firmadyne: sys_socket[PID: 3339 (iptables)]: family:2, type:3, protocol:255
[   54.551340] firmadyne: sys_socket[PID: 3345 (iptables)]: family:1, type:2, protocol:0
[   54.551773] firmadyne: sys_socket[PID: 3345 (iptables)]: family:2, type:3, protocol:255
[   54.554573] firmadyne: sys_socket[PID: 3345 (iptables)]: family:2, type:3, protocol:255
[   54.572830] firmadyne: sys_socket[PID: 3351 (iptables)]: family:1, type:2, protocol:0
[   54.573224] firmadyne: sys_socket[PID: 3351 (iptables)]: family:2, type:3, protocol:255
[   54.574181] firmadyne: sys_socket[PID: 3351 (iptables)]: family:2, type:3, protocol:255
[   54.605922] firmadyne: sys_socket[PID: 3357 (ip6tables)]: family:1, type:2, protocol:0
[   54.606344] firmadyne: sys_socket[PID: 3357 (ip6tables)]: family:10, type:3, protocol:255
[   54.626152] firmadyne: sys_socket[PID: 3359 (ip6tables)]: family:1, type:2, protocol:0
[   54.626522] firmadyne: sys_socket[PID: 3359 (ip6tables)]: family:10, type:3, protocol:255
[   54.631442] firmadyne: sys_socket[PID: 3174 (fw3)]: family:16, type:524291, protocol:0
[   54.763250] firmadyne: inet_accept[PID: 2234 (uhttpd)]:
[   54.763828] firmadyne: inet_accept[PID: 2234 (uhttpd)]:
[   54.764019] firmadyne: inet_accept[PID: 2234 (uhttpd)]:
[   54.764176] firmadyne: inet_accept[PID: 2234 (uhttpd)]:
[   55.319195] firmadyne: inet_accept[PID: 2234 (uhttpd)]:
[   55.319476] firmadyne: inet_accept[PID: 2234 (uhttpd)]:
[   55.664503] firmadyne: sys_socket[PID: 3361 (mosquitto)]: family:2, type:2, protocol:0
[   55.680089] firmadyne: sys_socket[PID: 3361 (mosquitto)]: family:1, type:524290, protocol:0
[   55.685982] firmadyne: sys_socket[PID: 3361 (mosquitto)]: family:1, type:524289, protocol:0
[   55.689411] firmadyne: sys_socket[PID: 3361 (mosquitto)]: family:2, type:2, protocol:6
[   55.689686] firmadyne: sys_setsockopt[PID: 3361 (mosquitto)]: fd:5, level:65535, optname:4
[   55.690277] firmadyne: sys_setsockopt[PID: 3361 (mosquitto)]: fd:5, level:41, optname:26
[   55.690609] firmadyne: inet_bind[PID: 3361 (mosquitto)]: proto:SOCK_STREAM, port:1883
[   55.690970] firmadyne: sys_socket[PID: 3361 (mosquitto)]: family:2, type:2, protocol:6
[   55.691204] firmadyne: sys_setsockopt[PID: 3361 (mosquitto)]: fd:6, level:65535, optname:4
[   55.691424] firmadyne: sys_setsockopt[PID: 3361 (mosquitto)]: fd:6, level:41, optname:26
[   55.691639] firmadyne: inet_bind[PID: 3361 (mosquitto)]: proto:SOCK_STREAM, port:8883
```
