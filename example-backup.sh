#!/bin/bash

LOCATION=${1:-`date "+%F-%T"`}

echo -en "\033[41m""save location is \"${LOCATION}\"""\033[49m"

ansible-playbook -i hosts --extra-vars "backup_dir=backup/${LOCATION}" backup.yml
