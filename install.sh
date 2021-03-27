#!/bin/bash
source colors.sh
echo -e "${green}************************************************${default}"
echo -e "${green}* INSTALATION DES LOGICIELS${default}"
echo -e "${green}************************************************${default}"
sudo apt install -y gcalcli dmenu zsh tmux i3 nvim vim gimp git mycli payerctl autorandr ncal docker filezilla

echo -e "${green}************************************************${default}"
echo -e "${green}* CREATION DES LIENS SYMBOLIQUES${default}"
echo -e "${green}************************************************${default}"
exit
ln -s $HOME/.dotfiles/gcalcli/.gcalclirc $HOME/
ln -s $HOME/dotfiles/autorandr $HOME/.config/
ln -s $HOME/dotfiles/i3 $HOME/.config/
ln -s $HOME/dotfiles/i3status $HOME/.config/
ln -s $HOME/dotfiles/nvim $HOME/.config/

echo -e "${green}************************************************${default}"
echo -e "${green}* CREATION DES CRONTABS${default}"
echo -e "${green}************************************************${default}"

(crontab -l ; echo "*/10 * * * * /usr/bin/gcalcli remind")| crontab -

echo -e "${green}************************************************${default}"
echo -e "${green}* CREATION DES FICHIERS DE CONFIG${default}"
echo -e "${green}************************************************${default}"
echo "source ~/.dotfiles/zsh/zshrc_root" >> $HOME/.zshrc
