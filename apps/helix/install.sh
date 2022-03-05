#!/usr/bin/env bash

set -e
cd $(dirname "$0")

echo "Installing Helix"
cd /home/dev
mkdir helix-tmp
cd helix-tmp

curl -fsSL $(curl -s https://api.github.com/repos/helix-editor/helix/releases/latest \
| grep "browser_download_url.*x86_64-linux.tar.xz"  \
| cut -d : -f 2,3 \
| tr -d \" \
| xargs) -o helix.tar.xz

tar -xvf helix.tar.xz
mv helix-* helix
sudo mv helix/hx /usr/bin

echo "Installing Helix config"
mdkir ~/.config/helix
mv helix/runtime ~/.config/helix
mv config.toml ~/.config/helix

cd ..
sudo rm -R helix-tmp

echo "Installing Language Servers"
sudo yarn global add typescript-language-server