#!/bin/bash

wd=$(pwd)

packs=$(cat $1)

ds=directories.txt

tmpFile=/tmp/file.txt
mainpkg=http://packages.ros.org/ros/ubuntu/pool/main/r/

srcpkg=orig.tar.gz
tmpSrc=/tmp/tmp.$srcpkg

debianpkg=xenial.debian.tar.xz
tmpDebian=/tmp/tmp.$debianpkg

jde=$(cat paquetesROS-jde.txt)

primera=1

for p in $packs
do 
    echo $p
    #d=$(echo $p | sed 's/ros-kinetic-//g' | sed 's/-/_/g' )
    #mkdir $d
    
    #descargando directorio debian
    wget $mainpkg$p -O $tmpFile
    srctgz=$(cat $tmpFile | grep $srcpkg | sed -r "s/^.*$p/$p/g" | sed 's\</a>.*$\\g')
    echo $srctgz
    wget $mainpkg$p/$srctgz -O $tmpSrc
    debtgz=$(cat $tmpFile | grep $debianpkg | sed -r "s/^.*$p/$p/g" | sed 's\</a>.*$\\g')
    echo $debtgz
    wget $mainpkg$p/$debtgz -O $tmpDebian
    
    tar -zxf $tmpSrc
    d=$(echo $srctgz | sed -r "s/.$srcpkg//g" | sed 's/_/-/g')
    
    echo $d >> $ds
    #copiando directorio debian
    cd $d
    tar -Jxf $tmpDebian
    
    #sed "s/$p/$p-jde/g" -i debian/changelog debian/control debian/rules
    sed "s/$p/$p-jde/g" -i debian/changelog debian/rules
    for j in $jde
    do
       sed "s/$j /$j-jde /g" -i debian/control
       sed "s/$j,/$j-jde,/g" -i debian/control
       sed "s/$j$/$j-jde/g" -i debian/control
    done
    echo "3.0 (native)" > debian/source/format
    
    grep -rl 'env python' . | xargs sed -i 's/env python/env python3/g'
    
    sed -i 's/-jde-/-/g' debian/control
    
    cd $wd
    
    rm $tmpDebian
    rm $tmpSrc
done

