#!/usr/bin/env bash

printf "%d " "$1" "$2" "$3" "$4" "$5"

echo "obase=10; ibase=16; $1" | bc
