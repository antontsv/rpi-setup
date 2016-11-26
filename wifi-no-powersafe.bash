#!/usr/bin/env bash

target="/etc/modprobe.d/8192cu.conf"
if [ ! -f "$target" ];then
    echo "Creating $target to disable powersafe"
    echo "options 8192cu rtw_power_mgnt=0 rtw_enusbss=1 rtw_ips_mode=1" | sudo tee "$target"
fi;
