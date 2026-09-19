#!/bin/bash
set -euo pipefail
HTTP="${LT500D_OWRT_HTTP_BASE:-http://127.0.0.1:18080}"; HTTPS="${LT500D_OWRT_HTTPS_BASE:-https://127.0.0.1:18443}"; OUT="${1:-/tmp/RE-lt500d-openwrt-smoke}"
probe(){ local u="$1" b="$2" k="${3:-0}"; if [ "$k" = 1 ]; then curl -k -sS --connect-timeout 3 --max-time 20 -w '%{http_code}' -o "$b" "$u" || true; else curl -sS --connect-timeout 3 --max-time 20 -w '%{http_code}' -o "$b" "$u" || true; fi; }
s="$(probe "$HTTP/luci-static/resources/luci.js" "$OUT.static")"; [ "$s" = 200 ] && [ -s "$OUT.static" ] || { echo "FAIL static $s"; exit 1; }; echo LT500D_OWRT_STATIC_HTTP_GATE=PASS
s="$(probe "$HTTP/" "$OUT.root")"; [ "$s" = 200 ] && grep -q 'cgi-bin/luci/' "$OUT.root" || { echo "FAIL root $s"; exit 1; }; echo LT500D_OWRT_ROOT_GATE=PASS
s="$(curl -sS -L --connect-timeout 3 --max-time 25 -w '%{http_code}' -o "$OUT.luci" "$HTTP/cgi-bin/luci/" || true)"; case "$s" in 200|403) ;; *) echo "FAIL LuCI $s"; exit 1;; esac
grep -Eqi '<html|<!DOCTYPE|LuCI|OpenWrt|login' "$OUT.luci" || { echo 'FAIL LuCI HTML'; exit 1; }; echo "LT500D_OWRT_LUCI_GATE=PASS status=$s"
s="$(probe "$HTTPS/luci-static/resources/luci.js" "$OUT.https" 1)"; [ "$s" = 200 ] && echo LT500D_OWRT_HTTPS_GATE=PASS || echo "LT500D_OWRT_HTTPS_GATE=WARN status=$s"
echo LT500D_OPENWRT_EMULATOR_GATE=PASS
