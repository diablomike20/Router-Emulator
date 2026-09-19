#!/bin/bash
set -euo pipefail

HTTP_BASE="${LT500D_HTTP_BASE:-http://127.0.0.1:8080}"
HTTPS_BASE="${LT500D_HTTPS_BASE:-https://127.0.0.1:8443}"
OUT="${1:-/tmp/lt500d-r25-http-body.bin}"

probe_status() {
  local url="$1" body="$2" headers="$3" insecure="${4:-0}" status
  local -a args=(-sS --connect-timeout 3 --max-time 15 -w '%{http_code}' -D "$headers" -o "$body")
  [ "$insecure" = 1 ] && args=(-k "${args[@]}")
  status="$(curl "${args[@]}" "$url" || true)"
  printf '%s' "$status"
}

echo "Probing donor HTTP static asset"
http_status="$(probe_status "$HTTP_BASE/luci-static/bootstrap/js/sysauth.js" "$OUT.http-static" "$OUT.http-static.headers")"
[ "$http_status" = 200 ] && [ -s "$OUT.http-static" ] || {
  echo "FAIL: HTTP static asset status=$http_status"
  exit 1
}
echo "PASS: HTTP static asset status=200"

echo "Probing donor root redirect document"
root_status="$(probe_status "$HTTP_BASE/" "$OUT.root" "$OUT.root.headers")"
[ "$root_status" = 200 ] && grep -q 'cgi-bin/luci/' "$OUT.root" || {
  echo "FAIL: donor root status=$root_status or LuCI redirect marker missing"
  exit 1
}
echo "PASS: donor root status=200 with LuCI redirect marker"

echo "Probing donor LuCI CGI"
luci_status="$(curl -sS -L --connect-timeout 3 --max-time 20 -w '%{http_code}' -D "$OUT.luci.headers" -o "$OUT.luci" "$HTTP_BASE/cgi-bin/luci/" || true)"
case "$luci_status" in
  200|301|302|303|307|308) ;;
  *) echo "FAIL: LuCI final status=$luci_status"; exit 1 ;;
esac
[ -s "$OUT.luci" ] && grep -Eqi '<html|<!DOCTYPE|Cudy|LuCI|sysauth|login' "$OUT.luci" || {
  echo "FAIL: LuCI response body is not recognizable HTML"
  exit 1
}
echo "PASS: LuCI final status=$luci_status"

echo "Probing donor HTTPS static asset"
https_status="$(probe_status "$HTTPS_BASE/luci-static/bootstrap/js/sysauth.js" "$OUT.https-static" "$OUT.https-static.headers" 1)"
[ "$https_status" = 200 ] && [ -s "$OUT.https-static" ] || {
  echo "FAIL: HTTPS static asset status=$https_status"
  exit 1
}
echo "PASS: HTTPS static asset status=200"

echo "LT500D_HOST_WEB_GATE=PASS"
