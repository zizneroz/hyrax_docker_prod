FROM solr:7.0.1
USER root
RUN apt-get update -qq && apt-get install -y sudo
RUN precreate-core hydra-development
RUN useradd -u 1001 solruser
RUN sudo chmod -R 777 /opt/solr/server/
USER solruser

