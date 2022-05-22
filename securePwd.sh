#!/usr/bin/bash

if [[ $# -ne 1 ]]; then
echo "Insufficient parameters, please provide a file name" >&2
  exit 2
fi

if test -f $1; then
  openssl enc -aes-256-cbc -pbkdf2 -in $1 -out secret.txt -a

  if test -f "secret.txt"; then
    echo "The encrypted file created is secret.txt"
    rm $1
  else
    echo "Encryption failed"
  fi
else
  echo "Input file $1 doesn't exist"
fi

