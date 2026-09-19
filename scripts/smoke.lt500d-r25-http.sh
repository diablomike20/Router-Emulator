#!/bin/bash
set -euo pipefail
HTTP="${LT500D_HTTP_URL:-http://127.0.0.1:8080/}"
HTTPS="${LT500D_HTTPS_URL:-https://127.0.0.1:8443/}"
OUT="${1:-/tmp/lt500d-r25-http-body.bin}"
HDR="${OUT}.headers"
probe(){
  local url="$1"
  echo "Probing $url"
  curl -k -sS --connect-timeout 3 --max-time 10 -D "$HDR" -o "$OUT" "$url" || return 1
  [ -s "$HDR" ] || return 1
  echo "PASS: host received an HTTP response from $url"
  head -n 1 "$HDR" || true
  wc -c "$OUT"
}
probe "$HTTP" || probe "$HTTPS" || { echo "FAIL: no host-visible LT500D HTTP(S) response"; exit 1; }
