#!/bin/bash
#    install_script
#        - run me after a fresh install to add custom settings
#        - things:
#            - install and setup  git
#            - install vim, setup vimrc
#            - install c++ compiler
#            - install tmux
#            - install SDL2
#            - install SDL2 ttf library
#            - install tag file generator
#            - download and apply cool DooM wallpaper from github
#            - download and install mouse_accel script 
#            - unattended-upgrades to silently do upgrades without nagging
############################################################################

clear
echo "********** adding new repos               **********"
echo "Nah..."
echo " "
echo "********** do apt-gets                    **********"
sudo apt -y update && sudo apt -y dist-upgrade
echo " "
echo "********** installing git                 **********"
sudo apt -y install git
git config --global user.email "ashhep@gmail.com"
git config --global user.name "plewh"
git config --global push.default simple
git config --global core.editor "vim"
echo " "
echo "********** installing vim                 **********"
sudo apt -y install vim
echo " "
echo "********** installing vimrc               **********"
wget -O /home/plewh/.vimrc https://github.com/plewh/configs/raw/master/.vimrc
echo " "
echo "********** installing c++ compiler        **********"
sudo apt -y install g++
echo " "
echo "********** installing tmux                **********"
sudo apt -y install tmux
echo " "
echo "********** installing tmux.conf           **********"
wget -O /home/plewh/.tmux.conf https://github.com/plewh/configs/raw/master/tmux.conf
echo " "
echo "********** installing SDL2                **********"
sudo apt -y install libsdl2-2.0-0
sudo apt -y install libsdl2-dev
sudo apt -y install libsdl2-ttf-2.0-0
sudo apt -y install libsdl2-ttf-dev
echo " "
echo "********** installing exuberant  ctags    **********"
sudo apt -y install exuberant-ctags
echo " "
echo "********** installing cool DooM wallpaper **********"
wget -O /home/plewh/Downloads/wpaper.png https://github.com/plewh/configs/raw/master/d.png
sleep 5
gsettings set org.gnome.desktop.background picture-uri file:///home/plewh/Downloads/wpaper.png
echo " "
echo "********** installing mouse accel script  **********"
wget -O /etc/profile.d/mouse_accel.sh https://github.com/plewh/configs/raw/master/mouse_accel.sh
echo " "
echo "********** installing unattended-upgrades **********"
sudo apt -y install unattended-upgrades
sudo dpkg-reconfigure -plow unattended-upgrades
echo " "
echo " "

echo " "
echo "********** creating custom aliases        ***********"
echo "alias doupgrade='sudo apt -y update && sudo apt -y upgrade && sudo apt -y autoremove'" >> ~/.bash_aliases

read -p "Reboot? " in
if [ "$in" == "y" ]; then
	echo "rebooting...";
	sudo reboot now
else
	echo "exiting...";
fi
