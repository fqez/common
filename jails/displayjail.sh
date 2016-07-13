#!/bin/bash

filename="/tmp/rundisplay.sh"
auth="$(xauth list)"


echo "#!/bin/bash" > $filename

echo "xauth add $auth" >> $filename

echo "echo export DISPLAY=:0 >> /etc/bash.bashrc" >> $filename

sudo schroot -c $1 --directory / -u root /bin/bash "$filename"


