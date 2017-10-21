#!/bin/bash
/sys.sh

if [[ -n $BUILDER_UID ]] && [[ -n $BUILDER_GID ]]; then
    groupadd -o -g $BUILDER_GID $BUILDER_GROUP 2> /dev/null
    useradd -o -m -g $BUILDER_GID -u $BUILDER_UID $BUILDER_USER 2> /dev/null
    shopt -s dotglob

    chown -R $BUILDER_UID:$BUILDER_GID $HOME
    chown -R $BUILDER_UID:$BUILDER_GID /binary
    chpst -u :$BUILDER_UID:$BUILDER_GID /usr.sh
else
fi