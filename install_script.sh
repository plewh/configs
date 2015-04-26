#!/bin/bash
#    install_script
#        - run me after a fresh install to add custom settings
#        - things:
#            - install git
#            - install vim
#            - install neovim
#            - download and apply vimrc from github
#            - install g++
#            - install tmux
#            - install libsdl
#            - install libsdl_ttf
#            - download and apply cool DooM wallpaper from github
#            - download and install mouse_accel script 
#            - unattended-upgrades to silently do upgrades without nagging
############################################################################

clear
echo "********** adding new repos               **********"
sudo add-apt-repository -y ppa:neovim-ppa/unstable
echo " "
echo "********** do apt-gets                    **********"
sudo apt-get -y update && sudo apt-get -y dist-upgrade
echo " "
echo "********** installing git                 **********"
sudo apt-get -y install git
git config --global user.email "ashhep@gmail.com"
git config --global user.name "plewh"
git config --global push.default simple
echo " "
echo "********** installing vim                 **********"
sudo apt-get install vim
echo " "
echo "********** installing neovim              **********"
sudo apt-get -y install neovim
sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60
sudo update-alternatives --config vim
echo " "
echo "********** installing vimrc               **********"
wget -O /home/plewh/.nvimrc https://github.com/plewh/configs/raw/master/.vimrc
echo " "
echo "********** installing g++                 **********"
sudo apt-get -y install g++
echo " "
echo "********** installing tmux                **********"
sudo apt-get -y install tmux
echo " "
echo "********** installing libsdl              **********"
sudo apt-get -y install libsdl2-2.0-0
sudo apt-get -y install libsdl2-dev
sudo apt-get -y install libsdl2-ttf-2.0-0
sudo apt-get -y install libsdl2-ttf-dev
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
sudo apt-get -y install unattended-upgrades
sudo dpkg-reconfigure -plow unattended-upgrades
echo " "
echo " "
sudo shutdown -r +1
