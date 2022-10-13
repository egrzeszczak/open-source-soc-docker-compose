#!/bin/bash

# DOCKER
sudo rm -rf ./ssl/wazuh/
docker-compose down
docker container prune -f
docker volume prune -f
docker network prune -f
docker image prune -f

# PRE
docker image rm graylog/graylog:4.3-jre11
docker image rm mongo:4.2
docker image rm wazuh/wazuh-certs-generator:0.0.1
docker image rm wazuh/wazuh-manager:4.3.8
docker image rm wazuh/wazuh-indexer:4.3.8
docker image rm wazuh/wazuh-dashboard:4.3.8

# PROD
docker image rm egrzeszczak/wazuh-indexer
docker image rm egrzeszczak/wazuh-dashboard
docker image rm egrzeszczak/graylog
docker image rm egrzeszczak/graylog-mongo