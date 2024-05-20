#!/bin/bash
[[ "$1" ]] &&
pkg="$(aptitude search "$1"|fzf --prompt "Select Packages: " -m|awk '{print $2}'|tr "\n" " ")" ||
pkg="$(aptitude search *|fzf --prompt "Select Packages: " -m|awk '{print $2}'|tr "\n" " ")" 



[[ "$pkg" ]] || exit 1

echo "============== Installing $pkg ================"
sudo apt install $pkg

export PATH=$PATH

