#!/usr/bin/env bash
if [[ ${RENDER_PORT_DETECTOR:-} != "true" ]]; then
  # shellcheck source=projectmgr/run-tailscale.sh
  . /home/render/run-tailscale.sh
fi

RESPONSE="HTTP/1.1 200 OK\r\nConnection: keep-alive\r\n\r\nOK}\r\n"
while { echo -en "$RESPONSE"; } | nc -l 10000; do
  echo "================================================"
done
