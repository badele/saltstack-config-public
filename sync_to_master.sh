#!/usr/bin/env bash

if [ "$1" == "" ]; then
    echo "Please set username@SaltMasterIP"
    exit 1
fi
SALT_DST=$1

# Conf
rsync -ar --exclude */.git "$PWD"/../saltstack-config-public/etc/ $SALT_DST:/etc/
rsync -ar --exclude */.git "$PWD"/../saltstack-config-private/etc/ $SALT_DST:/etc/


# Salt & Pillar
rsync -ar --exclude */.git --delete "$PWD"/../saltstack-config-public/srv/salt/ $SALT_DST:/srv/salt/public/
rsync -ar --exclude */.git --delete "$PWD"/../saltstack-config-private/srv/salt/ $SALT_DST:/srv/salt/private/
