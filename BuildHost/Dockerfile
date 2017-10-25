FROM php:7.0-cli
WORKDIR /opt

# install apt dependencies
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y libxml2-dev build-essential libpq-dev nodejs apt-utils git unzip && docker-php-ext-install -j$(nproc) soap

# install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# install typo3 TER upload client
RUN /usr/local/bin/composer require namelesscoder/typo3-repository-client

# install Go
RUN apt-get install -y wget && wget https://storage.googleapis.com/golang/go1.8.linux-amd64.tar.gz && tar -C /usr/local -xzf go1.8.linux-amd64.tar.gz

# install github Release Api CLI
RUN /usr/local/go/bin/go get github.com/aktau/github-release
env PATH /usr/local/go/bin:/root/go/bin:$PATH

# install zip
RUN apt-get install -y zip
