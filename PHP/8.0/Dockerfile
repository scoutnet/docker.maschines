FROM typo3gmbh/php80:latest
WORKDIR /opt

# install npm
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y npm && apt-get clean
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y netcat && apt-get clean

