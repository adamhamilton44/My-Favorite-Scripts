#!/usr/bin/gawk -f

# Usage is cat <path>/to-text-file | letter_frequency.awk
# this script only counts small letters use tr if capital letters are in file

BEGIN { LETTERS = "abcdefghijklmnopqrstuvwxyz" }

{
	len = length($0); for (i = 1; i <= len; i++) {
		c = substr($0, i, 1);
		ltr = index(LETTERS, c);

		if (ltr > 0) {
			++count[ltr];
		}
	}
}

END {
	for ( ltr = 1; ltr <= 26; ltr++) {
		print substr(LETTERS, ltr, 1), count[ltr] ;
	}
}
