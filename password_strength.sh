[00;39m[00;34m#!/usr/bin/env bash[m
[00;39m
[00;39mred[00;39m=[m[00;39m$[00;31m'\e[1;31m'[m[00;39m
[00;39mgreen[00;39m=[m[00;39m$[00;31m'\e[1;32m'[m[00;39m
[00;39mblue[00;39m=[m[00;39m$[00;31m'\e[1;34m'[m[00;39m
[00;39mmagenta[00;39m=[m[00;39m$[00;31m'\e[1;35m'[m[00;39m
[00;39mcyan[00;39m=[m[00;39m$[00;31m'\e[1;36m'[m[00;39m
[00;39m[00;32mlp[m[00;39m[00;39m=[m[00;39m[00;31m'\e[0;35m'[m[00;39m
[00;39mbold[00;39m=[m[00;39m$[00;31m'\e[1m'[m[00;39m
[00;39mundline[00;39m=[m[00;39m$[00;31m'\e[21m'[m[00;39m
[00;39mr[00;39m=[m[00;39m$[00;31m'\e[0m'[m[00;39m
[00;39mg1[00;39m=[m[00;39m[00;31m'\e[1;33m[+1]\e[0m'[m[00;39m
[00;39mg2[00;39m=[m[00;39m[00;31m'\e[1;33m[+2]\e[0m'[m[00;39m
[00;39mg3[00;39m=[m[00;39m[00;31m'\e[1;33m[+3]\e[0m'[m[00;39m
[00;39mg4[00;39m=[m[00;39m[00;31m'\e[1;33m[+4]\e[0m'[m[00;39m
[00;39mg10[00;39m=[m[00;39m[00;31m'\e[1;33m[+10 PERFECT]\e[0m'[m[00;39m
[00;39mrm1[00;39m=[m[00;39m[00;31m'\e[1;31m[-1]\e[0m'[m[00;39m
[00;39mrm0[00;39m=[m[00;39m[00;31m'\e[1;31m[0]\e[0m'[m[00;39m
[00;39mfb[00;39m=[m[00;39m[00;31m'\e[1;31m[\e[5;31m!!!!\e[0m\e[1;31m]\e[0m'[m[00;39m
[00;39mpassfound[00;39m=[m[00;39m[00;31m'\e[1;31m[\e[5;31mPassword Found\e[0m\e[1;31m]\e[0m'[m[00;39m
[00;39mwarning[00;39m=[m[00;39m[00;31m'\e[1;31m[\e[5;31m!! WARNING !!\e[0m\e[1;31m]\e[0m'[m[00;39m
[00;39m[00;34m# Inform the user about the scoring system[m
[00;39m[00;32mecho -e[m [00;39m[00;31m"You will be scored on a[m [00;35m$green[m [00;31m[m[00;35m$bold[m[00;31m( 1 - 10 )[m[00;35m$r[m [00;31msystem[m [00;35m$red[m [00;31m1=AWFUL,[m [00;35m$blue[m [00;31m5=OK,[m [00;35m$cyan[m [00;31m10=AWESOME[m [00;35m$r[m[00;31m"[m[00;39m
[00;39m
[00;39m[00;34m# Read password from the user[m
[00;39m[00;32mecho -e[m [00;39m[00;31m"[m[00;35m$magenta[m [00;31mYour Password[m [00;35m$red[m [00;31mWILL NOT[m [00;35m$r[m [00;31m[m[00;35m$magenta[m [00;31mbe shown when typing it[m [00;35m$r[m[00;31m"[m[00;39m
[00;39m[00;32mread -sp[m [00;39m[00;31m"Enter your super secret password: "[m[00;39m password
[00;39m[00;32mecho[m
[00;39m[00;34m# Initialize password score and feedback[m
[00;39mscore[00;39m=[m[00;39m[00;34m0[m
[00;39mfeedback[00;39m=[m[00;39m[00;31m""[m[00;39m
[00;39m[00;34m# Path to the wordlist file[m
[00;39mwordlist1[00;39m=[m[00;39m[00;31m"/usr/share/wordlists/rockyou.txt"[m[00;39m
[00;39mwordlist2[00;39m=[m[00;39m[00;31m"/usr/share/wordlists/seclists/Passwords/xato-net-10-million-passwords.txt"[m[00;39m
[00;39m[00;34m# Check if the password is in the wordlist[m
[00;39m[00;33mif[m  [00;39m[00;32mgrep[m [00;39m[00;32m--no-ignore-case -q[m [00;39m[00;31m"^[m[00;35m$password[m[00;31m$"[m[00;39m [00;31m"[m[00;35m$wordlist1[m[00;31m"[m[00;39m [00;39m||[m [00;39m[00;32mgrep[m [00;39m[00;32m--no-ignore-case -q[m [00;39m[00;31m"^[m[00;35m$password[m[00;31m$"[m[00;39m [00;31m"[m[00;35m$wordlist2[m[00;31m"[m[00;39m  [00;39m;[m [00;39m[00;33mthen[m
[00;39m    [00;32mecho -e[m [00;39m[00;31m"[m[00;35m$passfound[m [00;31m-----[m [00;35m$warning[m [00;31m------[m [00;35m$passfound[m [00;31m[m[00;35m$r[m[00;31m"[m[00;39m
[00;39m    [00;32mecho -e[m [00;39m[00;31m"[m[00;35m$red[m [00;31m[m[00;35m$undline[m [00;31mYour password was found in a well known password file used by hackers[m  [00;35m$r[m[00;31m"[m[00;39m
[00;39m    [00;32mecho -e[m [00;39m[00;31m"[m[00;35m$red[m [00;31m[m[00;35m$undline[m [00;31mIt is vital you change this password if you are using it![m [00;35m$r[m[00;31m"[m[00;39m
[00;39m    [00;32mecho -e[m [00;39m[00;31m"Final score is[m [00;35m$rm0[m[00;31m"[m[00;39m
[00;39m    [00;32mexit[m [00;39m[00;34m0[m
[00;39m[00;33mfi[m
[00;39m
[00;39m[00;34m# Check length of the password and assign initial score[m
[00;39mlength[00;39m=[m[00;39m[00;32m${#password}[m
[00;39m[00;33mif[m [00;39m[00;39m(([m [00;39mlength [00;39m>=[m [00;39m[00;34m8[m [00;39m[00;39m&&[m [00;39mlength [00;39m<=[m [00;39m[00;34m10[m [00;39m[00;39m));[m [00;39m[00;33mthen[m
[00;39m    score[00;39m=[m[00;39m[00;32m$((score + 1)[m[00;39m[00;39m)[m
[00;39m    feedback[00;39m+=[m[00;39m[00;31m"Your Password length is minimum[m [00;35m$g1[m [00;31mpoints.[m [00;35m\n[m[00;31m"[m[00;39m
[00;39m[00;33melif[m [00;39m[00;39m(([m [00;39mlength [00;39m>=[m [00;39m[00;34m11[m [00;39m[00;39m&&[m [00;39mlength [00;39m<=[m [00;39m[00;34m12[m [00;39m[00;39m));[m [00;39m[00;33mthen[m
[00;39m    score[00;39m=[m[00;39m[00;32m$((score + 2)[m[00;39m[00;39m)[m
[00;39m    feedback[00;39m+=[m[00;39m[00;31m"Your Password length is good[m [00;35m$g2[m [00;31mpoints.[m [00;35m\n[m[00;31m"[m[00;39m
[00;39m[00;33melif[m [00;39m[00;39m(([m [00;39mlength [00;39m>=[m [00;39m[00;34m13[m [00;39m[00;39m&&[m [00;39mlength [00;39m<=[m [00;39m[00;34m14[m [00;39m[00;39m));[m [00;39m[00;33mthen[m
[00;39m    score[00;39m=[m[00;39m[00;32m$((score + 3)[m[00;39m[00;39m)[m
[00;39m    feedback[00;39m+=[m[00;39m[00;31m"Your Password length is very good[m [00;35m$g3[m [00;31mpoints.[m [00;35m\n[m[00;31m"[m[00;39m
[00;39m[00;33melif[m [00;39m[00;39m(([m [00;39mlength [00;39m>=[m [00;39m[00;34m15[m [00;39m[00;39m));[m [00;39m[00;33mthen[m
[00;39m    score[00;39m=[m[00;39m[00;32m$((score + 4)[m[00;39m[00;39m)[m
[00;39m    feedback[00;39m+=[m[00;39m[00;31m"Your Password length is AWESOME nice job[m [00;35m$g4[m [00;31mpoints.[m[00;35m\n[m[00;31m"[m[00;39m
[00;39m[00;33melse[m
[00;39m    score[00;39m=[m[00;39m[00;32m$((score - 1)[m[00;39m[00;39m)[m
[00;39m    feedback[00;39m+=[m[00;39m[00;31m"Increase password length to at least 8 characters[m [00;35m$rm0[m [00;31mpoint.[m [00;35m\n[m[00;31m"[m[00;39m
[00;39m[00;33mfi[m
[00;39m[00;34m# Check for capital letters and adjust score[m
[00;39mnum_capitals[00;39m=[m[00;39m[00;32m$(echo "$password" | grep -o '[A-Z]' | wc -l)[m
[00;39m[00;33mif[m [00;39m[00;39m(([m [00;39mnum_capitals [00;39m>=[m [00;39m[00;34m2[m [00;39m[00;39m));[m [00;39m[00;33mthen[m
[00;39m    score[00;39m=[m[00;39m[00;32m$((score + 2)[m[00;39m[00;39m)[m
[00;39m    feedback[00;39m+=[m[00;39m[00;31m"Your use of capital letters is good[m [00;35m$g2[m [00;31mpoints.[m [00;35m\n[m[00;31m"[m[00;39m
[00;39m[00;33melif[m [00;39m[00;39m(([m [00;39mnum_capitals [00;39m==[m [00;39m[00;34m1[m [00;39m[00;39m));[m [00;39m[00;33mthen[m
[00;39m    score[00;39m=[m[00;39m[00;32m$((score + 1)[m[00;39m[00;39m)[m
[00;39m    feedback[00;39m+=[m[00;39m[00;31m"Your use of capital letters is minimum[m [00;35m$g1[m [00;31mpoint.[m [00;35m\n[m[00;31m"[m[00;39m
[00;39m[00;33melse[m
[00;39m    feedback[00;39m+=[m[00;39m[00;31m"Add at least one capital letter[m [00;35m$rm0[m [00;31mpoints.[m [00;35m\n[m[00;31m"[m[00;39m
[00;39m[00;33mfi[m
[00;39m
[00;39m[00;34m# Check for numbers and adjust score[m
[00;39mnum_count[00;39m=[m[00;39m[00;32m$(echo "$password" | grep -o '[0-9]' | wc -l)[m
[00;39m[00;33mif[m [00;39m[00;39m(([m [00;39mnum_count [00;39m>=[m [00;39m[00;34m2[m [00;39m[00;39m));[m [00;39m[00;33mthen[m
[00;39m    score[00;39m=[m[00;39m[00;32m$((score + 2)[m[00;39m[00;39m)[m
[00;39m    feedback[00;39m+=[m[00;39m[00;31m"Your use of numbers is above average, nice job[m [00;35m$g2[m [00;31mpoints.[m [00;35m\n[m[00;31m"[m[00;39m
[00;39m[00;33melif[m [00;39m[00;39m(([m [00;39mnum_count [00;39m==[m [00;39m[00;34m1[m [00;39m[00;39m));[m [00;39m[00;33mthen[m
[00;39m    score[00;39m=[m[00;39m[00;32m$((score + 1)[m[00;39m[00;39m)[m
[00;39m    feedback[00;39m+=[m[00;39m[00;31m"Your use of numbers is average[m [00;35m$g1[m [00;31mpoint.[m [00;35m\n[m[00;31m"[m[00;39m
[00;39m[00;33melse[m
[00;39m    feedback[00;39m+=[m[00;39m[00;31m"[m[00;35m$rms[m [00;31mAdd at least one number[m [00;35m$rm0[m [00;31mpoints.[m [00;35m\n[m[00;31m"[m[00;39m
[00;39m[00;33mfi[m
[00;39m
[00;39m[00;34m# Check for special characters and adjust score[m
[00;39mspecial_count[00;39m=[m[00;39m[00;32m$(echo "$password" | grep -o '[^a-zA-Z0-9]' | wc -l)[m
[00;39m[00;33mif[m [00;39m[00;39m(([m [00;39mspecial_count [00;39m>=[m [00;39m[00;34m5[m [00;39m[00;39m));[m [00;39m[00;33mthen[m
[00;39m    score[00;39m=[m[00;39m[00;32m$((score + 3)[m[00;39m[00;39m)[m
[00;39m    feedback[00;39m+=[m[00;39m[00;31m"Your use of special charcaters is AWESOME[m [00;35m$g3[m [00;31mpoints.[m [00;35m\n[m[00;31m"[m[00;39m
[00;39m[00;33melif[m [00;39m[00;39m(([m [00;39mspecial_count [00;39m>=[m [00;39m[00;34m2[m [00;39m[00;39m));[m [00;39m[00;33mthen[m
[00;39m    score[00;39m=[m[00;39m[00;32m$((score + 2)[m[00;39m[00;39m)[m
[00;39m    feedback[00;39m+=[m[00;39m[00;31m"Your use of special charcaters is good[m [00;35m$g2[m [00;31mpoints.[m [00;35m\n[m[00;31m"[m[00;39m
[00;39m[00;33melif[m [00;39m[00;39m(([m [00;39mspecial_count [00;39m==[m [00;39m[00;34m1[m [00;39m[00;39m));[m [00;39m[00;33mthen[m
[00;39m    score[00;39m=[m[00;39m[00;32m$((score + 1)[m[00;39m[00;39m)[m
[00;39m    feedback[00;39m+=[m[00;39m[00;31m"Your use of special charcaters is ok but needs work[m [00;35m$g1[m [00;31mpoint.[m [00;35m\n[m[00;31m"[m[00;39m
[00;39m[00;33melse[m
[00;39m    feedback[00;39m+=[m[00;39m[00;31m"Add at least one special character[m [00;35m$rm0[m [00;31mpoints[m [00;35m\n[m[00;31m"[m[00;39m
[00;39m[00;33mfi[m
[00;39m
[00;39m[00;34m# Substitution checks and penalize if found[m
[00;39m[00;33mif[m [00;39m[00;39m[[[m [00;39m[00;31m"[m[00;35m$password[m[00;31m"[m[00;39m [00;39m=[m[00;39m~ ^[00;39m[[m[00;39mA[00;32m-Z[m[00;39m[00;39m] ]];[m [00;39m[00;33mthen[m
[00;39m    score[00;39m=[m[00;39m[00;32m$((score - 1)[m[00;39m[00;39m)[m
[00;39m    feedback[00;39m+=[m[00;39m[00;31m"Avoid using a capital letter as the first character[m [00;35m$rm1[m [00;31mpoint.[m [00;35m\n[m[00;31m"[m[00;39m
[00;39m[00;33mfi[m
[00;39m
[00;39m[00;34m# Penalize if '0' follows a letter or another number[m
[00;39m[00;33mif[m [00;39m[00;39m[[[m [00;39m[00;31m"[m[00;35m$password[m[00;31m"[m[00;39m [00;39m=[m[00;39m~ [00;39m[[m[00;39ma[00;32m-zA-Z[m[00;39m[00;39m][m[00;39m[00;34m0[m[00;39m[00;39m[[m[00;39ma[00;32m-zA-Z[m[00;39m[00;39m] ]];[m [00;39m[00;33mthen[m
[00;39m    score[00;39m=[m[00;39m[00;32m$((score - 1)[m[00;39m[00;39m)[m
[00;39m    feedback[00;39m+=[m[00;39m[00;31m"Avoid using '0' in place of 'O' hackers know this also[m [00;35m$rm1[m [00;31mpoint.[m [00;35m\n[m[00;31m"[m[00;39m
[00;39m[00;33mfi[m
[00;39m
[00;39m[00;34m# Penalize if '1' follows a letter[m
[00;39m[00;33mif[m [00;39m[00;39m[[[m [00;39m[00;31m"[m[00;35m$password[m[00;31m"[m[00;39m [00;39m=[m[00;39m~ [00;39m[[m[00;39ma[00;32m-zA-Z[m[00;39m[00;39m][m[00;39m[00;34m1[m[00;39m[00;39m[[m[00;39ma[00;32m-zA-Z[m[00;39m[00;39m] ]];[m [00;39m[00;33mthen[m
[00;39m    score[00;39m=[m[00;39m[00;32m$((score - 1)[m[00;39m[00;39m)[m
[00;39m    feedback[00;39m+=[m[00;39m[00;31m"Avoid using '1' instead of 'I' hackers know this trick[m [00;35m$rm1[m [00;31mpoint. /n"[m[00;39m
[00;39m[00;33mfi[m
[00;39m
[00;39m[00;34m# Penalize if '@' follows a letter[m
[00;39m[00;33mif[m [00;39m[00;39m[[[m [00;39m[00;31m"[m[00;35m$password[m[00;31m"[m[00;39m [00;39m=[m[00;39m~ [00;39m[[m[00;39ma[00;32m-zA-Z[m[00;39m[00;39m][m[00;39m\@[00;39m[[m[00;39ma[00;32m-zA-Z[m[00;39m[00;39m] ]];[m [00;39m[00;33mthen[m
[00;39m    score[00;39m=[m[00;39m[00;32m$((score - 1)[m[00;39m[00;39m)[m
[00;39m    feedback[00;39m+=[m[00;39m[00;31m"Avoid using '@' instead of 'A' hackers know you do this and they easily adjust there passwords[m [00;35m$rm1[m [00;31mpoint.[m [00;35m\n[m[00;31m"[m[00;39m
[00;39m[00;33mfi[m
[00;39m
[00;39m[00;34m# Penalize if '$' is used as a 'S' or follows a number[m
[00;39m[00;33mif[m [00;39m[00;39m[[[m [00;39m[00;31m"[m[00;35m$password[m[00;31m"[m[00;39m [00;39m=[m[00;39m~ [00;39m[[m[00;39ma[00;32m-zA-Z[m[00;39m[00;39m][m[00;39m\$[00;39m[[m[00;39ma[00;32m-zA-Z0-9[m[00;39m[00;39m] ]];[m [00;39m[00;33mthen[m
[00;39m    score[00;39m=[m[00;39m[00;32m$((score - 1)[m[00;39m[00;39m)[m
[00;39m    feedback[00;39m+=[m[00;39m[00;31m"Avoid using '$' instead of 'S' everyone knows that trick, also dont add a '$' followed my a number[m [00;35m$rm1[m [00;31mpoint.[m [00;35m\n[m[00;31m"[m[00;39m
[00;39m[00;33mfi[m
[00;39m
[00;39m[00;34m# Penalize if '3' is used as a 'E' or follows a number[m
[00;39m[00;33mif[m [00;39m[00;39m[[[m [00;39m[00;31m"[m[00;35m$password[m[00;31m"[m[00;39m [00;39m=[m[00;39m~ [00;39m[[m[00;39ma[00;32m-zA-Z[m[00;39m[00;39m][m[00;39m[00;34m3[m[00;39m[00;39m[[m[00;39ma[00;32m-zA-Z[m[00;39m[00;39m] ]];[m [00;39m[00;33mthen[m
[00;39m    score[00;39m=[m[00;39m[00;32m$((score - 1)[m[00;39m[00;39m)[m
[00;39m    feedback[00;39m+=[m[00;39m[00;31m"Avoid using '3' instead of 'E' hackers know this already[m [00;35m$rm1[m [00;31mpoint.[m [00;35m\n[m[00;31m"[m[00;39m
[00;39m[00;33mfi[m
[00;39m
[00;39m[00;34m# Ensure the score does not exceed the maximum of 10[m
[00;39m[00;33mif[m [00;39m[00;39m(([m [00;39mscore [00;39m>[m [00;39m[00;34m10[m [00;39m[00;39m));[m [00;39m[00;33mthen[m
[00;39m    score[00;39m=[m[00;39m[00;34m10[m
[00;39m[00;33mfi[m
[00;39m
[00;39m[00;34m# Ensure the score does not go below 1[m
[00;39m[00;33mif[m [00;39m[00;39m(([m [00;39mscore [00;39m<[m [00;39m[00;34m1[m [00;39m[00;39m));[m [00;39m[00;33mthen[m
[00;39m    score[00;39m=[m[00;39m[00;34m1[m
[00;39m[00;33mfi[m
[00;39m
[00;39m[00;34m# Provide feedback if the score is less than 10[m
[00;39m[00;33mif[m [00;39m[00;39m(([m [00;39mscore [00;39m<[m [00;39m[00;34m10[m [00;39m[00;39m));[m [00;39m[00;33mthen[m
[00;39m    [00;32mecho -e[m [00;39m[00;31m"[m[00;35m$cyan[m [00;31m[m[00;35m$bold[m [00;31mSuggestions to improve your password strength:[m [00;35m$r[m[00;31m"[m[00;39m
[00;39m    [00;32mecho[m [00;39m[00;31m""[m[00;39m
[00;39m    [00;32mecho -e[m [00;39m[00;31m"[m[00;35m$feedback[m[00;31m"[m[00;39m
[00;39m    [00;32mecho[m [00;39m[00;31m""[m[00;39m
[00;39m[00;33melse[m
[00;39m    [00;32mecho -e[m [00;39m[00;31m"[m[00;35m$g10[m [00;31mYour password is AWESOME![m [00;35m$g10[m[00;31m"[m[00;39m
[00;39m    [00;32mecho[m [00;39m[00;31m""[m[00;39m
[00;39m[00;33mfi[m
[00;39m
[00;39m[00;34m# Output the password strength score[m
[00;39m[00;32mecho -e[m [00;39m[00;31m"Password final strength score is:[m [00;35m$lp[m [00;31m[m[00;35m$bold[m [00;31m[m[00;35m$score[m [00;31m[m[00;35m$r[m[00;31m"[m[00;39m
[00;39m[00;33mif[m [00;39m[00;39m(([m [00;39mscore [00;39m>=[m [00;39m[00;34m2[m [00;39m[00;39m&&[m [00;39mscore [00;39m<=[m [00;39m[00;34m4[m [00;39m[00;39m));[m [00;39m[00;33mthen[m
[00;39m    [00;32mecho -e[m [00;39m[00;31m"[m[00;35m$magenta[m [00;31mYou get a D"[m[00;39m
[00;39m[00;33melif[m [00;39m[00;39m(([m [00;39mscore [00;39m>=[m [00;39m[00;34m5[m [00;39m[00;39m&&[m [00;39mscore [00;39m<=[m [00;39m[00;34m6[m [00;39m[00;39m));[m [00;39m[00;33mthen[m
[00;39m    [00;32mecho -e[m [00;39m[00;31m"[m[00;35m$cyan[m [00;31mYou get a C"[m[00;39m
[00;39m[00;33melif[m [00;39m[00;39m(([m [00;39mscore [00;39m>=[m [00;39m[00;34m7[m [00;39m[00;39m&&[m [00;39mscore [00;39m<=[m [00;39m[00;34m8[m [00;39m[00;39m));[m [00;39m[00;33mthen[m
[00;39m    [00;32mecho -e[m [00;39m[00;31m"[m[00;35m$blue[m [00;31mYou get a B"[m[00;39m
[00;39m[00;33melif[m [00;39m[00;39m(([m [00;39mscore [00;39m>=[m [00;39m[00;34m9[m [00;39m[00;39m&&[m [00;39mscore [00;39m<=[m [00;39m[00;34m10[m [00;39m[00;39m));[m [00;39m[00;33mthen[m
[00;39m    [00;32mecho -e[m [00;39m[00;31m"[m[00;35m$green[m [00;31mYou get a A"[m[00;39m
[00;39m[00;33melse[m
[00;39m    [00;32mecho -e[m [00;39m[00;31m"[m[00;35m$red[m [00;31mYou failed, There is a good chance hackers have compromised you already."[m[00;39m
[00;39m[00;33mfi[m
[00;39m
