#!/bin/sh

declare -a array1 sort_array1

array1=( `cat File11.txt` )		#read from file

# match=(`echo ${array1[@]} | tr ' ' '\n' | sort | uniq -D `)

sort_array1=($(echo "${array1[@]}" | tac | tr ' ' '\n' | sort -u | tr '\n' ' ')) #why tac doesnt work?



echo -e "\nReversed unique array is ${sort_array1[@]}"
