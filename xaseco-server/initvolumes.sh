#!/bin/bash

function symlink() {
  if [ ! -f "$1" ]; then
    echo "symlink for $1"
    ln -s /xaseco/config_files/$(basename $1) $1;
  fi
}

# Config files
if [ "$(ls -A /xaseco/config_files)" ]; then
     echo "xaseco config files already setup"
else
  #Copy default file to xasec
  echo "move all files to new install"
  mv /xaseco/newinstall/* /xaseco/config_files/
fi

# Log file
if [ "$(ls -A /xaseco/log_files)" ]; then
  echo "xaseco log files already setup"
else
  echo "touch log files"
  touch /xaseco/log_files/logfile.txt
  echo "create symlinks"
  ln -s /xaseco/log_files/logfile.txt /xaseco/logfile.txt
fi

#Create symlinks if necessary
symlink /xaseco/access.xml
symlink /xaseco/bannedips.xml
symlink /xaseco/matchsave.xml
symlink /xaseco/adminops.xml
symlink /xaseco/config.xml
symlink /xaseco/musicserver.xml
symlink /xaseco/rasp.xml
symlink /xaseco/autotime.xml
symlink /xaseco/dedimania.xml
symlink /xaseco/localdatabase.xml
symlink /xaseco/plugins.xml
symlink /xaseco/includes/rasp.settings.php
symlink /xaseco/includes/votes.config.php
symlink /xaseco/includes/jfreu.config.php
symlink /xaseco/includes/html.tpl
symlink /xaseco/includes/text.tpl
