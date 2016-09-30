#!/bin/bash

##################################################
# -----------------  Md5Crack  ----------------- #
# Develop: Walderlan Sena                        #
# github.com/WalderlanSena - Project Open Source #
##################################################

clear # Limpando a tela do terminal

if [ $2 != '' ]; then
  echo "@-----------------------------------------@"
  echo "@--------------  Md5Crack  ---------------@"
  echo "@----------------------------- v-0.0.1 ---@"
  echo ""

  cat $2 | while read linha
  do
    v=$linha
    hash="$(echo -n "$v" | md5sum | sed 's/ //g' | sed 's/-//g')";
    if [ $hash = $4 ]; then
      echo ""
      echo "--------------------------------------"
      echo "| Md5 hash successfully decipher --> : " $v
      echo "--------------------------------------"
      echo ""
      exit 1
    else
      echo "$hash != $4 ($linha)"
    fi
  done
else
  clear
  echo "@-----------------------------------------@"
  echo "@--------------  Md5Crack  ---------------@"
  echo "@----------------------------- v-0.0.1 ---@"
  echo ""
  echo "Example software: "
  echo ""
  echo "./md5crack.sh -f /opt/wordlist.txt -h [hash]"
  echo ""
  echo "-f [FILE] : wordlist location passwords"
  echo "-h [HASH] : MD5 hash to be decrypted"
  echo ""
  echo "by: Waldelan Sena"
fi
