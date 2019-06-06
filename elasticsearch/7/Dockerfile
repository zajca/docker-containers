FROM docker.elastic.co/elasticsearch/elasticsearch:7.1.1
ADD config /usr/share/elasticsearch/config/
RUN set -x && /usr/share/elasticsearch/bin/elasticsearch-plugin install analysis-icu
USER root
RUN set -x && chown -R elasticsearch:elasticsearch config/hunspell config/logging.yml config/elasticsearch.yml
USER elasticsearch
