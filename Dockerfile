FROM arm32v7/alpine

RUN apk add snapcast-server alsa-utils alsa-utils-doc alsa-lib alsaconf \
    && apk add librespot --repository=http://dl-cdn.alpinelinux.org/alpine/edge/testing/

CMD snapserver

