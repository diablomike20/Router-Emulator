# F9K1103 Cudy Candidate-15R5 exact lifecycle truth

Firmware:
- image: `RE-F9K1103-CUDY-WR1200E-CANDIDATE-15R5-BOOTFIRST-sysupgrade.bin`
- SHA-256: `cfdbf3a820565a01c8957c6ed9e38be3248f7c6aebd304f7e6c59736c42d411e`
- source branch: `re-f9k1103-cudy-candidate-15r5-dashboard`
- source/workflow head: `fb8540ab69e3329c6d31c790b712cd922e43db6e`
- workflow run: `37874864330` — SUCCESS
- `FLASH_AUTHORIZATION=NO`

Candidate-15R5 closes the Candidate-15R4 dashboard bandwidth XHR compatibility gap.
The Cudy carousel statistic templates used `luci.http.formvaluex("iface")`, which
returned nil in the target LEDE 17 compatibility runtime although the request contained
`iface=wlan00`. R5 changes only the iface accessor in:
- `carousel/statistic.htm`
- `carousel/statistic_multi_ssid.htm`

to `luci.http.formvalue("iface")`.

Exact runtime with original Belkin U-Boot + exact 8 MiB flash layout:
- boot through Linux/userspace: PASS
- LuCI login/session: PASS
- Dashboard: 200
- System: 200
- Network: 200
- Tools: 200
- Setup: 200
- Wizard: 200
- Parental Control: 200
- Panel: 200
- SSH transport: `SSH-2.0-dropbear`
- served auth JS contains `#luci_password_login, #luci_password2`

Dashboard/XHR matrix: 16/16 HTTP 200, including:
- `/admin/network/bandwidth?iface=wlan00&icon=icon-wifi&i18name=Wireless%202.4G`
- `/admin/status/bandwidth?iface=wlan00`
- network devices/LAN/wireless status
- DHCP status
- setup variants
- system status/wizard
- panel/parental/tools/wizard

No tested XHR body contains template execution failure, Lua runtime error, HTTP 500,
bad argument, or string-expected error.

Classification:
`LIFECYCLE_VERIFIED` for exact boot, LAN transport, LuCI auth/session, tested
post-login pages, tested dashboard XHRs, browser auth JS delivery, and SSH transport.

Next firmware-first gate:
configuration write/apply -> service/network reload -> reboot persistence.

Physical flash remains unauthorized until target-side board/hash/layout verification,
`sysupgrade -T` PASS, and explicit user approval. Never use blind `sysupgrade -F`.
