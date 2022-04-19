#!/bin/sh


while true; read -p "Enter number A: " numA 


do							#check if the input is numerical
	echo "$numA" | grep -iq [a-z] || echo "$numA" | grep -q '[[:punct:]]'			# \\check special characters with grep [[:punct:]]
	if test $? -eq 0 ; then
		echo "This is not a number! Try again "
	continue					#go to: entering input again
	
	else 
	numA=$((10#$numA))				#force number with leading zero into decimal

	fi
	break
done


while true; read -p "Enter number B: " numB  



do							#check if the input is numerical
	echo "$numB" | grep -iq [a-z] || echo "$numB" | grep -q '[[:punct:]]'
	if test $? -eq 0 ; then
		echo "This is not a number! Try again "
	continue					#go to: enter input again

	else
	numB=$((10#$numB))					#force number with leading zero into decimal

	fi
	break
done

if [ "$numA" -gt "$numB" ]; then			#if A is greater than B output True, otherwise output False
	echo "True"
else
	echo "False"
fi

if [ "$numA" -gt "$numB" ]; then			#if A is greater than B output True, otherwise output False
	diff=`expr $numA - $numB`
	echo "Number A is bigger than B by $diff"
else
	diff=`expr $numB - $numA`
	echo "Number B is bigger than A by $diff"
fi
