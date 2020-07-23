#!/bin/bash

LOCATION=$1

if [[ ${LOCATION} == "" ]]
then
	DIRS_LIST=(`ls backup`)
	i=0
	echo -en "id\tdir\n"
	for DIR in ${DIRS_LIST[@]}
	do
		echo -en "$i\t${DIR}\n"
		i=$(($i+1))
	done
fi
i=$(($i-1))

echo -en "\033[43m""please select backup data id:""\033[49m"
read
echo -en "\033[41m""start restore to date \"${DIRS_LIST[$REPLY]}\"""\033[49m"

ansible-playbook -i hosts --extra-vars "backup_dir=backup/${DIRS_LIST[$REPLY]}" restore.yml
