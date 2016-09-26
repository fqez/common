#!/bin/bash

filename='/tmp/setup.sh'

echo '#!/bin/bash' > $filename

echo 'apt-get -y install bash-completion software-properties-common nano' >> $filename

echo 'ver=$(lsb_release -cs)'  >> $filename

echo 'echo deb http://es.archive.ubuntu.com/ubuntu/ $ver universe >> /etc/apt/sources.list'  >> $filename

echo 'echo deb http://es.archive.ubuntu.com/ubuntu/ $ver multiverse >> /etc/apt/sources.list' >> $filename
echo 'echo deb http://es.archive.ubuntu.com/ubuntu/ $ver-updates multiverse >> /etc/apt/sources.list' >> $filename

echo 'apt-key adv --keyserver keyserver.ubuntu.com --recv 3E5C1192' >> $filename

echo 'apt-get update' >> $filename

echo 'apt-get -y install xauth bash-completion' >> $filename

echo 'echo "# enable bash completion in interactive shells" >> /etc/bash.bashrc' >> $filename
echo 'echo "if ! shopt -oq posix; then">> /etc/bash.bashrc' >> $filename
echo 'echo "  if [ -f /usr/share/bash-completion/bash_completion ]; then">> /etc/bash.bashrc' >> $filename
echo 'echo "  . /usr/share/bash-completion/bash_completion">> /etc/bash.bashrc' >> $filename
echo 'echo " elif [ -f /etc/bash_completion ]; then">> /etc/bash.bashrc' >> $filename
echo 'echo "   . /etc/bash_completion">> /etc/bash.bashrc' >> $filename
echo 'echo "fi">> /etc/bash.bashrc' >> $filename
echo 'echo "fi">> /etc/bash.bashrc' >> $filename

sudo schroot -c $1 --directory / -u root /bin/bash "$filename"



