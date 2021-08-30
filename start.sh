#!/usr/bin/env bash
# Ignore Tailscale during port detection on Render
if [[ ${RENDER_PORT_DETECTOR:-} != "true" ]]; then
  . /home/render/run-tailscale.sh
fi

# Start a simple HTTP server to run this repo as a private service
RESPONSE="HTTP/1.1 200 OK\r\nConnection: keep-alive\r\n\r\nOK}\r\n"
while { echo -en "$RESPONSE"; } | nc -l 10000; do
  echo "================================================"
done
