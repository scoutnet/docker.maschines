FROM python:3.11-alpine
MAINTAINER muetze <muetze@scoutnet.de>

WORKDIR /usr/src

RUN pip3 install --no-cache-dir wheel setuptools
RUN apk add --no-cache --virtual .build-deps gcc musl-dev openssl openssl-dev libssl1.1 libffi libffi-dev
RUN pip3 install --no-cache-dir bundlewrap==4.17.0 cryptography
RUN apk del .build-deps gcc musl-dev

RUN apk add sudo make

CMD [ "bw" ]
