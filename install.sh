#!/bin/bash
source colors.sh
source install_functions.sh

echo -e "${green}************************************************${default}"
echo -e "${green}* INSTALATION DES LOGICIELS${default}"
echo -e "${green}************************************************${default}"
while read in
do  
    dot_mes_install ${in}
    #echo -e "${yellow} INSTALLATION DE ${in}:${default}"
    sudo apt install -y "$in"
done < programs_to_install.txt
