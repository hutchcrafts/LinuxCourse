#!/bin/sh

BLUE='\033[0;34m'                                       #blue for good password
ORNG='\033[0;33m'                                       #orange for user input
NC='\033[0m'                                            #no colour 

declare -a lottery_win lottery_num match

lottery_win=( $(shuf -i 1-50 -n5) )
lottery_win+=( $(shuf -i 1-10 -n1) )

read -p "Enter your lottery ticket name: " NAME
lottery_num=( `cat $NAME` )
echo -e "\nYour numbers are ${BLUE}${lottery_num[@]}${NC}"
echo -e "\nWinning numbers are ${ORNG}${lottery_win[@]}${NC}"
match=(`echo ${lottery_win[@]} ${lottery_num[@]} | tr ' ' '\n' | sort | uniq -D `)

echo -e "\nYou have ${BLUE}`expr ${#match[@]} / 2`${NC} matching number(s)"

if [ ${#match[@]} == 0 ]; then
        exit 1
else
        echo -e "\nYour matching numbers are ${BLUE}${match[@]}${NC}\n"
fi
