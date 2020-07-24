#!/bin/bash

LOCATION=${1:-`date "+%F-%T"`}

echo -en "\033[41m""change location is \"${LOCATION}\"""\033[49m"

ansible-playbook -i hosts performance.yml
