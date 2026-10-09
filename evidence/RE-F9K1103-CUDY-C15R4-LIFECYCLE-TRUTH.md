# F9K1103 Cudy Candidate-15R4 exact lifecycle truth

## Firmware
- image: `RE-F9K1103-CUDY-WR1200E-CANDIDATE-15R4-BOOTFIRST-sysupgrade.bin`
- SHA-256: `827ef8d550b2a5dbf5ea362bd1acd6080dc5c2ab414cdfbd585aa1dea377d246`
- uImage identity: `N750F9K1103VB`
- firmware source branch: `re-f9k1103-cudy-candidate-15r4-postlogin`
- build source commit: `7d0f9d68f7d9ce714e1bca45ab0a62ca7291d159`
- build workflow run: `37873694765` — SUCCESS
- `FLASH_AUTHORIZATION=NO`

## R4 repair
Candidate-15R3 authenticated testing exposed a LEDE LuCI ABI mismatch in the
F9K1103 mcore compatibility adapter. The adapter used `util.shellquote()` while
target LEDE 17.01.x exports `util.shellsqescape()`. R4 installs the target-aware
repository mcore adapter and uses `shellsqescape()` for iwinfo interface arguments.

## Exact runtime verified
- original Belkin U-Boot execution
- C15R4 kernel/userspace boot
- RTL8367R-VB
- RT3883 WMAC rev 0x0400 / RF3853
- bidirectional br-lan/eth0.1 networking
- root HTTP
- server-side LuCI authentication/session creation
- authenticated System Status
- `/admin/system` HTTP 200
- `/admin/system/administration` HTTP 200
- no R3 mcore Lua exception

## Real Cudy menu audit
Every actual top-level link extracted from the authenticated System Status page
renders HTTP 200 without a detected Lua exception:
- System Status
- Quick Setup
- General Settings
- Parental Control
- Advanced Settings
- Diagnostic Tools
- WISP
- Wireless 2.4G
- VPN

Classification: `LIFECYCLE_VERIFIED` through authenticated top-level UI rendering.

## Exact donor firstboot auth evidence
WR1200E R62 2.4.25 donor:
- `10_user` configures admin sysauth, showuser=0 and random `luci.sauth.salt`
- `11_fix_passwd` derives initial root password from `bdinfo fuuid + bdinfo hmac`, sets it with `passwd root`, then records `ttylogin=1`
- Cudy sysauth template has a `conf.sauth.defpasswd == '1'` Create administrator password mode
- sysauth.js requires an 8..64 character new password and applies the donor salt/token hashing rules

The current F9K1103 Candidate intentionally does not import donor uci-defaults
wholesale and currently retains the target empty root password. Direct server-side
empty-password POST proves the session path, but normal browser UI cannot use an
empty password. This firstboot password lifecycle is the next firmware blocker.

## Next gate
1. safe Cudy create-password lifecycle on F9K1103
2. browser-compatible non-empty login/session
3. authenticated config write/apply/reload
4. reboot persistence
5. physical board/layout/hash + `sysupgrade -T`
6. explicit user approval before physical flash

Never use blind `sysupgrade -F`.
