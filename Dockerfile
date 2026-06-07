FROM arm32v7/alpine:edge

ARG SNAPCAST_VERSION=0.35.0-r0
ARG LIBRESPOT_VERSION=0.8.0-r0

RUN set -eux; \
    printf '%s\n' \
        'https://dl-cdn.alpinelinux.org/alpine/edge/main' \
        'https://dl-cdn.alpinelinux.org/alpine/edge/community' \
        'https://dl-cdn.alpinelinux.org/alpine/edge/testing' \
        > /etc/apk/repositories; \
    apk add --no-cache \
        alsa-lib \
        alsa-utils \
        ca-certificates \
        "snapcast-server=${SNAPCAST_VERSION}" \
        "librespot=${LIBRESPOT_VERSION}"; \
    snapserver --version; \
    librespot --version

CMD ["snapserver"]
