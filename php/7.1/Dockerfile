FROM php:7.1.15-fpm

MAINTAINER Martin Zajic <zajca@zajca.cz>

RUN apt-get update && apt-get install -y \
        git \
        unzip \
        curl \
        libcurl4-openssl-dev \
        zlib1g-dev \
        libxml2-dev \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng12-dev \
	zsh \
        libicu-dev &&\
	docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ &&\
	docker-php-ext-install -j$(nproc) gd &&\
    curl -sL https://deb.nodesource.com/setup_8.x | bash - && \
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - &&\
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list &&\
    curl -sL https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | zsh - && \
    chsh -s /bin/zsh && \
    apt-get update && apt-get install --quiet --yes --force-yes \
        nodejs \
        yarn &&\
    npm i -g \
        gulp \
        bower &&\
    rm -rf /var/lib/apt/lists/*;

#configure zsh
ADD .zshrc /root/.zshrc

# Set timezone
RUN rm /etc/localtime &&\
    ln -s /usr/share/zoneinfo/Europe/Prague /etc/localtime &&\
    "date"

# Type docker-php-ext-install to see available extensions
RUN docker-php-ext-install pdo pdo_mysql curl iconv intl mbstring zip bcmath xml soap
    
# install apcu
RUN pecl install apcu
RUN docker-php-ext-enable apcu
