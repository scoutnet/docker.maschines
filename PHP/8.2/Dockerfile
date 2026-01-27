FROM php:8.2-alpine

LABEL org.opencontainers.image.vendor="ScoutNet.de"
LABEL org.opencontainers.image.authors="Stefan Mütze Horst <muetze@scoutnet.de>"

WORKDIR /opt

ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/

RUN apk add --no-cache \
    bash \
    file \
    git \
    ca-certificates \
    graphicsmagick \
    grep \
    && chmod +x /usr/local/bin/install-php-extensions \
    && sync \
    && install-php-extensions \
        apcu \
        bcmath \
        bz2 \
        @composer-2 \
        gd \
        gettext \
        gmp \
        intl \
        memcached \
        mysqli \
        opcache \
        pdo_mysql \
        pdo_pgsql \
        pgsql \
        pspell \
        redis \
        soap \
        sysvsem \
        xdebug \
        zip \
    && mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini" \
    && sed -i s/';phar.readonly = On'/'phar.readonly = Off'/ $PHP_INI_DIR/php.ini \
    && sed -i s/'memory_limit = 128M'/'memory_limit = 2G'/ $PHP_INI_DIR/php.ini \
    && sed -i s/'max_execution_time = 30'/'max_execution_time = 240'/ $PHP_INI_DIR/php.ini \
    && sed -i s/';max_input_vars = 1000'/'max_input_vars = 1500'/ $PHP_INI_DIR/php.ini \
    && echo "xdebug.max_nesting_level = 400" >> $PHP_INI_DIR/conf.d/docker-php-ext-xdebug.ini \
    && echo "apc.enable_cli=1" >> $PHP_INI_DIR/conf.d/docker-php-ext-apcu.ini \
    && echo "apc.slam_defense=0" >> $PHP_INI_DIR/conf.d/docker-php-ext-apcu.ini \
    && rm -rf /var/cache/apk/*


# install npm and netcat
RUN apk add --no-cache npm netcat-openbsd && rm -rf /var/cache/apk/*

