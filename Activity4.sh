#!/bin/sh

BLUE='\033[0;34m'                                       #blue for good password
RED='\033[0;31m'                                        #red for weak password
NC='\033[0m'                                            #no colour 

declare -i int=0                                        #declare integer int

while true; read -p "Please enter your password: " PASS #get password from user

do

len="${#PASS}"                                          #store lenght of password in variable len

int=0                                                   #reset int to 0 for another try

if test $len -ge 8 ; then				#check if password has at least 8 characters
        int=$int+1					#if test passed, add value to int
else
        echo -e "${RED}Password is too short. Min 8 characters are required!${NC}"
fi

echo "$PASS" | grep -q [0-9]				#check if password has numbers
if test $? -eq 0 ; then
        int=$int+4					#if test passed, add value to int
else
        echo -e "${RED}Weak password! It should include at least 1 number!${NC}"  
fi


echo "$PASS" | grep -q [A-Z]				#check if password has upper case letters
if test $? -eq 0 ; then
        int=$int+7					#if test passed, add value to int
else
        echo -e "${RED}Weak password! It should include at least 1 upper case letter!${NC}"
fi

echo "$PASS" | grep -q [a-z]				#check if password has lower case letters
if test $? -eq 0 ; then
        int=$int+11					#if test passed, add value to int
else
        echo -e "${RED}Weak password! It should include at least 1 lower case letter!${NC}"
fi

echo "$PASS" | grep -q '[[:punct:]]'			#check if password has special characters
if test $? -eq 0 ; then
        int=$int+14					#if test passed, add value to int
else
        echo -e "${RED}Weak password! It should include at least 1 special character!${NC}"
fi

if test $int -eq 37 ; then				#if all tests passed, the int should equal 37
          echo -e "\n${BLUE}Good job! Strong password!${NC}\n"
        break						#stop while loop

else							#else not all tests passed, user should try again
        echo -e "\n${RED}Try again or press ctrl+C to finish!${NC}\n"
        continue					#repeat while loop
fi

done
