#!/bin/bash

sh -c 'echo "deb http://packages.osrfoundation.org/gazebo/ubuntu `lsb_release -cs` main" > /etc/apt/sources.list.d/gazebo-latest.list'

apt-key adv --keyserver ha.pool.sks-keyservers.net --recv-keys D2486D2DD83DB69272AFE98867170598AF249743

sh -c 'echo deb http://ppa.launchpad.net/v-launchpad-jochen-sprickerhof-de/pcl/ubuntu `lsb_release -cs` main > /etc/apt/sources.list.d/v-launchpad-jochen-sprickerhof-de-pcl-trusty.list'

apt-key adv --keyserver ha.pool.sks-keyservers.net --recv-keys D51148574AAB18C259B43628D8A3751519274DEF

sh -c 'echo deb http://jderobot.org/apt `lsb_release -cs` main > /etc/apt/sources.list.d/jderobot.list'

apt-key adv --keyserver ha.pool.sks-keyservers.net --recv-keys B0E7F58E82C8091DF945A0453DA08892EE69A25C

apt-get update

apt-get -y install jderobot
