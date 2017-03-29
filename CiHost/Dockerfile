FROM php:5.6

RUN apt-get -y update && apt-get install -y unzip git
RUN apt-get install -y parallel

# install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN /usr/local/bin/composer create-project scoutnet/test_environment /opt/typo3

WORKDIR /opt/typo3
