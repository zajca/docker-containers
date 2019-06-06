# Docker containers for development

# PHP

## 7.1 (deprecated not in docker hub)

### 7.1

includes node npm and yarn and zsh

### 7.1-debug

php debug version with node npm and yarn and zsh

### 7.1-export

specific container for export from mssql database with odbc included

## 7.2

### 7.2-plain

php-fpm with extra packages

### 7.2-dev

php-fpm dev version with extra packages and wkhtmltox

### 7.2-prod

php-fpm prod version with extra packages opcache and wkhtmltox

## 7.3

### 7.3-plain

php-fpm with extra packages

### 7.3-dev

php-fpm dev version with extra packages and wkhtmltox

### 7.3-prod

php-fpm prod version with extra packages opcache and wkhtmltox

## deployer

### latest

deployer php

usage:

```
	docker run --rm \
        -v $(pwd):/app \
        zajca/deployer \
        dep --file=deploy.php deploy dev
```

# elasticsearch

includes analysis-icu plugin and czech hunspell dictionary

## 6

## 7

usage:

```
#compose file
  es:
    image: zajca/elasticsearch-icu_cz:6.8
    environment:
      - cluster.name=docker-cluster
      - bootstrap.memory_lock=true
      - "ES_JAVA_OPTS=-Xms512m -Xmx512m"
      - ELASTIC_PASSWORD=changeme
    volumes:
      - $PWD/.data/es:/usr/share/elasticsearch/data
      - $PWD/.logs/es:/usr/share/elasticsearch/log
    ulimits:
      memlock:
        soft: -1
        hard: -1
      nofile:
        soft: 65536
        hard: 65536
    ports:
      - 9200:9200
      - 9300:9300
```
