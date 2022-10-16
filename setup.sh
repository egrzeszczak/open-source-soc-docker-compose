#!/bin/bash
GRAY='\033[1;30m'
NC='\033[0m' # No Color

# Setup TLS
echo -e "${GRAY}[setup.sh]: 1. Generate TLS certificates${NC}"
echo -e "${GRAY}[setup.sh]: 1.1. Generate TLS certificates for Wazuh Indexer, Wazuh Dashboard, Wazuh Manager${NC}"
docker-compose -f ./ssl/wazuh-generate.yml run --rm generator

# Build images
echo -e "${GRAY}[setup.sh]: 2. Build images${NC}"
docker-compose build

# Configure files
echo -e "${GRAY}[setup.sh]: 3. Configure files${NC}"
chown root:root ./config/wazuh/wazuh_manager/filebeat/filebeat.yml
chmod go-w ./config/wazuh/wazuh_manager/filebeat/filebeat.yml


echo -e "${GRAY}[setup.sh]: Finished \n\nYou can now run${NC} docker-compose up -d ${GRAY}to run the stack${NC}\n\n"