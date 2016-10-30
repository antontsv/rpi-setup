#!/bin/bash

target='node-v6.6.0-linux-armv6l'
wget "https://nodejs.org/dist/latest-v6.x/$target.tar.gz"
tar -xvf "$target.tar.gz"
sudo cp -R "$target/"* /usr/local/
node -v
