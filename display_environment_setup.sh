#!/bin/bash

# Install graphics driver
sudo pacman -Syu --noconfirm xf86-video-intel nvidia nvidia-utils nvidia-settings lib32-nvidia-utils

# Install display manager, window manager amd Google CJK fonts
sudo pacman -S --noconfirm xorg i3-gaps i3lock i3status lightdm lightdm-gtk-greeter noto-fonts-cjk

# Let us first have the most basic Internet capabilities
sudo pacman -S --noconfirm chromium

# Terminal and application luncher
sudo pacman -S --noconfirm rxvt-unicode ranger dmenu rofi

# Terminal image support
sudo pacman -S --noconfirm w3m imlib2

# Sound support
sudo pacman -S --noconfirm alsa-utils pulseaudio pulseaudio-alsa pulseaudio-bluetooth pavucontrol mpd

# Chinese input support
sudo pacman -S --noconfirm ibus ibus-chewing

# RDP support
sudo pacman -S --noconfirm freerdp remmina

# Wallpaper support
sudo pacman -S --noconfirm feh

# Backlight change util
sudo pacman -S --noconfirm light

# Enable the display manager has started with system boot
sudo systemctl enable lightdm
sudo systemctl start lightdm
