#!/bin/bash
logs_flag=false 
logs_count=100 
error_flag=false 
error_count=100 

while [[ $# -gt 0 ]] 
do 
  case $1 in 
  --logs|-l) 
    logs_flag=true 
    shift 
    ;; 
  --date|-d) 
    logs_date=true 
    shift 
    ;; 
  --error|-e) 
    error_flag=true 
    shift 
    if [[ $# -gt 0 && $1 =~ ^[0-9]+$ ]]; then 
      error_count=$1 
      shift 
    fi 
    ;; 
  --help|-h) 
    shift 
    ;; 
  *) 
    exit 1 
    ;; 
  esac 
done

if $logs_flag; then 
for i in $(seq 1 $logs_count); do
echo "log$i.txt $(date)" > log$i/log$i.txt
done 
fi 

if $error_flag; then
for i in $(seq 1 $error_count); do 
echo "error$i.txt $(date)" > error$i/error$i.txt 
done 
fi 

echo "log*.txt" >> .gitignore 
echo "error*.txt" >> .gitignore 

if [ "$1" = "--help" ] 
then 
echo "--date -d" 
echo "--logs -l" 
echo "--error -e " 
exit 0 
fi 
exit 0