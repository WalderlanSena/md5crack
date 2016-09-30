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
      echo "--------------------------------------"
      echo "| Md5 hash successfully decipher --> : " $v
      echo "--------------------------------------"
      echo "| Tested passwords: $cont"
      exit 1
    else
      let cont=$cont+1;
      echo "$hash != $4 ($linha)"
    fi
  done
else
  clear # Limpando a tela do terminal
  echo "@---------------------------------------------------@"
  echo "@-------------------  Md5Crack  --------------------@"
  echo "@--------------------------------------- v-0.0.1 ---@"
  echo ""
  echo "     Md5 Crack is a software to decrypt MD5 hash    "
  echo ""
  echo "Example software: "
  echo ""
  echo "use: ./md5crack.sh -f [wordlist] -h [hash]"
  echo ""
  echo "-f [FILE] : wordlist location passwords"
  echo "-h [HASH] : MD5 hash to be decrypted"
  echo ""
  echo "by: Waldelan Sena"
fi
