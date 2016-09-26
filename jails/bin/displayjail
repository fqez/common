#!/bin/bash

filename="/tmp/rundisplay.sh"
auth="$(xauth list)"
host="$(lsb_release -rs)"

if [ $host == "16.04" ]; then
	echo $DISPLAY
	cond="s/:/$DISPLAY/g"
	auth2=$(echo $auth | sed $cond)
	auth=$auth2

fi
echo "#!/bin/bash" > $filename

echo "xauth add $auth" >> $filename

echo "echo export DISPLAY=$DISPLAY >> /etc/bash.bashrc" >> $filename

sudo schroot -c $1 --directory / -u root /bin/bash "$filename"


