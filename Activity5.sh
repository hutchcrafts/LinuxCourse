#!/bin/sh

while true; read -p "Enter a number: " num   

do							#check if the input is numerical
	echo "$num" | grep -q '[[:punct:]]' || echo "$num" | grep -iq [a-z] 			#-i for case insensitive; -q for search without results output
	if test $? -eq 0 ; 
	then
		echo "This is not a number! Try again "
	continue					#go to entering input again
	
	else
		echo $num | rev				#reversed output
	fi
	break						#break the loop
done

