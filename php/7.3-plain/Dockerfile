FROM php:7.3-fpm

MAINTAINER Martin Zajic <zajca@zajca.cz>

RUN apt-get update && apt-get install -y \
        unzip \
        curl \
        ca-certificates \
        libcurl4-openssl-dev \
        zlib1g-dev \
        libxml2-dev \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng-dev \
		zsh \
		gnupg \
        libicu-dev &&\
	docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ &&\
	docker-php-ext-install -j$(nproc) gd &&\
    rm -rf /var/lib/apt/lists/*;

# Set timezone
RUN rm /etc/localtime &&\
    ln -s /usr/share/zoneinfo/Europe/Prague /etc/localtime &&\
    "date"

# Type docker-php-ext-install to see available extensions
RUN docker-php-ext-install pdo pdo_mysql curl iconv intl mbstring zip bcmath xml soap opcache

# install apcu
RUN pecl install apcu
RUN docker-php-ext-enable apcu
