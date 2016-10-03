#!/bin/bash

jailsDest=/usr/local/share/
if [ ! -d /etc/schroot ]; then
    sudo apt-get install debootstrap schroot

    sudo sed -i "s|^/home|#/home|g" /etc/schroot/default/fstab
fi

sudo cp -r jails $jailsDest
sudo cp bin/* /usr/local/bin
    #exp="export jails=$jailsDest/jails"
    #$exp
    #echo $exp >> ~/.bashrc
