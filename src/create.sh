#!/bin/bash

day_number=$1
ex_count=$2

if [ "$#" -ne 2 ]; then
    echo "Usage: ./script.sh day_number ex_count"
    exit 1
fi

for ((i=0; i<=ex_count; i++))
do
    ex_folder="ex$(printf "%02d" $i)"
    mkdir -p "$ex_folder"
    
    sql_file="day${day_number}_${ex_folder}.sql"
    touch "$ex_folder/$sql_file"
done