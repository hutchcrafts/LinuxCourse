#!/bin/sh

BLUE='\033[0;34m'                                       #blue for good password
ORNG='\033[0;33m'                                       #orange for user input
NC='\033[0m'                                            #no colour 

declare -a lottery_win lottery_num match                #declare arrays

lottery_win=( $(shuf -i 1-50 -n5) )                     #get winning lottery numbers and add to array
lottery_win+=( $(shuf -i 1-10 -n1) )

while true; read -p "Enter your lottery ticket name: " NAME             #ask user for their ticket name
do
lottery_num=( `cat $NAME` )                                             #read numbers from users ticket
if test $? -ne 0; then							#if provided file name doesnt exist, try again
        echo -e "${ORNG}There is no ticket with that name! Try again!${NC}\n"
        continue							#continue while loop
else
        break								#if the name is correct, break while loop
fi
done

echo -e "\nYour numbers are ${BLUE}${lottery_num[@]}${NC}"              #display users numbers
echo -e "\nWinning numbers are ${ORNG}${lottery_win[@]}${NC}"           #display winning numbers

match=(`echo ${lottery_win[@]} ${lottery_num[@]} | tr ' ' '\n' | sort | uniq -d `)      #check matching numbers in both tickets

echo -e "\nYou have ${BLUE}${#match[@]}${NC} matching number(s)"             #tell user how many matching numbers they have

if [ ${#match[@]} == 0 ]; then                                          #display matched numbers if any has been found
        exit 1
else
        echo -e "\nYour matching numbers are: ${BLUE}${match[@]}${NC}\n"
fi
