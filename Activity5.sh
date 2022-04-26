#!/bin/sh

RED='\033[0;31m'                                        #red 
BLUE='\033[0;34m'					#blue
NC='\033[0m'						#no colour 

while true; read -p "Enter a number: " num   

do							#check if the input is numerical
	echo "$num" | grep -q '[[:punct:]]' || echo "$num" | grep -iq [a-z]  	#grep -i is for case insensitive; 
										#grep -q for search without results output
	if test $? -eq 0 ; 				#if input is incorrect
	then
		echo -e "${RED}This is not a number! Try again ${NC}"
	continue					#go to entering input again
	
	else
		echo -e "${BLUE}Your reversed number: ${NC}"
		echo $num | rev				#display reversed output
	fi
	break						#break the loop
done
