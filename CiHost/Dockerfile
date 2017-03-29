FROM php:5.6

LABEL de.scoutnet.version="1.0.0"
LABEL vendor="scoutnet"

RUN apt-get -y update && apt-get install -y unzip git
RUN apt-get install -y parallel

# install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN mkdir -p /opt/typo3
COPY composer.json /opt/typo3
RUN cd /opt/typo3 && /usr/local/bin/composer install

WORKDIR /opt/typo3
