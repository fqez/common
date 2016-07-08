#!/bin/bash

orig=$1
dest=$2

pathorig="/var/chroot/$1"
pathdest="/var/chroot/$2"


if [ ! -f $pathdest ]; then
    sudo mkdir -p $pathdest
	sudo cp -r  $pathorig/* $pathdest
	
	sudo cp /etc/schroot/chroot.d/$1.conf /etc/schroot/chroot.d/$2.conf

    sudo sed -i "s/$1/$2/g" /etc/schroot/chroot.d/$2.conf
fi






