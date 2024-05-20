#!/bin/bash
 
bold=`tput bold`
normal=`tput sgr0`
green_plus='\e[00;32m[+]\e[00m'

if [ $# -ne 2 ] ; then
        echo "No directory choosen."
        echo "Using `pwd`"
        current_dir=`pwd` 
	echo "No Password choosen exiting script"
	echo "Usage is $0 path_to_zip passwd_to_use"
	echo "Example: $0 /home/user/Documents infected"
	exit 2
fi

find $pwd -maxdepth 1 -type d | while read folder; do
	mkdir -p "Compressed/$folder"
	zip -r --password "$2" "Compressed/$folder/$folder.zip" "$folder" > /dev/null
	sha256sum "Compressed/$folder/$folder.zip" > "Compressed/$folder/$folder.sha256"
	md5sum "Compressed/$folder/$folder.zip" > "Compressed/$folder/$folder.md5"
	echo "$2" > "Compressed/$folder/$folder.pass"
	echo -e "$green_plus   $folder compressed. "
	echo -e "$green_plus   Remember that you still need to create index.log :) "
done
