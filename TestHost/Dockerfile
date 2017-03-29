FROM php:5.6
RUN apt-get -y update && apt-get install -y unzip git
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN /usr/local/bin/composer create-project scoutnet/test_environment /opt/typo3
#RUN apt-get install -y go
