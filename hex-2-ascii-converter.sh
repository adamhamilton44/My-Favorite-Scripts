#!/bin/bash

printf "Character\tDecimal\tHexadecimal\n"
for ((i = 33; i < 127; i++)); do
    printf "%s\t\t%d\t\x$(printf "%x" $i)\n" "$(printf "\\$(printf "%o" $i)")" "$i"
done
