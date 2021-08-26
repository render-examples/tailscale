#!/usr/bin/env bash
if [[ ${TAILSCALE_AUTHKEY:-} ]]; then
  /home/render/tailscaled -socket=/home/render/tailscaled.sock \
    -state=/home/render/tailscaled.state \
    -tun=userspace-networking \
    -socks5-server=localhost:1055 &
  until /home/render/tailscale --socket=/home/render/tailscaled.sock up --authkey="${TAILSCALE_AUTHKEY}" --hostname="${RENDER_SERVICE_NAME}" --advertise-routes=10.0.0.0/8; do
    sleep 0.1
  done
  export ALL_PROXY=socks5://localhost:1055/
  tailscale_ip=$(/home/render/tailscale --socket=/home/render/tailscaled.sock ip)
  echo "Tailscale is up at IP ${tailscale_ip}"
fi
