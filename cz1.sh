#!/bin/bash
if ["$1" = "--date"]
then
  date+%Y-%m-%d
  exit 0
fi

if ["$1" = "--logs"]
then
  if ["$2" = ""]
  then
    n=100
  else
    n=$2
  fi

  for i in $(seq 1 $n)
  do
    touch log$i.txt
    echo "log$i.txt, skrypt.sh, $(date+%Y-%m-%d)" > log$i.txt
  done
  
  exit 0
fi

if ["$1" = "--help"]
then
  echo "--date"
  echo "--logs"
  echo "--help"
  exit 0
fi

touch .gitignore
echo "*log*" > .gitignore

git tag v1.0
git push --tags