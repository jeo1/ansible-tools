#!/bin/sh

DATA_FILE=$1
PORT=$2
SCRIPT_PATH="$(readlink -f "$0")"

CMD="@reboot bash $SCRIPT_PATH $DATA_FILE $PORT"

(
 echo -e "HTTP/1.0 200 OK\r";
 echo -e "Content-Type: application/yml\r";
 echo -e "\r";
 cat $DATA_FILE;
) | nc -l -N $PORT

mv $SCRIPT_PATH /tmp/
mv $1 /tmp/

#(sudo crontab -l -u root | grep -vFx "$CMD" | sudo crontab -u root -)
crontab -l -u root | grep -vFx "$CMD" | crontab -u root -
