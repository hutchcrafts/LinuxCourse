#!/bin/sh

BLUE='\033[0;34m'                                       #blue for good password
NC='\033[0m'                                            #no colour 

declare -a lottery_num
DAY=$(date +%T.%F)
read -p "Enter your name for lottery ticket: " NAME

lottery_num=( $(shuf -i 1-50 -n5) )    		 #[shuf -i X-Y -nZ] draws Z numbers in scale X-Z

lottery_num+=( $(shuf -i 1-10 -n1) )		#add extra ball

echo ${lottery_num[@]} > ${NAME}${DAY}.lottery

TIC=`ls -t | head -1`

echo -e "Your lottery ticket is: ${BLUE}$TIC${NC}"
