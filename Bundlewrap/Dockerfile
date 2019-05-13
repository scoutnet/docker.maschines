FROM ubuntu:16.04
MAINTAINER muetze <muetze@scoutnet.de>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    apt-get -y install --no-install-recommends \
      ca-certificates=20160104ubuntu1 \
      libssl1.0.0=1.0.2g-1ubuntu4.6 \
      locales=2.23-0ubuntu9 \
      openssl=1.0.2g-1ubuntu4.6 \
      wget \
      && \
    apt-get clean && rm -rf /var/lib/apt/lists/*
RUN wget https://github.com/Yelp/dumb-init/releases/download/v1.2.0/dumb-init_1.2.0_amd64.deb
RUN dpkg -i dumb-init_*.deb
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8
RUN locale-gen en_US.UTF-8

ENTRYPOINT ["/usr/bin/dumb-init", "--"]


RUN apt-get update && \
    apt-get -y install --no-install-recommends python3.7 python3.7-dev python3.7 python3-setuptools python3-pip libssl-dev build-essential libffi-dev sudo git ssh

RUN pip3 install wheel
RUN pip3 install bundlewrap==3.6.1 cryptography==2.6.1

