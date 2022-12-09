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

sudo systemctl enable --now dnf-automatic-download.timer
