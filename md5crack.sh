#!/bin/bash

# Md5Crack - Script to hash md5 decryption
# Description : Md5 crack is a script to decrypt MD5 hash form offline 
# Use         : ./md5crack.sh -f [wordlist] -h [hash]
# Develop     : Walderlan Sena - <http://www.walderlan.xyz/about>
# Site        : contato@walderlan.xyz
# LINCENSE    : Lincense GPL <http://gnu.org/lincense/gpl.html>
# TODO        : The script still does not check if the hash has been passed

clear # Cleaning the terminal

if [ -f "$2" ]; then # Checks whether the file exists and is not a directory
  echo "\033[46;1;37m█▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀█"
  echo "█                   » Md5Crack «                    █"
  echo "█▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄ v-0.1.2 ▄▄▄█\033[0m"
  echo ""
  echo "     Md5 Crack is a software to decrypt MD5 hash    "
  echo ""
  cont=0
  for line in $(cat $2); do    
    v=$line
    hash="$(echo -n "$v" | md5sum | sed 's/ //g' | sed 's/-//g')";
    if [ $hash = $4 ] 
    then
      echo ""
      echo -e "\033[46;1;37m--------------------------------------\033[0m"
      echo -e "\033[46;1;37m| Md5 hash successfully decipher --> :\033[0m " $v
      echo -e "\033[46;1;37m--------------------------------------\033[0m"
      echo -e "\033[44;1;37m| Tested passwords: $cont\033[0m"
      exit 1
    else
      let cont=$cont+1;
      red="\033[0;31m"
      echo -e "[ \033[31mFAILED\033[0m ] \033[1;32m$hash\033[0m != \033[1;32m$4\033[0m ($line)"
    fi
  done
else
  clear # Cleaning the terminal
  echo -e "\033[46;1;37m█▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀█"
  echo -e "█                   » Md5Crack «                    █"
  echo -e "█▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄ v-0.1.2 ▄▄▄█\033[0m"
  echo ""
  echo "     Md5 Crack is a software to decrypt MD5 hash    "
  echo ""
  echo "Example software: "
  echo ""
  echo -e "\033[1;33muse: ./md5crack.sh -f [wordlist] -h [hash]\033[0m"
  echo ""
  echo "-f [FILE] : wordlist location passwords"
  echo "-h [HASH] : MD5 hash to be decrypted"
  echo ""
  echo "by: Waldelan Sena"
fi
