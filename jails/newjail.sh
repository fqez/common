#!/bin/bash

so=$1
ver=$2
arch=$3
name=$4

pathdest="/var/chroot/$name"
if [ ! -f $pathdest ]; then
	url="http://archive.ubuntu.com/ubuntu"
	if [ $so eq "debian" ]; then
  		url="http://ftp.debian.org/debian"
	fi

	sudo sudo mkdir -p /var/chroot/$name

	sudo sh -c "cat<<EOF>/etc/schroot/chroot.d/$name.conf
[$name]
description=$so $ver $arch
directory=/var/chroot/$name
root-users=testuser
type=directory
users=testuser
EOF"

	sudo debootstrap --variant=buildd --arch $arch $ver /var/chroot/$name $url

	sudo cp /etc/resolv.conf /var/chroot/$name/etc/resolv.conf	

	gnome-terminal -e "sudo schroot -c $name -u root"
fi
