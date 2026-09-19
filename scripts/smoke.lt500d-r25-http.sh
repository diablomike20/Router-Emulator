#!/bin/bash
set -euo pipefail

HTTP_BASE="${LT500D_HTTP_BASE:-http://127.0.0.1:8080}"
HTTPS_BASE="${LT500D_HTTPS_BASE:-https://127.0.0.1:8443}"
OUT="${1:-/tmp/lt500d-r25-http-body.bin}"
COOKIE="${OUT}.cookies"

probe_status() {
  local url="$1" body="$2" headers="$3" insecure="${4:-0}" status
  if [ "$insecure" = 1 ]; then
    status="$(curl -k -sS --connect-timeout 3 --max-time 15 -w '%{http_code}' -D "$headers" -o "$body" "$url" || true)"
  else
    status="$(curl -sS --connect-timeout 3 --max-time 15 -w '%{http_code}' -D "$headers" -o "$body" "$url" || true)"
  fi
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

root_luci_path="$(grep -Eo '/?cgi-bin/luci[^"'"'"'<>[:space:]]*' "$OUT.root" | head -n1 || true)"
[ -n "$root_luci_path" ] || root_luci_path="/cgi-bin/luci/"
case "$root_luci_path" in
  /*) ;;
  *) root_luci_path="/$root_luci_path" ;;
esac

echo "Probing donor LuCI locally while preserving canonical Host: cudy.net"
: > "$COOKIE"
current_scheme=http
current_path="$root_luci_path"
luci_ok=0

hop=1
while [ "$hop" -le 6 ]; do
  if [ "$current_scheme" = https ]; then
    local_url="$HTTPS_BASE$current_path"
    status="$(curl -k -sS --connect-timeout 3 --max-time 20       -H 'Host: cudy.net' -b "$COOKIE" -c "$COOKIE"       -w '%{http_code}' -D "$OUT.luci.headers" -o "$OUT.luci" "$local_url" || true)"
  else
    local_url="$HTTP_BASE$current_path"
    status="$(curl -sS --connect-timeout 3 --max-time 20       -H 'Host: cudy.net' -b "$COOKIE" -c "$COOKIE"       -w '%{http_code}' -D "$OUT.luci.headers" -o "$OUT.luci" "$local_url" || true)"
  fi

  echo "LuCI local hop $hop: $current_scheme://cudy.net$current_path -> $status"

  case "$status" in
    200|403)
      if [ -s "$OUT.luci" ] &&
         grep -Eqi '<html|<!DOCTYPE' "$OUT.luci" &&
         grep -Eqi '/luci-static/light/|Cudy|sysauth|Quick Setup|setup\.css' "$OUT.luci"; then
        if [ "$status" = 403 ]; then
          echo "PASS: donor LuCI auth-gated Cudy/LEDE login HTML status=403"
        else
          echo "PASS: donor LuCI Cudy/LEDE HTML status=200"
        fi
        luci_ok=1
      else
        echo "FAIL: status=$status but response is not recognizable donor Cudy/LEDE HTML"
      fi
      break
      ;;
    301|302|303|307|308)
      location="$(awk 'BEGIN{IGNORECASE=1} /^Location:/ {sub(/^[^:]*:[[:space:]]*/, ""); sub(/\r$/, ""); print}' "$OUT.luci.headers" | tail -n1)"
      echo "LuCI redirect -> $location"
      case "$location" in
        http://cudy.net/*)
          current_scheme=http
          current_path="/${location#http://cudy.net/}"
          ;;
        https://cudy.net/*)
          current_scheme=https
          current_path="/${location#https://cudy.net/}"
          ;;
        /*)
          current_path="$location"
          ;;
        *)
          echo "FAIL: refusing external or ambiguous LuCI redirect: $location"
          break
          ;;
      esac
      ;;
    *)
      echo "FAIL: LuCI local status=$status"
      head -n 20 "$OUT.luci.headers" 2>/dev/null || true
      break
      ;;
  esac
  hop=$((hop + 1))
done

[ "$luci_ok" -eq 1 ] || {
  echo "FAIL: no local LuCI redirect chain produced donor Cudy/LEDE HTML"
  exit 1
}

echo "Probing donor HTTPS static asset"
https_status="$(probe_status "$HTTPS_BASE/luci-static/bootstrap/js/sysauth.js" "$OUT.https-static" "$OUT.https-static.headers" 1)"
[ "$https_status" = 200 ] && [ -s "$OUT.https-static" ] || {
  echo "FAIL: HTTPS static asset status=$https_status"
  exit 1
}
echo "PASS: HTTPS static asset status=200"

echo "LT500D_HOST_WEB_GATE=PASS"
