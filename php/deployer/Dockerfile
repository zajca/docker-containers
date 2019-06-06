FROM composer:latest

ENV DEPLOYER_VERSION=6.4

RUN apk update --no-cache \
    && apk add --no-cache \
    openssh-client \
    rsync

RUN composer global require --update-no-dev \
    deployer/deployer:^$DEPLOYER_VERSION \
    deployer/recipes && \
    rm -Rf /tmp/composer/cache

COPY entrypoint-deployer.sh /entrypoint-deployer.sh

WORKDIR /app

ENTRYPOINT ["/bin/sh", "/entrypoint-deployer.sh"]

CMD ["dep"]