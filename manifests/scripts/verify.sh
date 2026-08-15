#!/bin/sh
set -eu

apk add --no-cache netcat-openbsd >/dev/null

HOST="argocd-image-updater-controller-metrics-service.argocd.svc"
PORT="8443"

if ! nc -z -w3 "$HOST" "$PORT"; then
  echo "FAIL: could not connect to $HOST:$PORT"
  exit 1
fi

echo "PASS: $HOST:$PORT is accepting connections"
