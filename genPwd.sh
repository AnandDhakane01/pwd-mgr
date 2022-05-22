#!/usr/bin/bash
cat $1 | while read line
do
  mktemp -u XXXXXXXXX
done > pwd.txt
#cat -n pwd.txt
paste -d "|" $1 pwd.txt > userNmPwd.txt

if test -f "userNmPwd.txt" 
then
  echo "Generated passwords stored in userNmPwd.txt file"
else
  echo "Failed to generate password file"
fi
rm pwd.txt


