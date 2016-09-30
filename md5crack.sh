#!/bin/bash

##################################################
# -----------------  Md5Crack  ----------------- #
# Develop: Walderlan Sena                        #
# github.com/WalderlanSena - Project Open Source #
##################################################

clear # Limpando a tela do terminal

if [ $2 != '' ]; then
  echo "@---------------------------------------------------@"
  echo "@-------------------  Md5Crack  --------------------@"
  echo "@--------------------------------------- v-0.0.1 ---@"
  echo ""
  echo "     Md5 Crack is a software to decrypt MD5 hash    "
  echo ""
  cont=0
  cat $2 | while read linha
  do
    v=$linha
    hash="$(echo -n "$v" | md5sum | sed 's/ //g' | sed 's/-//g')";
    if [ $hash = $4 ]; then
      echo ""
      echo -e "\033[46;1;37m--------------------------------------\033[0m"
      echo -e "\033[46;1;37m| Md5 hash successfully decipher --> :\033[0m " $v
      echo -e "\033[46;1;37m--------------------------------------\033[0m"
      echo -e "\033[44;1;37m| Tested passwords: $cont\033[0m"
      exit 1
    else
      let cont=$cont+1;
      vermelho="\033[0;31m"
      echo -e "\033[1;32m$hash\033[0m != \033[1;32m$4\033[0m ($linha)"
    fi
  done
else
  clear # Limpando a tela do terminal
  echo -e "\033[46;1;37m@---------------------------------------------------@"
  echo  "@-------------------  Md5Crack  --------------------@"
  echo -e "@--------------------------------------- v-0.0.1 ---@\033[0m"
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
