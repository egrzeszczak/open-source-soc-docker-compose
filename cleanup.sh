#!/bin/bash
GRAY='\033[1;30m'
NC='\033[0m' # No Color

# Compose down the stack
echo -e "${GRAY}[setup.sh]: 1. docker-compose down${NC}"
docker-compose down

# Clean TLS
echo -e "${GRAY}[setup.sh]: 2. Clean up TLS certificates${NC}"
echo -e "${GRAY}[setup.sh]: 2.1. Generate TLS certificates for Wazuh Indexer, Wazuh Dashboard, Wazuh Manager${NC}"
sudo rm -rf ./ssl/wazuh/

# Clean up images
echo -e "${GRAY}[setup.sh]: 3. Clean up docker${NC}"
docker container prune -f
docker volume prune -f
docker network prune -f
docker image prune -f
docker image rm egrzeszczak/wazuh-indexer
docker image rm egrzeszczak/wazuh-dashboard
docker image rm egrzeszczak/wazuh-manager
docker image rm egrzeszczak/graylog
docker image rm egrzeszczak/graylog-mongo

echo -e "${GRAY}[setup.sh]: Stack is cleaned up${NC}"