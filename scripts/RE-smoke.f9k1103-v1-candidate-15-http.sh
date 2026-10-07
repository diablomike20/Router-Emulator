#!/bin/bash
set -euo pipefail
HTTP_BASE="${F9K1103_C15_HTTP_BASE:-http://127.0.0.1:18080}"; HTTPS_BASE="${F9K1103_C15_HTTPS_BASE:-https://127.0.0.1:18443}"; OUT="${1:-/tmp/RE-f9k1103-v1-c15}"; COOKIE="$OUT.cookies"
status_get(){ local url="$1" body="$2" headers="$3" insecure="${4:-0}"; if [ "$insecure" = 1 ]; then curl -k -sS --connect-timeout 3 --max-time 20 -w '%{http_code}' -D "$headers" -o "$body" "$url" || true; else curl -sS --connect-timeout 3 --max-time 20 -w '%{http_code}' -D "$headers" -o "$body" "$url" || true; fi; }
static_status="$(status_get "$HTTP_BASE/luci-static/bootstrap/js/sysauth.js" "$OUT.static" "$OUT.static.headers")"; [ "$static_status" = 200 ] && [ -s "$OUT.static" ] || { echo "FAIL static status=$static_status"; exit 1; }; echo 'F9K1103_V1_C15_STATIC_HTTP_GATE=PASS'
root_status="$(status_get "$HTTP_BASE/" "$OUT.root" "$OUT.root.headers")"; [ "$root_status" = 200 ] || { echo "FAIL root status=$root_status"; exit 1; }; grep -Eq 'cgi-bin/luci' "$OUT.root" || { echo 'FAIL root LuCI marker missing'; exit 1; }; echo 'F9K1103_V1_C15_ROOT_GATE=PASS'
: > "$COOKIE"
login_status="$(curl -sS --connect-timeout 3 --max-time 25 -H 'Host: cudy.net' -b "$COOKIE" -c "$COOKIE" --data-urlencode 'luci_username=admin' --data-urlencode 'luci_password=candidate15' -w '%{http_code}' -D "$OUT.login.headers" -o "$OUT.login.body" "$HTTP_BASE/cgi-bin/luci/" || true)"
echo "login_status=$login_status"; case "$login_status" in 200|301|302|303|307|308) ;; *) echo "FAIL auth POST status=$login_status"; exit 1;; esac

dashboard_status="$(curl -sS --connect-timeout 3 --max-time 30 -H 'Host: cudy.net' -b "$COOKIE" -c "$COOKIE" -w '%{http_code}' -D "$OUT.dashboard.headers" -o "$OUT.dashboard.html" "$HTTP_BASE/cgi-bin/luci/" || true)"
[ "$dashboard_status" = 200 ] || { echo "FAIL dashboard status=$dashboard_status"; head -c 2000 "$OUT.dashboard.html" 2>/dev/null || true; exit 1; }
if grep -Eq 'luci_password2|name="luci_password"|id="luci_password' "$OUT.dashboard.html"; then echo 'FAIL post-login response is still login page'; exit 1; fi
grep -Eqi 'Waiting for initialized|cbi-modal-start|carousel|Dashboard|Cudy' "$OUT.dashboard.html" || { echo 'FAIL dashboard marker missing'; head -c 3000 "$OUT.dashboard.html" || true; exit 1; }
echo 'F9K1103_V1_C15_AUTH_GATE=PASS'; echo 'F9K1103_V1_C15_DASHBOARD_GATE=PASS'
# Cudy exposes HTTPS as an Advanced Settings option rather than a mandatory
# default transport. HTTP is therefore the baseline GUI gate. Only require
# HTTPS when the emulator run explicitly enables/expects that Cudy setting.
if [ "${F9K1103_C15_EXPECT_HTTPS:-0}" = "1" ]; then
  https_status="$(status_get "$HTTPS_BASE/luci-static/bootstrap/js/sysauth.js" "$OUT.https-static" "$OUT.https-static.headers" 1)"
  [ "$https_status" = 200 ] && [ -s "$OUT.https-static" ] || { echo "FAIL HTTPS static status=$https_status"; exit 1; }
  echo 'F9K1103_V1_C15_HTTPS_GATE=PASS'
else
  echo 'F9K1103_V1_C15_HTTPS_GATE=NOT_ENABLED_OPTIONAL'
fi

echo 'F9K1103_V1_CANDIDATE15_EMULATOR_WEB_GATE=PASS'
