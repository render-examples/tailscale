# Run Tailscale on Render

[Tailscale](https://tailscale.com) is a zero-config VPN service built on top of [Wireguard](https://www.wireguard.com/). It's great for accessing devices and applications behind firewalls, and you can use it to connect to all your private services on Render with this repo.

Tailscale [subnet routers](https://tailscale.com/kb/1019/subnets/) act as a gateway to your Render private network, enabling connections to any and all internal IPs (of the form `10.x.x.x`) in your Render network.

## Deployment

### One Click Deploy

Use the button below to deploy a Tailscale Subnet Router on Render.

[![Deploy to Render](http://render.com/images/deploy-to-render-button.svg)](https://render.com/deploy)

## Usage
Deploying this repo will create a subnet router in your Tailscale network. Once it's up and running, you can connect to any private service by looking up $RENDER_INTERNAL_IP in the web shell.
