#!/usr/bin/env bash

DST=$1 # username@IP

if [ "$1" == "" ]; then
    echo "Please set username@hotname"
    exit 1
fi

#Copy this account SSH key to the minion server
ssh-copy-id $DST

# Patch the minion server
scp minion.patch $DST:/usr/lib/python2.7/dist-packages/salt/
ssh $DST "cd /usr/lib/python2.7/dist-packages/salt && patch < minion.patch && /etc/init.d/salt-minion restart"
