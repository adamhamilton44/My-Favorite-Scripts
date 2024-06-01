# My Favorite Scripts - a mix of bash and awk scripts

## Author
Adam Hamilton
- [Github](https://www.github.com/adamhamilton44)

- [Email](blacklisthacker@protonmail.com)

Most Scripts wrote by myself, a few wrote by YouTubers

## Contributing

Contributions are always welcome!

See Above for ways to get a hold of me.

## Features

1. Converters
  -  binary to decimal
  -  decimal to binary
  -  decimal to hex
  -  hex to decimal
  -  hex to ascii

2. Math Helper Program
  -  advancedMathExamples
    -  Basic Calculator
    -  Even or Odd
    -  Prime Number
    -  Armstrong
    -  Factorial
    -  Fibonacci
    -  Table

3. Security
  -  check_hashes.sh 
    -  sha256sum hash all .sh files in current working directory 
``` bash check_hasshes.sh <path/to/folder> new```
#### this adds a new hashes.txt file in roots directory with the hashes of <path/to/folder/*.sh>
  -  change hashes after modifing script 
```bash check_hashes.sh <path/to modifed/script> update```
  -  run script daily using cronjobs or from CLI to check hashes and give warnings if changed 
```bash check_hashes.sh```
#### checks hashes from /root/hashes.txt file

  -  password_strength.sh
    - checks users password against well known password files *rockyou.txt, Seclists/passwords.txt* and warning if found.
    - scores on a 0-10 scale based on length, capital letters, regular letters, numbers, special caracters.
    - negative points given for well known letter replacements i.e. (A=@,i=1,O=0,E=3) etc.
    - recieve a point based score and school based score i.e. 1-10 and A,B,C,D,or F.

  - Zip_and_Passwd_Protect.sh
    - highest compression and password protect any file/folder

  - urlExtender.sh
    - check short url's safely before using a web browser

4. Admin Scripts
  -  CopyWebsite.sh
    - copy all pages of a website without leaving the command line

  - File_Helper.sh
    -  check file permissions
    -  change file extensions
    -  count lines in a file
    -  convert file to upper/lower case
    -  find and delete a file
    -  find ip address information on anyone using only a ip
    -  automaticaly find and remove all empty files
    -  random number generatior

  -  easyfind
    - uses fzf and a nice bash script to search for files to edit
      - choose a directory noted by [D] and auto move there
      - move to parent directory with last option [D]..
      - once a file is choosen where [F] filename is file auto nano,vim,vi etc

  - get_location_from_ip
    - enter a ip address and recieve city,state,country,lat,long,etc

  - letter_frequency.awk
    - gives user a total number of all letters a-z in a choosen file

  - packageInstallfzf.sh
    - install apt packages with the help of fzf

  -  partitionDrive.sh
    - uses sfdisk to partition a efi, root, and home partitioned drive
    - choose partition size for each partition

  -  touchChownNano
    - (typo) s/Chown/chmod/
    - simple script to touch a file(script), chmod 777 and nano into file

  - trees
    - runs the tree command with a argument of tree file depth 
```trees 2```

  - update_git_repos.sh
    - updates all git repos in my /opt directory using git commands
    - great for cronjobs running 1/week, or 2/month

  - weather
    - nice ascii art showing the 7 day forcast

  - myips
    - gives user internal and external ip's and internet connection ESSID infomation 

  - users_and_sheels.awk
    - outputs all users with a available shell and shell type


5. Fun Scripts
  - ColoredCrazyLines.sh
  - ColoredLines.sh
  - lines.sh
  - ipinfo
    - ipinfo needs ipinfo2.sh to work 
    - creates a boxed type interface with different information in each box
  - continue2Write2File
    - write to a file in the command line until special code is entered
    - each line gets wrote to a file without using nano,vim etc.

6. Other
  - other script available and more to come

## Feedback

If you have any feedback, please reach out to me at [Email](blacklisthacker@protonmail.com)

## Download

Clone the project

```bash
git clone https://github.com/adamhamilton44/MyFavoriteScripts.git
```

## 🚀 About Me

👩‍💻 I'm currently working on more bash scripts

💬 Ask me about anything

📫 How to reach me Email: blacklisthacker@protonmail.com

⚡️ Fun fact I am actually a Professional dog trainer.
   [My website](https://good-happy-puppy.com)

# Fund My Projects

Bitcoin: 3ENrACvnNY7AYG7HUvcdwJgZjnpoaQ9Lbt
