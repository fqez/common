#!/bin/bash

wd=$(pwd)


packs=$(cat $1)


for p in $packs
do
    cd $p
    echo $p
    subl .
    echo "esperando..."
    read null
    
    dpkg-buildpackage -us -uc
    
    
    cd $wd
    
    a=$(echo $p | sed 's/-[0-9].*$//g')
    sudo dpkg -i $a*.deb
    sudo apt install -f
    sudo dpkg -i $a*.deb
done


