FROM python:3.14-alpine

LABEL org.opencontainers.image.vendor="ScoutNet.de"
LABEL org.opencontainers.image.authors="Stefan Mütze Horst <muetze@scoutnet.de>"

WORKDIR /usr/src

RUN pip3 install --no-cache-dir wheel setuptools
RUN apk add --no-cache --virtual .build-deps gcc musl-dev openssl openssl-dev libffi libffi-dev
RUN pip3 install --no-cache-dir bundlewrap==4.24.0 cryptography
RUN apk del .build-deps gcc musl-dev

RUN apk add sudo make

CMD [ "bw" ]
