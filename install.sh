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

while read in
do  
    dot_mes_install ${in}
    #echo -e "${yellow} INSTALLATION DE ${in}:${default}"
    sudo snap install "$in"
done < snaps_install.txt

echo -e "${green}************************************************${default}"
echo -e "${green}* INSTALATION DE DOCKER-COMPOSE${default}"
echo -e "${green}************************************************${default}"
sudo curl -L "https://github.com/docker/compose/releases/download/1.26.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose


echo -e "${green}************************************************${default}"
echo -e "${green}* CREATION DES LIENS SYMBOLIQUES${default}"
echo -e "${green}************************************************${default}"
exit
ln -s $HOME/.dotfiles/gcalcli/.gcalclirc $HOME/
ln -s $HOME/.dotfiles/autorandr $HOME/.config/
ln -s $HOME/.dotfiles/i3 $HOME/.config/
ln -s $HOME/.dotfiles/i3status $HOME/.config/
ln -s $HOME/.dotfiles/nvim $HOME/.config/

echo -e "${green}************************************************${default}"
echo -e "${green}* CREATION DES CRONTABS${default}"
echo -e "${green}************************************************${default}"

(crontab -l ; echo "*/10 * * * * /usr/bin/gcalcli remind")| crontab -

echo -e "${green}************************************************${default}"
echo -e "${green}* CREATION DES FICHIERS DE CONFIG${default}"
echo -e "${green}************************************************${default}"
echo "source ~/.dotfiles/zsh/zshrc_root" >> $HOME/.zshrc
