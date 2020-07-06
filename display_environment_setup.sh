#!/bin/bash

# Install graphics driver
sudo pacman -Syu --noconfirm xf86-video-intel nvidia nvidia-utils nvidia-settings lib32-nvidia-utils

# Install display manager and window manager
sudo pacman -S --noconfirm xorg i3-gaps i3lock i3status lightdm lightdm-gtk-greeter

# Let us first have the most basic Internet capabilities
sudo pacman -S --noconfirm chromium

# Some application
sudo pacman -S --noconfirm rxvt-unicode ranger demenu rofi

# Terminal image support
sudo pacman -S --noconfirm w3m imlib2

# Sound support
sudo pacman -S --noconfirm alsa-utils pulseaudio pulseaudio-alsa pulseaudio-bluetooth pavucontrol

# RDP support
sudo pacman -S --noconfirm freerdp remmina

# Wallpaper support
sudo pacman -S --noconfirm feh

# Enable the display manager has started with system boot
sudo systemctl enable lightdm
sudo systemctl start lightdm
