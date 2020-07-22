#/bin/bash

sudo pacman -S --noconfirm git unzip curl wget cmake python3-dev neofetch openssh picom pacman-contrib

# bluetooth support

sudo pacman -S --noconfirm bluez bluez-utils pulseaudio-bluetooth
sudo systemctl start bluetooth.servicesudo
sudo systemctl enable bluetooth.servicesudo


sudo ln -s /usr/bin/vim /usr/bin/vi
