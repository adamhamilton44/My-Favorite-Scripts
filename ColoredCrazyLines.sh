while :; do for ((i=0;i<$(tput cols);i++));do clear;for ((j=0;j<$(tput lines);j++));do printf "\e[48;5;$((RANDOM%256))m%*s\e[0m\n" $(((j+i)%2?$(tput cols)-i:i)) "";done;sleep 0.05;done;done
