#!/usr/bin/env bash

# Export variables in your .bashrc or .zshrc
# $HOME_PROJECTS=~/projects
# $SALT_DST=username@hostname

echo $SALT_DST
echo $HOME_PROJECTS

# Conf
rsync -ar --exclude */.git $HOME_PROJECTS/saltstack-config-private/etc/ $SALT_DST:/etc/
rsync -ar --exclude */.git $HOME_PROJECTS/saltstack-config-private/etc/ $SALT_DST:/etc/


# Salt & Pillar
rsync -ar --exclude */.git --delete $HOME_PROJECTS/saltstack-config-public/srv/salt/ $SALT_DST:/srv/salt/public/
rsync -ar --exclude */.git --delete $HOME_PROJECTS/saltstack-config-private/srv/salt/ $SALT_DST:/srv/salt/private/
