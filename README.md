# Docker containers for development

# PHP

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

## 7

usage:

```
#compose file
  es:
    image: zajca/elasticsearch-icu_cz:7
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
