
#!/usr/bin/env bash

set -e
cd "$(dirname "$0")"

# Install fish and curl. Set fish as the default shell.
apt-get -qq install curl

# Get the latest release of starship, unpack and install it
curl -fsSL https://github.com/starship/starship/releases/latest/download/starship-x86_64-unknown-linux-gnu.tar.gz -O
tar -xvf starship-x86_64-unknown-linux-gnu.tar.gz
mv starship /usr/bin
rm starship-x86_64-unknown-linux-gnu.tar.gz

# Create fish config and init starship in it
touch ~/.bashrc
echo 'eval "$(starship init bash)"' > ~/.bashrc
