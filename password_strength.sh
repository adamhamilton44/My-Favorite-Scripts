#!/usr/bin/env bash

# Inform the user about the scoring system
echo "You will be scored on a 1 - 10 system: 1=AWFUL, 5=OK, 10=AWESOME"

# Read password from the user
read -sp "Enter your super secret password: " password
echo
# Initialize password score and feedback
score=0
feedback=""
# Path to the wordlist file
wordlist1="/usr/share/wordlists/rockyou.txt"
wordlist2="/usr/share/wordlists/seclists/Passwords/xato-net-10-million-passwords.txt"
# Check if the password is in the wordlist
if  grep --no-ignore-case -q "^$password$" "$wordlist1" || grep --no-ignore-case -q "^$password$" "$wordlist2"  ; then
    echo "Your password was found in a well known password file your score is 0"
    echo "It is vital you change this password if you are using it!"
    echo "DO NOT use this password in the future unless you want malicous threat actors to easily be able to get in your account!!!"
    exit 0
fi

# Check length of the password and assign initial score
length=${#password}
if (( length >= 8 && length <= 10 )); then
    score=$((score + 1))
    feedback+="Your Password length is minimum (+1 points). "
elif (( length >= 11 && length <= 12 )); then
    score=$((score + 2))
    feedback+="Your Password length is good (+2 points). "
elif (( length >= 13 && length <= 14 )); then
    score=$((score + 3))
    feedback+="Your Password length is very good (+3 points). "
elif (( length >= 15 )); then
    score=$((score + 4))
    feedback+="Your Password length is AWESOME nice job (+4 points). "
else
    score=$((score - 1))
    feedback+="Increase password length to at least 8 characters (-1 point). "
fi
# Check for capital letters and adjust score
num_capitals=$(echo "$password" | grep -o '[A-Z]' | wc -l)
if (( num_capitals >= 2 )); then
    score=$((score + 2))
    feedback+="Your use of capital letters is good (+2 points). "
elif (( num_capitals == 1 )); then
    score=$((score + 1))
    feedback+="Your use of capital letters is minimum (+1 point). "
else
    feedback+="Add at least one capital letter, (0 points). "
fi

# Check for numbers and adjust score
num_count=$(echo "$password" | grep -o '[0-9]' | wc -l)
if (( num_count >= 2 )); then
    score=$((score + 2))
    feedback+="Your use of numbers is above average, nice job +2 points. "
elif (( num_count == 1 )); then
    score=$((score + 1))
    feedback+="Your use of numbers is average, +1 point. "
else
    feedback+="Add at least one number, +0 points."
fi

# Check for special characters and adjust score
special_count=$(echo "$password" | grep -o '[^a-zA-Z0-9]' | wc -l)
if (( special_count >= 5 )); then
    score=$((score + 3))
    feedback+="Your use of special charcaters is AWESOME (+3 points). "
elif (( special_count >= 2 )); then
    score=$((score + 2))
    feedback+="Your use of special charcaters is good (+2 points). "
elif (( special_count == 1 )); then
    score=$((score + 1))
    feedback+="Your use of special charcaters is ok but needs work (+1 point). "
else
    feedback+="Add at least one special character (+0 points) "
fi

# Substitution checks and penalize if found
if [[ "$password" =~ ^[A-Z] ]]; then
    score=$((score - 1))
    feedback+="Avoid using a capital letter as the first character (-1 point). "
fi

# Penalize if '0' follows a letter or another number
if [[ "$password" =~ [a-zA-Z]0[a-zA-Z] ]]; then
    score=$((score - 1))
    feedback+="Avoid using '0' in place of 'o' hackers know this also (-1 point). "
fi

# Penalize if '1' follows a letter
if [[ "$password" =~ [a-zA-Z]1[a-zA-Z] ]]; then
    score=$((score - 1))
    feedback+="Avoid using '1' instead of 'I' hackers know this trick (-1 point). "
fi

# Penalize if '@' follows a letter
if [[ "$password" =~ [a-zA-Z]\@[a-zA-Z] ]]; then
    score=$((score - 1))
    feedback+="Avoid using '@' instead of 'A' hackers know you do this and they easily adjust there passwords (-1 point). "
fi

# Penalize if '$' is used as a 'S' or follows a number
if [[ "$password" =~ [a-zA-Z]\$[a-zA-Z0-9] ]]; then
    score=$((score - 1))
    feedback+="Avoid using '$' instead of 'S' everyone knows that trick, also dont add a '$' followed my a number (-1 point). "
fi

# Penalize if '3' is used as a 'E' or follows a number
if [[ "$password" =~ [a-zA-Z]3[a-zA-Z] ]]; then
    score=$((score - 1))
    feedback+="Avoid using '3' instead of 'E' hackers know this already -(1 point). "
fi

# Ensure the score does not exceed the maximum of 10
if (( score > 10 )); then
    score=10
fi

# Ensure the score does not go below 1
if (( score < 1 )); then
    score=1
fi

# Provide feedback if the score is less than 10
if (( score < 10 )); then
    echo "Suggestions to improve your password strength:"
    echo ""
    echo "$feedback"
    echo ""
else
    echo "Your password is AWESOME!"
    echo ""
fi

# Output the password strength score
echo "Password final strength score is: $score"
if (( score >= 2 && score <= 4 )); then
    echo "You get a D"
elif (( score >= 5 && score <= 6 )); then
    echo "You get a C"
elif (( score >= 7 && score <= 8 )); then
    echo "You get a B"
elif (( score >= 9 && score <= 10 )); then
    echo "You get a A"
else
    echo "You failed, i hope you try harder next time."
fi

