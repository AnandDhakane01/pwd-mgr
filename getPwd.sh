#~!/usr/bin/bash
if [[ $# -ne 1 ]]; then
echo "Insufficient parameters, please provide a file name" >&2
  exit 2
fi

if test -f $1; then
  openssl enc -aes-256-cbc -pbkdf2 -in $1 -out out.txt -a -d
  ecode=$?
  if [ $ecode -eq 1 ]; then
    echo "Invalid password entered for decryption"
    exit 2
  fi 

  if test -f "out.txt"; then
    echo "Enter the account for which password is to be obtained"
    read account
    grep $account out.txt 1>/dev/null
    ecode=$?
    if [ $ecode -eq 0 ]; then
      echo "The password is : " `grep $account out.txt | cut -d'|' -f 2`
      rm out.txt
    else
      echo "You entered an invalid account"
    fi  
  else
    echo "Decryption failed"
  fi
else
  echo "Input file $1 does not exist"
fi 



