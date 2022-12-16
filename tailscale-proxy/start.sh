#!/usr/bin/env bash

/app/tailscaled --tun=userspace-networking --socks5-server=0.0.0.0:1055 &
/app/tailscale up --authkey=${TAILSCALE_AUTHKEY} --hostname=tailscale-proxy
echo Tailscale started
export ALL_PROXY=socks5://0.0.0.0:1055/
export HTTP_PROXY=socks5://0.0.0.0:1055/
export HTTPS_PROXY=socks5://0.0.0.0:1055/
python3 -m http.server -d /app/www --bind 0.0.0.0 10000
