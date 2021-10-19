#!/bin/bash
echo -e "${green}************************************************${default}"
echo -e "${green}* INSTALATION DE DOCKER-COMPOSE${default}"
echo -e "${green}************************************************${default}"
DC_LATEST_VERSION=`curl --silent "https://api.github.com/repos/docker/compose/releases/latest" | grep -Po '"tag_name": "\K.*?(?=")'`
sudo curl -L "https://github.com/docker/compose/releases/download/$DC_LATEST_VERSION/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose -v
