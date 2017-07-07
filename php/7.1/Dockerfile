FROM php:7.1.6-fpm

MAINTAINER Martin Zajic <zajca@zajca.cz>

RUN apt-get update && apt-get install -y \
        git \
        unzip \
        curl \
        libcurl4-openssl-dev \
        zlib1g-dev \
        libxml2-dev \
        libicu-dev &&\
    curl -sL https://deb.nodesource.com/setup_6.x | bash - && \
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - &&\
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list &&\
    apt-get update && apt-get install -y \
        nodejs \
        yarn &&\
    npm i -g \
        gulp \
        bower &&\
    rm -rf /var/lib/apt/lists/*;

# Set timezone
RUN rm /etc/localtime &&\
    ln -s /usr/share/zoneinfo/Europe/Prague /etc/localtime &&\
    "date"

# Type docker-php-ext-install to see available extensions
RUN docker-php-ext-install pdo pdo_mysql curl iconv intl mbstring zip bcmath opcache xml soap gd

# install apcu
RUN pecl install apcu
RUN docker-php-ext-enable apcu
