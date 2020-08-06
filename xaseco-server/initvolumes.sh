#!/bin/bash

if [ "$(ls -A /xaseco/config_files)" ]; then
     echo "xaseco already setup"
else
    #Copy default file to xasec
    echo "move all files to new install"
    mv /xaseco/newinstall/* /xaseco/config_files/
    echo "touch log files"
    touch /xaseco/log_files/logfile.txt
    touch /xaseco/log_files/aseco.log
    echo "create symlinks"
    for f in /xaseco/config_files/*.xml;  do ln -s $f /xaseco/$(basename $f); done;
    for f in /xaseco/config_files/*.php;  do ln -s $f /xaseco/includes/$(basename $f); done;
    for f in /xaseco/config_files/*.tpl;  do ln -s $f /xaseco/includes/$(basename $f); done;
    ln -s /xaseco/log_files/logfile.txt /xaseco/logfile.txt
    ln -s /xaseco/log_files/aseco.log /xaseco/aseco.log
fi
