#!/bin/bash
# Install packages.

package_add=(
  alacritty
  bat
  blueman
  btop
  dnf-automatic
  fedora-packager
  fzf
  git
  git-delta
  krb5-workstation
  lxappearance
  lxpolkit
  pasystray
  playerctl
  ripgrep
  rofi
  rofimoji
  the_silver_searcher
  vim
  vorbis-tools
  zsh
)

package_del=(
  volumeicon
)

sudo dnf -y install $(IFS=' '; echo "${package_add[*]}")
sudo dnf -y remove $(IFS=' '; echo "${package_del[*]}")

# Enable downloading of updates.
sudo systemctl enable --now dnf-automatic-download.timer

# Prepare Zulu JDK for Thinkorswim
sudo dnf -y install https://cdn.azul.com/zulu/bin/zulu-repo-1.0.0-1.noarch.rpm
sudo dnf -y install zulu11-jdk

# Set up RPM Fusion
sudo dnf install \
    https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
    https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# Switch to the mesa with AMD acceleration
sudo dnf swap mesa-va-drivers mesa-va-drivers-freeworld
sudo dnf swap mesa-vdpau-drivers mesa-vdpau-drivers-freeworld
