FROM debian:bookworm-slim

RUN apt-get update && \
    apt-get install -y \
    onionshare-cli tor \
    --no-install-recommends && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN echo "SocksPort 0" > /etc/tor/torrc && \
    echo "ControlPort 9051" >> /etc/tor/torrc && \
    echo "CookieAuthentication 1" >> /etc/tor/torrc

ENTRYPOINT ["onionshare-cli"]
