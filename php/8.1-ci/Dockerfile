FROM php:8.1-fpm

MAINTAINER Martin Zajic <zajca@zajca.cz>

RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
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
        libzip-dev \
        libonig-dev \
        zsh \
        gnupg \
        libxrender1 \
        libfontconfig \
        graphviz \
        libicu-dev \
        nodejs \
        git \
        npm &&\
	docker-php-ext-configure gd --with-freetype --with-jpeg &&\
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

RUN touch /usr/local/etc/php/conf.d/uploads.ini \
    && echo "upload_max_filesize = 64M;" >> /usr/local/etc/php/conf.d/uploads.ini \
    && echo "post_max_size = 64M;" >> /usr/local/etc/php/conf.d/uploads.ini \
    && echo "memory_limit = 512M;" >> /usr/local/etc/php/conf.d/uploads.ini \
    && echo "max_execution_time = 600;" >> /usr/local/etc/php/conf.d/uploads.ini
RUN curl -o /usr/local/bin/wkhtmltox-0.12.4_linux-generic-amd64.tar.xz -L 'https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/0.12.4/wkhtmltox-0.12.4_linux-generic-amd64.tar.xz' &&\
    tar xf /usr/local/bin/wkhtmltox-0.12.4_linux-generic-amd64.tar.xz -C /usr/local/bin/ &&\
    rm /usr/local/bin/wkhtmltox-0.12.4_linux-generic-amd64.tar.xz
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer &&\
    composer --version
