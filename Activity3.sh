#!/bin/sh

BLUE='\033[0;34m'                                       #blue for good password
NC='\033[0m'                                            #no colour 

declare -a lottery_num					                        #declare array
DAY=$(date +%T.%F)				                	            #set date in format time.YYYY-MM-DD
read -p "Enter your name for lottery ticket: " NAME	    #get a name from user

lottery_num=( $(shuf -i 1-50 -n5) )             	    #[shuf -i X-Y -nZ] draws Z numbers in scale X-Z
							                                        #get 5 random numbers from range 1-50 and add to array

lottery_num+=( $(shuf -i 1-10 -n1) )           		    #add extra ball to array- 1 random number from range 1-10


echo ${lottery_num[@]} > ${NAME}.${DAY}.lottery		    #save array to new file with given name and current date

TIC=`ls -t | head -1`					#read file name to variable TIC

echo -e "Your lottery ticket is: ${BLUE}$TIC${NC}"	  #display lottery ticket name for user 
