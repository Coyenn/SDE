#!/usr/bin/env bash

set -e
cd $(dirname "$0")

if [ -f /etc/lsb-release ]; then
  echo "Running Neovim installation for Debian based system"

  echo "Installing dependencies"
  sudo npm install -g yarn@latest

  echo "Installing latest version of neovim"
  sudo add-apt-repository ppa:neovim-ppa/stable -y
  sudo apt-get update
  sudo apt-get -qq install neovim

  echo "Installing vim plug"
  sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

  echo "Installing config"
  mkdir -p ~/.config/nvim
  cp ./init.vim ~/.config/nvim
fi

echo "Done"
