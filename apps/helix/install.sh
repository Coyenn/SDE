#!/usr/bin/env bash

set -e
cd $(dirname "$0")

echo "Installing Helix"
sudo mkdir -p /home/dev/helix-tmp
sudo mv ./config.toml /home/dev/helix-tmp
cd /home/dev/helix-tmp

sudo curl -fsSL $(curl -s https://api.github.com/repos/helix-editor/helix/releases/latest \
| grep "browser_download_url.*x86_64-linux.tar.xz"  \
| cut -d : -f 2,3 \
| tr -d \" \
| xargs) -o helix.tar.xz

sudo tar -xvf helix.tar.xz
sudo mv helix-* helix
sudo mv helix/hx /usr/bin

echo "Installing Helix config"
sudo mkdir -p ~/.config/helix
sudo mv helix/runtime ~/.config/helix
sudo mv ./config.toml ~/.config/helix

cd ..
sudo rm -R helix-tmp

echo "Installing Language Servers"
sudo yarn global add typescript-language-server