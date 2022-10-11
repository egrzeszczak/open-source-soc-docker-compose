#!/bin/bash

docker-compose -f ./ssl/wazuh-generate.yml run --rm generator
sudo docker-compose up