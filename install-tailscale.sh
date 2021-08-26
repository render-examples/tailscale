#!/usr/bin/env bash
TSFILE=tailscale_1.14.0_amd64.tgz
wget -q https://pkgs.tailscale.com/stable/${TSFILE} && tar xzf ${TSFILE} --strip-components=1
cp -r tailscale tailscaled /home/render/

mkdir -p /var/run/tailscale /var/cache/tailscale /var/lib/tailscale
