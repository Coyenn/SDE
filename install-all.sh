#!/usr/bin/env bash

set -e
cd "$(dirname "$0")"

echo "Looking for any install scripts"

for file in $(find ./ -name 'install.sh'); do
  echo "Running install script $file"
  bash $file
done

rm -R ~/*
