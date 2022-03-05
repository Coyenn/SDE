#!/usr/bin/env bash

set -e
cd "$(dirname "$0")"

# Get the latest release of starship, unpack and install it
sudo curl -fSL https://github.com/starship/starship/releases/latest/download/starship-x86_64-unknown-linux-gnu.tar.gz -o starship.tar.gz
sudo tar -xvf starship.tar.gz
sudo rm starship.tar.gz
sudo chmod +x starship
sudo mv starship /usr/bin

# Create fish config and init starship in it
touch ~/.bashrc
echo 'eval "$(starship init bash)"' > ~/.bashrc
