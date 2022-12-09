#!/bin/bash
# Install packages.

source /etc/os-release

sudo rpm-ostree install -y \
    alacritty blueman brightnessctl dmenu dunst feh i3 i3-config-fedora i3lock \
    i3status light lxappearance maim network-manager-applet pasystray pavucontrol \
    picom playerctl rofi rofimoji Thunar xclip xinput vorbis-tools

# Prepare the Zulu 11 JDK for Thinkorswim
curl --output /tmp/zulu-repo.rpm https://cdn.azul.com/zulu/bin/zulu-repo-1.0.0-1.noarch.rpm
sudo rpm-ostree install -y -A /tmp/zulu-repo.rpm 
sudo rpm-ostree install -y zulu11-jdk

# Install regular OpenJDK 11
sudo rpm-ostree install -y java-11-openjdk

# Create Fedora toolbox matching Fedora version
toolbox -y create --distro fedora --release f${VERSION_ID}
