#!/usr/bin/env bash
# ------------------------------------------------------------------------ #
# Script Name:   file_helper.sh 
# Description:   Help with permissions, extensions etc of files.
# Written by:    Adam Hamilton
# Maintenance:   Adam Hamilton
# ------------------------------------------------------------------------ #
# Usage:         
#       $ ./file_helper.sh
# ------------------------------------------------------------------------ #
# Bash Version:  
#              Bash 4.4.19
# ------------------------------------------------------------------------ #
rt=$(id -u)
[[ $rt -ne 0 ]] && echo "Please run as root to enable all features" && exit 1

function menuprincipal () {
clear
TIME=1
echo " "
echo $0
echo " "
echo "Choose an option below!

        1 - Check File Permissions
	2 - Change File Extensions
	3 - Count lines in a file
	4 - Convert file to Lower Case
       	5 - Convert file to Upper Case
	6 - Find and Delete a file
	7 - Find IP Address Information on anyone
	8 - Remove Empty files
	9 - Random Number Gen (RNG)
	0 - Exit"
echo " "
echo -n "Chosen option: "
read opcao
case $opcao in
	1)
		function file_permissions () {
			echo "Hey what's the File/Directory name (using the absolute path)?"
			read FILE

			if [ -e "$FILE" ]; then
        			if [ -f "$FILE" ]; then
                			echo "$FILE is a regular file."
        			fi
        			if [ -d "$FILE" ]; then
                			echo "$FILE is a directory."
        			fi
        			if [ -r "$FILE" ]; then
                			echo "$FILE is readable."
        			fi
        			if [ -w "$FILE" ]; then
                			echo "$FILE is writable."
        			fi
        			if [ -x "$FILE" ]; then
                			echo "$FILE is executable/searchable."
        			fi
			else
        			echo "$FILE does not exist"
        			exit 1
			fi
			sleep $TIME
}
		file_permissions
		read -n 1 -p "<Enter> for main menu"
		menuprincipal
		;;

	2)
		function file_extensions () {
			echo "Enter File extension to change."
			read old
			echo "Enter new File extension."
			read new 
			ls | cut -d. -f1 | xargs -I {} mv {}.$old {}.$new

		}
		file_extensions
		sleep $TIME
		read -n 1 -p "<Enter> for main menu"
		menuprincipal
		;;

	3)
		function lines () {
			wc -l ./*
		}
		lines
		sleep $TIME
		read -n 1 -p "<Enter> for main menu"
		menuprincipal
		;;
	
	4)
		function lowercase () {
		echo "Enter file name: "
		read -r file
		tr '[:upper:]' '[:lower:]' < "$file" 
		}
		lowercase
		sleep $TIME
		read -n 1 -p "<Enter> for main menu"
		menuprincipal
		;;

	5)
		function uppercase () {
		echo "Enter file name: "
                read -r file
                tr '[:lower:]' '[:upper:]' < "$file" 
		}
		uppercase
		sleep $TIME
		read -n 1 -p "<Enter> for main menu"
		menuprincipal
		;;

	6)
		function delete () {
		find . -type f | xargs du -sh | sort -hr | fzf -m --header "Select which ones to delete" --preview 'cat $(filename {})/.*' | awk '{print $1}' | xargs -r rm -rf
		}
		delete
		sleep $TIME
		read -n 1 -p "<Enter> for main menu"
		menuprincipal
		;;

	7)
		function ip () {
		link=$(echo "http://ip-api.com/json/"$ipa)
		data=$(curl $link -s) # -s for slient output
		status=$(echo $data | jq '.status' -r)

		echo "Enter IP Address to search: "
		read -r ipa
		if [[ $status == "success" ]]; then
			city=$(echo $data | jq '.city' -r)
        		regionName=$(echo $data | jq '.regionName' -r)
        		country=$( echo $data | jq '.country' -r)
        		echo $city, $regionName in $country. 
		fi
		}
		ip
		sleep $TIME
		read -n 1 -p "<Enter> for main menu"
		menuprincipal
		;;

	8)
		function empty () {
		echo "Enter full path to check for empty folder"
		read -r emptydir
		find $emptydir -type d -empty -exec rmdir {} \;
		}
		empty
		sleep $TIME
		read -n 1 -p "<Enter> for main menu"
                menuprincipal
		;;

	9)
		function random () {
		RR=$(head -c "5" /dev/urandom | base64)
		echo "Random Number is: $RR"
		}
		random
		sleep $TIME
		read -n 1 -p "<Enter> for main menu"
		menuprincipal
		;;

	0) 
	       echo Exiting the system...
       	       sleep $TIME
	       exit 0
	       ;;

	*)
		echo Invalid option, try again!
		;;
esac
}
menuprincipal
