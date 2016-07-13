#!/bin/bash

sudo apt-get install debootstrap schroot

sudo sed -i "s|^/home|#/home|g" /etc/schroot/default/fstab 
