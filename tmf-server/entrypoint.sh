#!/bin/sh

# Copy new install
if [ "$(ls -A /tmf/GameData)" ]; then
     echo "/tmf/GameData already setup"
else
    #Copy default file to GameData
    cp -R /tmf/GameData_NewInstall/* /tmf/GameData/
fi

# Setup

GROUPNAME="trackmania"
USERNAME="trackmania"

LUID=${LOCAL_UID:-0}
LGID=${LOCAL_GID:-0}

# Step down from host root to well-known nobody/nogroup user

if [ $LUID -eq 0 ]
then
    LUID=65534
fi
if [ $LGID -eq 0 ]
then
    LGID=65534
fi

# Create user and group

groupadd -o -g $LGID $GROUPNAME #>/dev/null 2>&1 ||
groupmod -o -g $LGID $GROUPNAME #>/dev/null 2>&1
useradd -o -m -u $LUID -g $GROUPNAME -s /bin/false $USERNAME #>/dev/null 2>&1 ||
usermod -o -u $LUID -g $GROUPNAME -s /bin/false $USERNAME #>/dev/null 2>&1

# The rest...

chown -R $USERNAME:$GROUPNAME /tmf

# Start exec with user $USERNAME:$GROUPNAME

exec gosu  $USERNAME:$GROUPNAME "$@"
