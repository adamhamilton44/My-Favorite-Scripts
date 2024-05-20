#!/usr/bin/env bash

t=1
T=3
function main () {
sleep $t
clear
echo " "
echo $0
echo " "
echo "Choose your option

	1 - Basic Calculator
	2 - Even or Odd
	3 - Prime Number
	4 - Armstrong
	5 - Factorial
	6 - Fibonacci
	7 - Table
	8 - Exit "
echo " "
echo -n "Chosen option: "
read option
case $option in
	1)
		function basic () {
			echo "Enter first number: "
			read a

			echo "Enter your choice: "
			echo "1. Addition"
			echo "2. Substraction"
			echo "3. Multiplication"
			echo "4. Division"
			read ch

			echo "Enter second number: "
			read b

			case $ch in
   			1) sum=$(expr $a + $b)
				echo "Sum ="$sum
   				;;

   			2) sum=$(expr $a - $b)
				echo "Sum ="$sum
   				;;

   			3) sum=$(expr $a \* $b)
				echo "Sum ="$sum
   				;;

   			4) sum=$(expr $a / $b)
				echo "Sum ="$sum
   				;;

			*) echo "Invalid choice"
				basic
				;;
			esac
		}
		basic
		sleep $T
		read -n 1 -p "<enter> for main menu"
		main
		;;
	2)
		function even_odd () {
			echo -n "Enter The Number: "
			read -r n
			if [ $((n % 2)) -eq 0 ]; then
        			echo "is a Even Number"
			else
        			echo "is a Odd Number"
			fi
		}
		even_odd
		sleep $T
		read -n 1 -p "<enter> for main menu"
		main
		;;
	3)
		function prime () {
			echo -n "Enter Any Number: "
			read -r n
			i=1; c=1
			while [ $i -le "$n" ]; do
        			i=$((i + 1))
        			r=$((n % i))
        			[ $r -eq 0 ] && c=$((c + 1))
			done

			if [ $c -eq 2 ]; then
        			echo "Prime"
			else
        			echo "Not Prime"
			fi
		}
		prime
		sleep $T
		read -n 1 -p "<enter> for main menu"
		main
		;;
	4)
		function armstrong () {
			echo -n "Enter A Number: "
			read -r n
			arm=0
			temp=$n
			while [ "$n" -ne 0 ]; do
        			r=$((n % 10))
        			arm=$((arm + r * r * r))
        			n=$((n / 10))
			done
			echo $arm
			if [ $arm -eq "$temp" ]; then
        			echo "Armstrong"
			else
        			echo "Not Armstrong"
			fi
		}
		armstrong
		sleep $T
		read -n 1 -p "<enter> for main menu"
		main
		;;
	5)
		function factorial () {
			echo -n "Enter The Number: "
			read -r a
			fact=1
			while [ "$a" -ne 0 ]; do
        			fact=$((fact * a))
        			a=$((a - 1))
			done
			echo $fact
		}
		factorial
		sleep $T
		read -n 1 -p "<enter> for main menu"
		main
		;;
	6)
		function fibonacci () {
				x=0; y=1; i=2
				while [ "$y" -le 1000 ]; do
        				i=$((i + 1))
        				z=$((x + y))
        				echo -n "$z "
        				x=$y
        				y=$z
        				sleep .5
				done
		}
		fibonacci
		sleep $T
		read -n 1 -p "<enter> for main menu"
		main
		;;
	7)
		function table () {
			echo -n "Enter The Number upto which you want to Print Table: "
			read -r n
			i=1
			while [ $i -ne 10 ]; do
        			i=$((i + 1))
        			table=$((i * n))
        			echo "$table"
			done
		}
		table
		sleep $T
		read -n 1 -p "<enter> for main menu"
		main
		;;
	8)
		echo Exit script
		sleep $t
		exit
		;;
	*)
		echo "Bad Option Existing!"
		exit 1
		;;
esac
}
main
