#!/usr/bin/env bash

sudo apt-get install -y samba
sudo apt-get install -y cups
sudo apt-get install -y lynx
sudo gpasswd -a pi lpadmin

echo "Configure printer..."
lynx 127.0.0.1:631

