# RE-LT500D R25 emulator CI result

Commit: a9d51ca428093a6bb9e5425ddb0ba5f75a36c240
Firmware download/verify: success
Image build: success
QEMU/HTTP gate: success
Run: https://github.com/diablomike20/Router-Emulator/actions/runs/35436525155

## HTTP headers
```text
HTTP/1.1 200 OK
Connection: Keep-Alive
Keep-Alive: timeout=20
ETag: "a19-25c-6890597d"
Last-Modified: Mon, 04 Aug 2025 06:55:57 GMT
Date: Sat, 19 Sep 2026 10:08:57 GMT
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
[   64.346464] firmadyne: sys_socket[PID: 3129 (fw3)]: family:10, type:524289, protocol:17
[   64.346783] firmadyne: sys_socket[PID: 3129 (fw3)]: family:10, type:524289, protocol:17
[   64.347239] firmadyne: sys_socket[PID: 3129 (fw3)]: family:10, type:524289, protocol:17
[   64.347565] firmadyne: sys_socket[PID: 3129 (fw3)]: family:10, type:524289, protocol:17
[   64.348678] firmadyne: sys_socket[PID: 3129 (fw3)]: family:10, type:524289, protocol:17
[   64.349042] firmadyne: sys_socket[PID: 3129 (fw3)]: family:10, type:524289, protocol:17
[   64.350029] firmadyne: sys_socket[PID: 3129 (fw3)]: family:10, type:524289, protocol:17
[   64.350396] firmadyne: sys_socket[PID: 3129 (fw3)]: family:10, type:524289, protocol:17
[   64.350833] firmadyne: sys_socket[PID: 3129 (fw3)]: family:10, type:524289, protocol:17
[   64.351140] firmadyne: sys_socket[PID: 3129 (fw3)]: family:10, type:524289, protocol:17
[   64.351772] firmadyne: sys_socket[PID: 3129 (fw3)]: family:10, type:524289, protocol:17
[   64.352551] firmadyne: sys_socket[PID: 3129 (fw3)]: family:10, type:524289, protocol:17
[   64.353452] firmadyne: sys_socket[PID: 3129 (fw3)]: family:10, type:524289, protocol:17
[   64.353797] firmadyne: sys_socket[PID: 3129 (fw3)]: family:10, type:524289, protocol:17
[   64.354134] firmadyne: sys_socket[PID: 3129 (fw3)]: family:10, type:524289, protocol:17
[   64.354452] firmadyne: sys_socket[PID: 3129 (fw3)]: family:10, type:524289, protocol:17
[   64.359897] firmadyne: sys_setsockopt[PID: 3129 (fw3)]: fd:7, level:0, optname:64
[   64.362610] firmadyne: sys_socket[PID: 3129 (fw3)]: family:2, type:3, protocol:255
[   64.363333] firmadyne: sys_socket[PID: 3129 (fw3)]: family:2, type:3, protocol:255
[   64.364377] firmadyne: sys_socket[PID: 3129 (fw3)]: family:10, type:3, protocol:255
[   64.368577] firmadyne: sys_setsockopt[PID: 3129 (fw3)]: fd:10, level:41, optname:64
[   64.370241] firmadyne: sys_setsockopt[PID: 3129 (fw3)]: fd:10, level:41, optname:65
[   64.370985] firmadyne: sys_socket[PID: 3129 (fw3)]: family:10, type:3, protocol:255
[   64.371612] firmadyne: sys_socket[PID: 3129 (fw3)]: family:10, type:3, protocol:255
[   64.372469] firmadyne: sys_socket[PID: 3129 (fw3)]: family:10, type:3, protocol:255
[   64.376227] firmadyne: sys_socket[PID: 3129 (fw3)]: family:10, type:524289, protocol:17
[   64.376608] firmadyne: sys_socket[PID: 3129 (fw3)]: family:10, type:524289, protocol:17
[   64.379785] firmadyne: sys_socket[PID: 3129 (fw3)]: family:10, type:524289, protocol:17
[   64.380410] firmadyne: sys_socket[PID: 3129 (fw3)]: family:10, type:524289, protocol:17
[   64.380917] firmadyne: sys_socket[PID: 3129 (fw3)]: family:10, type:524289, protocol:17
[   64.381229] firmadyne: sys_socket[PID: 3129 (fw3)]: family:10, type:524289, protocol:17
[   64.381767] firmadyne: sys_socket[PID: 3129 (fw3)]: family:10, type:524289, protocol:17
[   64.382115] firmadyne: sys_socket[PID: 3129 (fw3)]: family:10, type:524289, protocol:17
[   64.382564] firmadyne: sys_socket[PID: 3129 (fw3)]: family:10, type:524289, protocol:17
[   64.382864] firmadyne: sys_socket[PID: 3129 (fw3)]: family:10, type:524289, protocol:17
[   64.383423] firmadyne: sys_socket[PID: 3129 (fw3)]: family:10, type:524289, protocol:17
[   64.383738] firmadyne: sys_socket[PID: 3129 (fw3)]: family:10, type:524289, protocol:17
[   64.385013] firmadyne: sys_socket[PID: 3129 (fw3)]: family:10, type:524289, protocol:17
[   64.385380] firmadyne: sys_socket[PID: 3129 (fw3)]: family:10, type:524289, protocol:17
[   64.385708] firmadyne: sys_socket[PID: 3129 (fw3)]: family:10, type:524289, protocol:17
[   64.385995] firmadyne: sys_socket[PID: 3129 (fw3)]: family:10, type:524289, protocol:17
[   64.389057] firmadyne: sys_setsockopt[PID: 3129 (fw3)]: fd:13, level:41, optname:64
[   64.390269] firmadyne: sys_socket[PID: 3129 (fw3)]: family:10, type:3, protocol:255
[   64.390870] firmadyne: sys_socket[PID: 3129 (fw3)]: family:10, type:3, protocol:255
[   64.391417] firmadyne: sys_socket[PID: 3129 (fw3)]: family:16, type:524291, protocol:0
[   64.470677] firmadyne: sys_socket[PID: 3143 (ipset)]: family:16, type:3, protocol:12
[   64.490330] firmadyne: sys_socket[PID: 3146 (ipset)]: family:16, type:3, protocol:12
[   64.543185] firmadyne: sys_socket[PID: 3151 (ipset)]: family:16, type:3, protocol:12
[   64.545501] firmadyne: sys_socket[PID: 3150 (mosquitto)]: family:2, type:2, protocol:0
[   64.582080] firmadyne: sys_socket[PID: 3154 (ipset)]: family:16, type:3, protocol:12
[   64.591424] firmadyne: sys_socket[PID: 3150 (mosquitto)]: family:1, type:524290, protocol:0
[   64.613122] firmadyne: sys_socket[PID: 3150 (mosquitto)]: family:1, type:524289, protocol:0
[   64.619822] firmadyne: sys_socket[PID: 3150 (mosquitto)]: family:2, type:2, protocol:6
[   64.621888] firmadyne: sys_socket[PID: 3157 (ipset)]: family:16, type:3, protocol:12
[   64.623078] firmadyne: sys_setsockopt[PID: 3150 (mosquitto)]: fd:5, level:65535, optname:4
[   64.623544] firmadyne: sys_setsockopt[PID: 3150 (mosquitto)]: fd:5, level:41, optname:26
[   64.624502] firmadyne: inet_bind[PID: 3150 (mosquitto)]: proto:SOCK_STREAM, port:1883
[   64.625983] firmadyne: sys_socket[PID: 3150 (mosquitto)]: family:2, type:2, protocol:6
[   64.626266] firmadyne: sys_setsockopt[PID: 3150 (mosquitto)]: fd:6, level:65535, optname:4
[   64.626549] firmadyne: sys_setsockopt[PID: 3150 (mosquitto)]: fd:6, level:41, optname:26
[   64.626808] firmadyne: inet_bind[PID: 3150 (mosquitto)]: proto:SOCK_STREAM, port:8883
[   64.660560] firmadyne: sys_socket[PID: 3160 (ipset)]: family:16, type:3, protocol:12
[   64.677886] firmadyne: sys_socket[PID: 3163 (ipset)]: family:16, type:3, protocol:12
[   64.695938] firmadyne: sys_socket[PID: 3166 (ipset)]: family:16, type:3, protocol:12
[   64.742152] firmadyne: sys_socket[PID: 3170 (iptables)]: family:1, type:2, protocol:0
[   64.742876] firmadyne: sys_socket[PID: 3170 (iptables)]: family:2, type:3, protocol:255
[   64.747053] firmadyne: sys_setsockopt[PID: 3170 (iptables)]: fd:1, level:0, optname:64
[   64.747605] firmadyne: sys_setsockopt[PID: 3170 (iptables)]: fd:1, level:0, optname:65
[   64.769817] firmadyne: sys_socket[PID: 3171 (iptables)]: family:1, type:2, protocol:0
[   64.770329] firmadyne: sys_socket[PID: 3171 (iptables)]: family:2, type:3, protocol:255
[   64.787640] firmadyne: sys_socket[PID: 3172 (ip6tables)]: family:1, type:2, protocol:0
[   64.788263] firmadyne: sys_socket[PID: 3172 (ip6tables)]: family:10, type:3, protocol:255
[   64.792251] firmadyne: sys_setsockopt[PID: 3172 (ip6tables)]: fd:1, level:41, optname:64
[   64.792793] firmadyne: sys_setsockopt[PID: 3172 (ip6tables)]: fd:1, level:41, optname:65
[   64.814795] firmadyne: sys_socket[PID: 3173 (ip6tables)]: family:1, type:2, protocol:0
[   64.815222] firmadyne: sys_socket[PID: 3173 (ip6tables)]: family:10, type:3, protocol:255
[   64.837774] firmadyne: sys_socket[PID: 3174 (iptables)]: family:1, type:2, protocol:0
[   64.838236] firmadyne: sys_socket[PID: 3174 (iptables)]: family:2, type:3, protocol:255
[   64.841162] firmadyne: sys_setsockopt[PID: 3174 (iptables)]: fd:1, level:0, optname:64
[   64.841701] firmadyne: sys_setsockopt[PID: 3174 (iptables)]: fd:1, level:0, optname:65
[   64.861655] firmadyne: sys_socket[PID: 3175 (iptables)]: family:1, type:2, protocol:0
[   64.862141] firmadyne: sys_socket[PID: 3175 (iptables)]: family:2, type:3, protocol:255
[   64.865349] firmadyne: sys_setsockopt[PID: 3175 (iptables)]: fd:1, level:0, optname:64
[   64.865854] firmadyne: sys_setsockopt[PID: 3175 (iptables)]: fd:1, level:0, optname:65
[   64.885675] firmadyne: sys_socket[PID: 3176 (ip6tables)]: family:1, type:2, protocol:0
[   64.886094] firmadyne: sys_socket[PID: 3176 (ip6tables)]: family:10, type:3, protocol:255
[   64.888962] firmadyne: sys_setsockopt[PID: 3176 (ip6tables)]: fd:1, level:41, optname:64
[   64.889458] firmadyne: sys_setsockopt[PID: 3176 (ip6tables)]: fd:1, level:41, optname:65
[   64.909483] firmadyne: sys_socket[PID: 3177 (ip6tables)]: family:1, type:2, protocol:0
[   64.909899] firmadyne: sys_socket[PID: 3177 (ip6tables)]: family:10, type:3, protocol:255
[   64.912697] firmadyne: sys_setsockopt[PID: 3177 (ip6tables)]: fd:1, level:41, optname:64
[   64.913168] firmadyne: sys_setsockopt[PID: 3177 (ip6tables)]: fd:1, level:41, optname:65
[   64.952666] firmadyne: inet_accept[PID: 2253 (uhttpd)]:
[   64.952942] firmadyne: inet_accept[PID: 2253 (uhttpd)]:
[   64.953137] firmadyne: inet_accept[PID: 2253 (uhttpd)]:
[   64.953358] firmadyne: inet_accept[PID: 2253 (uhttpd)]:
[   64.953545] firmadyne: inet_accept[PID: 2253 (uhttpd)]:
[   64.953731] firmadyne: inet_accept[PID: 2253 (uhttpd)]:
[   64.983395] firmadyne: sys_socket[PID: 3180 (ifconfig)]: family:2, type:1, protocol:0
[   64.997048] firmadyne: __inet_insert_ifa[PID: 3180 (ifconfig)]: device:eth1 ifa:0x00000000
[   65.037914] firmadyne: sys_socket[PID: 3182 (brctl)]: family:2, type:2, protocol:0
[   65.039041] firmadyne: sys_socket[PID: 3182 (brctl)]: family:1, type:524289, protocol:0
[   65.045150] firmadyne: sys_socket[PID: 3181 (iptables)]: family:1, type:2, protocol:0
[   65.045655] firmadyne: sys_socket[PID: 3181 (iptables)]: family:2, type:3, protocol:255
[   65.048841] firmadyne: sys_socket[PID: 3182 (brctl)]: family:1, type:524289, protocol:0
[   65.049209] firmadyne: sys_socket[PID: 3182 (brctl)]: family:1, type:524289, protocol:0
[   65.052743] firmadyne: sys_setsockopt[PID: 3181 (iptables)]: fd:1, level:0, optname:64
[   65.053264] firmadyne: sys_setsockopt[PID: 3181 (iptables)]: fd:1, level:0, optname:65
[   65.098469] firmadyne: sys_socket[PID: 3184 (iptables)]: family:10, type:524289, protocol:17
[   65.099214] firmadyne: sys_socket[PID: 3184 (iptables)]: family:10, type:524289, protocol:17
[   65.101727] firmadyne: sys_socket[PID: 3185 (iptables)]: family:1, type:2, protocol:0
[   65.102173] firmadyne: sys_socket[PID: 3185 (iptables)]: family:2, type:3, protocol:255
[   65.106443] firmadyne: sys_socket[PID: 3184 (iptables)]: family:1, type:2, protocol:0
[   65.130743] firmadyne: sys_socket[PID: 3186 (iptables)]: family:1, type:2, protocol:0
[   65.131192] firmadyne: sys_socket[PID: 3186 (iptables)]: family:2, type:3, protocol:255
[   65.156244] firmadyne: sys_socket[PID: 3187 (iptables)]: family:1, type:2, protocol:0
[   65.156728] firmadyne: sys_socket[PID: 3187 (iptables)]: family:2, type:3, protocol:255
[   65.181735] firmadyne: sys_socket[PID: 3188 (iptables)]: family:1, type:2, protocol:0
[   65.182197] firmadyne: sys_socket[PID: 3188 (iptables)]: family:2, type:3, protocol:255
[   66.112502] firmadyne: sys_socket[PID: 3184 (iptables)]: family:2, type:3, protocol:255
[   66.115518] firmadyne: sys_setsockopt[PID: 3184 (iptables)]: fd:1, level:0, optname:64
[   66.116457] firmadyne: sys_setsockopt[PID: 3184 (iptables)]: fd:1, level:0, optname:65
[   66.140348] firmadyne: sys_socket[PID: 3190 (iptables)]: family:1, type:2, protocol:0
[   66.140822] firmadyne: sys_socket[PID: 3190 (iptables)]: family:2, type:3, protocol:255
[   66.143511] firmadyne: sys_setsockopt[PID: 3190 (iptables)]: fd:1, level:0, optname:64
[   66.144441] firmadyne: sys_setsockopt[PID: 3190 (iptables)]: fd:1, level:0, optname:65
[   66.164673] firmadyne: sys_socket[PID: 3191 (ip6tables)]: family:1, type:2, protocol:0
[   66.165103] firmadyne: sys_socket[PID: 3191 (ip6tables)]: family:10, type:3, protocol:255
[   66.167662] firmadyne: sys_setsockopt[PID: 3191 (ip6tables)]: fd:1, level:41, optname:64
[   66.168492] firmadyne: sys_setsockopt[PID: 3191 (ip6tables)]: fd:1, level:41, optname:65
[   66.191023] firmadyne: sys_socket[PID: 3192 (ip6tables)]: family:10, type:524289, protocol:17
[   66.191753] firmadyne: sys_socket[PID: 3192 (ip6tables)]: family:10, type:524289, protocol:17
[   66.195143] firmadyne: sys_socket[PID: 3192 (ip6tables)]: family:1, type:2, protocol:0
[   66.195559] firmadyne: sys_socket[PID: 3192 (ip6tables)]: family:10, type:3, protocol:255
[   66.198659] firmadyne: sys_setsockopt[PID: 3192 (ip6tables)]: fd:1, level:41, optname:64
[   66.199206] firmadyne: sys_setsockopt[PID: 3192 (ip6tables)]: fd:1, level:41, optname:65
[   66.222550] firmadyne: sys_socket[PID: 3193 (ip6tables)]: family:1, type:2, protocol:0
[   66.222969] firmadyne: sys_socket[PID: 3193 (ip6tables)]: family:10, type:3, protocol:255
[   66.225928] firmadyne: sys_setsockopt[PID: 3193 (ip6tables)]: fd:1, level:41, optname:64
[   66.226525] firmadyne: sys_setsockopt[PID: 3193 (ip6tables)]: fd:1, level:41, optname:65
[   66.271300] firmadyne: sys_socket[PID: 3195 (iptables)]: family:1, type:2, protocol:0
[   66.271791] firmadyne: sys_socket[PID: 3195 (iptables)]: family:2, type:3, protocol:255
[   66.275065] firmadyne: sys_setsockopt[PID: 3195 (iptables)]: fd:1, level:0, optname:64
[   66.275662] firmadyne: sys_setsockopt[PID: 3195 (iptables)]: fd:1, level:0, optname:65
[   66.286700] firmadyne: sys_socket[PID: 3196 (ip6tables)]: family:1, type:2, protocol:0
[   66.287068] firmadyne: sys_socket[PID: 3196 (ip6tables)]: family:10, type:3, protocol:255
[   66.289851] firmadyne: sys_setsockopt[PID: 3196 (ip6tables)]: fd:1, level:41, optname:64
[   66.290529] firmadyne: sys_setsockopt[PID: 3196 (ip6tables)]: fd:1, level:41, optname:65
[   66.334236] firmadyne: sys_socket[PID: 3198 (iptables)]: family:1, type:2, protocol:0
[   66.334749] firmadyne: sys_socket[PID: 3198 (iptables)]: family:2, type:3, protocol:255
[   66.337657] firmadyne: sys_setsockopt[PID: 3198 (iptables)]: fd:1, level:0, optname:64
[   66.338172] firmadyne: sys_setsockopt[PID: 3198 (iptables)]: fd:1, level:0, optname:65
[   66.359483] firmadyne: sys_socket[PID: 3199 (iptables)]: family:1, type:2, protocol:0
[   66.359935] firmadyne: sys_socket[PID: 3199 (iptables)]: family:2, type:3, protocol:255
[   66.363071] firmadyne: sys_setsockopt[PID: 3199 (iptables)]: fd:1, level:0, optname:64
[   66.363591] firmadyne: sys_setsockopt[PID: 3199 (iptables)]: fd:1, level:0, optname:65
[   66.384407] firmadyne: sys_socket[PID: 3200 (iptables)]: family:1, type:2, protocol:0
[   66.384850] firmadyne: sys_socket[PID: 3200 (iptables)]: family:2, type:3, protocol:255
[   66.387760] firmadyne: sys_setsockopt[PID: 3200 (iptables)]: fd:1, level:0, optname:64
[   66.388607] firmadyne: sys_setsockopt[PID: 3200 (iptables)]: fd:1, level:0, optname:65
[   66.412549] firmadyne: sys_socket[PID: 3201 (iptables)]: family:1, type:2, protocol:0
[   66.412987] firmadyne: sys_socket[PID: 3201 (iptables)]: family:2, type:3, protocol:255
[   66.670607] firmadyne: sys_socket[PID: 3209 (iptables)]: family:1, type:2, protocol:0
[   66.671112] firmadyne: sys_socket[PID: 3209 (iptables)]: family:2, type:3, protocol:255
[   66.698985] firmadyne: sys_socket[PID: 3210 (iptables)]: family:1, type:2, protocol:0
[   66.699453] firmadyne: sys_socket[PID: 3210 (iptables)]: family:2, type:3, protocol:255
[   66.702167] firmadyne: sys_setsockopt[PID: 3210 (iptables)]: fd:1, level:0, optname:64
[   66.728476] firmadyne: sys_socket[PID: 3213 (iptables)]: family:1, type:2, protocol:0
[   66.728923] firmadyne: sys_socket[PID: 3213 (iptables)]: family:2, type:3, protocol:255
[   66.756813] firmadyne: sys_socket[PID: 3214 (iptables)]: family:1, type:2, protocol:0
[   66.757253] firmadyne: sys_socket[PID: 3214 (iptables)]: family:2, type:3, protocol:255
[   66.784889] firmadyne: sys_socket[PID: 3215 (iptables)]: family:1, type:2, protocol:0
[   66.785382] firmadyne: sys_socket[PID: 3215 (iptables)]: family:2, type:3, protocol:255
[   66.954826] firmadyne: sys_socket[PID: 3224 (iptables)]: family:1, type:2, protocol:0
[   66.955333] firmadyne: sys_socket[PID: 3224 (iptables)]: family:2, type:3, protocol:255
[   66.979753] firmadyne: sys_socket[PID: 3225 (iptables)]: family:1, type:2, protocol:0
[   66.980351] firmadyne: sys_socket[PID: 3225 (iptables)]: family:2, type:3, protocol:255
[   67.002335] firmadyne: sys_socket[PID: 3226 (iptables)]: family:1, type:2, protocol:0
[   67.002783] firmadyne: sys_socket[PID: 3226 (iptables)]: family:2, type:3, protocol:255
[   67.025210] firmadyne: sys_socket[PID: 3227 (iptables)]: family:1, type:2, protocol:0
[   67.025705] firmadyne: sys_socket[PID: 3227 (iptables)]: family:2, type:3, protocol:255
[   67.033810] firmadyne: inet_accept[PID: 2253 (uhttpd)]:
[   67.034091] firmadyne: inet_accept[PID: 2253 (uhttpd)]:
[   67.034320] firmadyne: inet_accept[PID: 2253 (uhttpd)]:
[   67.034518] firmadyne: inet_accept[PID: 2253 (uhttpd)]:
[   67.034707] firmadyne: inet_accept[PID: 2253 (uhttpd)]:
[   67.034896] firmadyne: inet_accept[PID: 2253 (uhttpd)]:
[   67.047326] firmadyne: sys_socket[PID: 3228 (iptables)]: family:1, type:2, protocol:0
[   67.047773] firmadyne: sys_socket[PID: 3228 (iptables)]: family:2, type:3, protocol:255
[   67.070012] firmadyne: sys_socket[PID: 3229 (iptables)]: family:1, type:2, protocol:0
[   67.070504] firmadyne: sys_socket[PID: 3229 (iptables)]: family:2, type:3, protocol:255
[   67.182416] firmadyne: sys_socket[PID: 3234 (ubus)]: family:1, type:2, protocol:0
[   67.259062] firmadyne: sys_socket[PID: 3237 (logger)]: family:1, type:524289, protocol:0
[   67.283067] firmadyne: sys_socket[PID: 3238 (iptables)]: family:1, type:2, protocol:0
[   67.283583] firmadyne: sys_socket[PID: 3238 (iptables)]: family:2, type:3, protocol:255
[   67.306053] firmadyne: sys_socket[PID: 3239 (iptables)]: family:1, type:2, protocol:0
[   67.306515] firmadyne: sys_socket[PID: 3239 (iptables)]: family:2, type:3, protocol:255
[   67.329004] firmadyne: sys_socket[PID: 3240 (iptables)]: family:1, type:2, protocol:0
[   67.329495] firmadyne: sys_socket[PID: 3240 (iptables)]: family:2, type:3, protocol:255
[   67.347230] firmadyne: sys_socket[PID: 3241 (ip)]: family:16, type:524291, protocol:0
[   67.347621] firmadyne: sys_setsockopt[PID: 3241 (ip)]: fd:0, level:65535, optname:4097
[   67.348304] firmadyne: sys_setsockopt[PID: 3241 (ip)]: fd:0, level:65535, optname:4098
[   67.370635] firmadyne: sys_socket[PID: 3242 (ipset)]: family:16, type:3, protocol:12
[   67.388540] firmadyne: sys_socket[PID: 3245 (ipset)]: family:16, type:3, protocol:12
[   67.406368] firmadyne: sys_socket[PID: 3248 (ipset)]: family:16, type:3, protocol:12
[   67.424259] firmadyne: sys_socket[PID: 3251 (ipset)]: family:16, type:3, protocol:12
[   67.442607] firmadyne: sys_socket[PID: 3254 (ipset)]: family:16, type:3, protocol:12
[   67.460703] firmadyne: sys_socket[PID: 3257 (ipset)]: family:16, type:3, protocol:12
[   67.504819] firmadyne: sys_socket[PID: 3261 (ipset)]: family:16, type:3, protocol:12
[   67.522971] firmadyne: sys_socket[PID: 3264 (ipset)]: family:16, type:3, protocol:12
[   67.633099] firmadyne: sys_socket[PID: 3272 (iptables)]: family:1, type:2, protocol:0
[   67.633643] firmadyne: sys_socket[PID: 3272 (iptables)]: family:2, type:3, protocol:255
[   67.656658] firmadyne: sys_socket[PID: 3273 (iptables)]: family:1, type:2, protocol:0
[   67.657162] firmadyne: sys_socket[PID: 3273 (iptables)]: family:2, type:3, protocol:255
[   67.658754] firmadyne: sys_socket[PID: 3273 (iptables)]: family:2, type:3, protocol:255
[   67.680592] firmadyne: sys_socket[PID: 3278 (iptables)]: family:1, type:2, protocol:0
[   67.681071] firmadyne: sys_socket[PID: 3278 (iptables)]: family:2, type:3, protocol:255
[   67.682236] firmadyne: sys_socket[PID: 3278 (iptables)]: family:2, type:3, protocol:255
[   67.695852] firmadyne: sys_socket[PID: 3283 (ip6tables)]: family:1, type:2, protocol:0
[   67.696458] firmadyne: sys_socket[PID: 3283 (ip6tables)]: family:10, type:3, protocol:255
```
