#!/bin/sh

BLUE='\033[0;34m'                                       #blue 
RED='\033[0;31m'                                        #red 
ORNG='\033[0;33m'                                       #orange 
NC='\033[0m'                                            #no colour 

check_number()
{
NUM=$x
while true; read NUM
        
        
        do                                                      #check if the input is numerical
                echo "$NUM" | grep -iq [a-z] || echo "$NUM" | grep -q '[[:punct:]]'     # \\check letters and special characters 
                if test $? -eq 0 ; then
                        echo -e "${RED}This is not a number! Try again ${NC}"
                continue                                        #go back to: enter input

                else

                NUM=$((10#$NUM))               #force number with leading zero into decimal

                fi
                break
        done
}

echo -e "\n${ORNG}Enter number A: ${NC}"
check_number $x
numA=$NUM

echo -e "\n${ORNG}Enter number B: ${NC}"
check_number $x
numB=$NUM

if [ "$numA" -gt "$numB" ]; then                        #if A is greater than B output True, otherwise output False
        diff=`expr $numA - $numB`
        echo -e "\n${BLUE}Number A is bigger than B by $diff${NC}\n"
else
        diff=`expr $numB - $numA`
        echo -e "\n${BLUE}Number B is bigger than A by $diff${NC}\n"
fi
