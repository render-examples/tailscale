#!/usr/bin/env bash
set -x
TAILSCALE_VERSION=${TAILSCALE_VERSION:-1.22.0}
TS_FILE=tailscale_${TAILSCALE_VERSION}_amd64.tgz

echo 'net.ipv4.ip_forward = 1' | sudo tee -a /etc/sysctl.conf
echo 'net.ipv6.conf.all.forwarding = 1' | sudo tee -a /etc/sysctl.conf
sudo sysctl -p /etc/sysctl.conf

apt update && apt upgrade -y
apt install curl

curl -fsSL https://tailscale.com/install.sh | sh

tailscale up --authkey=${TAILSCALE_AUTHKEY} --advertise-routes=${ADVERTISE_ROUTES} --accept-routes
