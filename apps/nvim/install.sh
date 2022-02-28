#!/usr/bin/env bash

set -e
cd $(dirname "$0")

if [ -f /etc/lsb-release ]; then
  echo "Running Neovim installation for Debian based system"

  echo "Installing dependencies"
  apt-get -qq update
  apt-get -qq install nodejs npm software-properties-common curl
  npm install -g yarn@latest

  echo "Installing latest version of neovim"
  add-apt-repository ppa:neovim-ppa/stable -y
  apt-get update
  apt-get install -qq neovim

  echo "Installing vim plug"
  sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

  echo "Installing config"
  mkdir -p ~/.config/nvim
  cp ./init.vim ~/.config/nvim
fi

echo "Done"
