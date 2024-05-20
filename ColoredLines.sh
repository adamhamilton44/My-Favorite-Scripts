while :; do printf "\e[48;2;$((RANDOM % 256));$((RANDOM % 256));$((RANDOM % 256))m%*s\e[0m" $(tput cols) ""; sleep 0.1; done
