#!/bin/bash

#############################
# Author: Adam Hamilton
# Created Date: Friday-Dec-08-2023
# Time: 11:19-pm
# Purpose: This script does ?
# Version: v1.0
#############################


check_for_root() {
	if [ "$EUID" -ne 0 ]
		then echo -e "\n\n Script must be run with sudo check_for_root.sh or as root \n"
		exit
    	else echo -e "Nice job you ARE root"
	sleep 5
	fi
}
check_for_root


###START OF SCRIPT###

echo "Please type the full path to the ISO file: "
read infile
echo "Please type the full path to the USB directory including a name for the executable"
echo "Example /media/root/kali.iso : "
read outfile

eval dd if="$infile" of="$outfile" bs=4M status=progres

###END OF SCRIPT###

