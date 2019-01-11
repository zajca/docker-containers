FROM php:7.3-fpm

MAINTAINER Martin Zajic <zajca@zajca.cz>

RUN apt-get update && apt-get install -y \
        git \
        unzip \
        curl \
        ca-certificates \
        libcurl4-openssl-dev \
        zlib1g-dev \
        libxml2-dev \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng-dev \
        libzip-dev \
		gnupg \
        libicu-dev \
## wkhtmltox deps
        xfonts-base \
        xfonts-75dpi \
        libxrender1 \
        libxext6 \
        libxcb1 \
        libx11-6 \
        libxrender1 \
        fontconfig \
        libfontconfig &&\
	docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ &&\
	docker-php-ext-install -j$(nproc) gd &&\
    rm -rf /var/lib/apt/lists/*;

# Set timezone
RUN rm /etc/localtime &&\
    ln -s /usr/share/zoneinfo/Europe/Prague /etc/localtime &&\
    "date"

# Type docker-php-ext-install to see available extensions
RUN docker-php-ext-install pdo pdo_mysql curl iconv intl mbstring zip bcmath xml soap

# install apcu
RUN pecl install apcu
RUN docker-php-ext-enable apcu

RUN docker-php-ext-configure opcache --enable-opcache \
    && docker-php-ext-install opcache
# Copy configuration
COPY config/opcache.ini /usr/local/etc/php/conf.d/
COPY config/php.ini /usr/local/etc/php/conf.d/
COPY config/uploads.ini /usr/local/etc/php/conf.d/

RUN curl -o /usr/local/bin/wkhtmltox_0.12.5-1.stretch_amd64.deb -L https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/0.12.5/wkhtmltox_0.12.5-1.stretch_amd64.deb &&\
	dpkg -i /usr/local/bin/wkhtmltox_0.12.5-1.stretch_amd64.deb &&\
	rm /usr/local/bin/wkhtmltox_0.12.5-1.stretch_amd64.deb
