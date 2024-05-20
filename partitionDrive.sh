#!/usr/bin/env bash

partfunc () {
sudo sfdisk "$drive" << EOF
label: GPT
,
EOF

sudo sfdisk "$drive" << EOF
, "$efipart"
, "$rootpart"
, "$homepart"
EOF
}




if ! command -v sfdisk &> /dev/null
then
	echo "Please install sfdisk"
fi

printf "This script will partition your drive for you, it will make 3 partitions, efi, root, and home."
printf "\n"
lsblk
printf "\n"
read -rp "Which drive would you like to Partition?: " drive
printf "When selecting partition sizes please format as followes 1G, 1.5G, 3G, 8.5G, 10G, 20G, "
printf "\n"
read -rp "What size efi partition would you like?: " efipart
read -rp "What size root partition would you like?: " rootpart
read -rp "What size home partition would you like?: " homepart

partfunc
printf "\n"
sleep 3
lsblk
