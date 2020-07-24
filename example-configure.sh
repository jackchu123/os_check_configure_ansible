#!/bin/bash

LOCATION=${1:-`date "+%F-%T"`}

echo -en "\033[41m""save location is \"${LOCATION}\"""\033[49m"

[ ! -f ./backup ] && mkdir backup

ansible -i hosts -m setup --tree=/tmp/host_data 

ll /usr/bin/ansible-cmdb
if [ $? = 0 ]; then
    ansible-cmdb /tmp/host_data > ./host_data_${LOCATION}.html  
else
    pip install ansible-cmdb
    ansible-cmdb /tmp/host_data > ./host_data_${LOCATION}.html  
fi 
