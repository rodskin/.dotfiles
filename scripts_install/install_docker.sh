#!/bin/bash
echo -e "${green}************************************************${default}"
echo -e "${green}* INSTALATION DE DOCKER${default}"
echo -e "${green}************************************************${default}"
sudo apt install -y docker
sudo usermod -aG docker "$USER"

