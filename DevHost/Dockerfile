FROM php:7-apache
WORKDIR /opt

# install apt dependencies
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y libxml2-dev build-essential libpq-dev nodejs apt-utils git unzip

# install php extensions
RUN docker-php-ext-install -j$(nproc) soap mysqli

# install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

