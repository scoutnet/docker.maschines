FROM php:7.4-cli
WORKDIR /opt

# install apt dependencies
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y libxml2-dev build-essential libpq-dev nodejs apt-utils git unzip && docker-php-ext-install -j$(nproc) soap

# install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# install typo3 TER upload client
RUN /usr/local/bin/composer require namelesscoder/typo3-repository-client

# install github Release Api CLI
RUN apt-get install -y wget && wget https://github.com/github-release/github-release/releases/download/v0.10.0/linux-amd64-github-release.bz2 && bunzip2 linux-amd64-github-release.bz2 && mv linux-amd64-github-release /usr/bin/github-release && chmod +x /usr/bin/github-release
env PATH /usr/bin:$PATH

# install zip
RUN apt-get install -y zip
