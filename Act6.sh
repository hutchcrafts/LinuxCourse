#!/bin/sh

check_number()
{
NUM=$x
while true; read NUM
        
        
        do                                                      #check if the input is numerical
                echo "$NUM" | grep -iq [a-z] || echo "$NUM" | grep -q '[[:punct:]]'     # \\check letters and special characters 
                if test $? -eq 0 ; then
                        echo "This is not a number! Try again "
                continue                                        #go back to: enter input

                else 

		NUM=$((10#$NUM))               #force number with leading zero into decimal

                fi
                break
        done
}

echo "Enter number A: "
check_number $x
numA=$NUM

echo "Enter number B: "
check_number $x
numB=$NUM

if [ "$numA" -gt "$numB" ]; then                        #if A is greater than B output True, otherwise output False
        diff=`expr $numA - $numB`
        echo "Number A is bigger than B by $diff"
else
        diff=`expr $numB - $numA`
        echo "Number B is bigger than A by $diff"
fi


