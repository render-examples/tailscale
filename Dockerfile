FROM debian:latest

RUN apt-get -qq update \
  && apt-get -qq install --upgrade -y --no-install-recommends \
    apt-transport-https \
    ca-certificates \
    netcat \
    wget \
    dnsutils \
  > /dev/null \
  && apt-get -qq clean \
  && rm -rf \
    /var/lib/apt/lists/* \
    /tmp/* \
    /var/tmp/* \
  && :

RUN useradd --no-log-init --create-home --user-group --uid 1000 render

USER 1000:1000
RUN echo "+search +short" > /home/render/.digrc
COPY --chown=1000:1000 run-tailscale.sh start.sh /home/render/

# install Tailscale as root
USER root
COPY install-tailscale.sh /tmp
RUN /tmp/install-tailscale.sh && rm -r /tmp/*
RUN chown 1000:1000 /var/run/tailscale /var/cache/tailscale /var/lib/tailscale

USER 1000:1000

WORKDIR /home/render

CMD ./start.sh
