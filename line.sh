#!/bin/bash
# program that just prints the variale of T all the way across screen


R= T=+
let r=$(set -- $(stty size);echo $2)\*2

while
	let 'r=r/2'
do
	let 'r&1'  && R="$R$T"
	T="$T$T"
done
echo "$R"
