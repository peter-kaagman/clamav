FROM debian:stable-slim

RUN apt-get update && \
    apt-get install -y --no-install-recommends clamav clamav-daemon ca-certificates && \
    rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

VOLUME /var/lib/clamav
VOLUME /var/log/clamav

EXPOSE 3310

HEALTHCHECK --interval=1m --timeout=10s --retries=3 CMD clamdscan --version || exit 1

ENTRYPOINT ["/entrypoint.sh"]