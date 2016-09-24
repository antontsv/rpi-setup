#!/bin/bash

if [ "$1" = "--install-gcc-6.1.0"];then
    git clone https://bitbucket.org/sol_prog/raspberry-pi-gcc-6.1.0-binary
    cd raspberry-pi-gcc-6.1.0-binary/
    7z e gcc-6.1.0.tar.7z
    tar -xf gcc-6.1.0.tar
    sudo mv gcc-6.1.0 /usr/local/gcc-6.1.0
    cd ~
    rm -rf raspberry-pi-gcc-6.1.0-binar
    # todo link gcc binary or use alternatives
fi;

sudo apt-get update
sudo apt-get install -y p7zip-full libavahi-compat-libdnssd-dev screen

source setup-nodejs.bash

sudo npm install -g --unsafe-perm homebridge hap-nodejs node-gyp
cd /usr/local/lib/node_modules/
sudo npm install --unsafe-perm bignum
cd /usr/local/lib/node_modules/hap-nodejs/node_modules/mdns
sudo node-gyp BUILDTYPE=Release rebuild
echo 'Done'
