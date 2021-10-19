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

for f in scripts_install/*.sh ; do source $f ; done

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


echo -e "${green}************************************************${default}"
echo -e "${green}* AJOUT DE LA CONFIG VIM POUR ROOT${default}"
echo -e "${green}************************************************${default}"
sudo cp pa/.vimrc_common /root/
sudo sh -c 'echo "source /root/.vimrc_common" >>/root/.vimrc'
