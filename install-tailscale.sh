#!/usr/bin/env bash
set -x
TAILSCALE_VERSION=${TAILSCALE_VERSION:-1.22.0}
TS_FILE=tailscale_${TAILSCALE_VERSION}_amd64.tgz
echo 'net.ipv4.ip_forward = 1' | sudo tee -a /etc/sysctl.conf
echo 'net.ipv6.conf.all.forwarding = 1' | sudo tee -a /etc/sysctl.conf
sysctl -p /etc/sysctl.conf

wget -q "https://pkgs.tailscale.com/stable/${TS_FILE}" && tar xzf "${TS_FILE}" --strip-components=1
cp -r tailscale tailscaled /render/

mkdir -p /var/run/tailscale /var/cache/tailscale /var/lib/tailscale

