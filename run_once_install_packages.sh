#!/bin/bash
# Install packages.

source /etc/os-release

sudo rpm-ostree install -y \
    alacritty blueman brightnessctl dmenu dunst feh i3 i3-config-fedora i3lock \
    i3status light lxappearance maim network-manager-applet pasystray pavucontrol \
    picom playerctl rofi rofimoji Thunar xclip xinput vorbis-tools || true

# Prepare the Zulu 11 JDK for Thinkorswim
if ! rpm-ostree status | grep zulu-repo > /dev/null; then
    curl -sL --output /tmp/zulu-repo.rpm https://cdn.azul.com/zulu/bin/zulu-repo-1.0.0-1.noarch.rpm
    sudo rpm-ostree install -y -A /tmp/zulu-repo.rpm 
    sudo rpm-ostree install -y zulu11-jdk
fi

# Install regular OpenJDK 11
if ! rpm-ostree status | grep java-11-openjdk > /dev/null; then
    sudo rpm-ostree install -y java-11-openjdk
fi

# Create Fedora toolbox matching Fedora version
if ! toolbox list | grep fedora-toolbox-${VERSION_ID} > /dev/null; then
    toolbox -y create --distro fedora --release f${VERSION_ID}
fi

# Prepare toolbox
toolbox run sudo dnf -y install bat fzf git-delta ripgrep the_silver_searcher vim zsh
