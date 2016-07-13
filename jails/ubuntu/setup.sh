#!/bin/bash

filename='/tmp/setup.sh'

echo '#!/bin/bash' > $filename

echo 'apt-get -y install software-properties-common nano' >> $filename

echo 'ver=$(lsb_release -cs)'  >> $filename

echo 'echo deb http://es.archive.ubuntu.com/ubuntu/ $ver universe >> /etc/apt/sources.list'  >> $filename
echo 'echo deb http://es.archive.ubuntu.com/ubuntu/ $ver-updates universe >> /etc/apt/sources.list' >> $filename

echo 'echo deb http://es.archive.ubuntu.com/ubuntu/ $ver multiverse >> /etc/apt/sources.list' >> $filename
echo 'echo deb http://es.archive.ubuntu.com/ubuntu/ $ver-updates multiverse >> /etc/apt/sources.list' >> $filename

echo 'echo deb http://extras.ubuntu.com/ubuntu $ver main >> /etc/apt/sources.list' >> $filename

echo 'apt-key adv --keyserver keyserver.ubuntu.com --recv 3E5C1192' >> $filename

echo 'apt-get update' >> $filename

echo 'apt-get -y install xauth' >> $filename

sudo schroot -c $1 --directory / -u root /bin/bash "$filename"



