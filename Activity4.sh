#!/bin/sh

BLUE='\033[0;34m'                                       #blue for good password
RED='\033[0;31m'                                        #red for weak password
NC='\033[0m'                                            #no colour 

read -p "Please enter your password: " PASS
	
len="${#PASS}"

if test $len -ge 8 ; then

 	echo "$PASS" | grep -q [0-9] 
	if test $? -eq 0 ; then

	 	echo "$PASS" | grep -q [A-Z]
		if test $? -eq 0 ; then
	 	  	echo "$PASS" | grep -q [a-z] 

			if test $? -eq 0 ; then
			echo -e "${BLUE}Strong password!${NC}"
			else
			  echo -e "${RED}Weak password! It should include at least 1 lower case letter!${NC}"
			fi

		else
		echo -e "${RED}Weak password! It should include at least 1 upper case letter!${NC}"
		fi
	else
	echo -e "${RED}Weak password! It should include at least 1 number!${NC}"  
	fi
else
echo -e "${RED}Password is too short. Min 8 characters are required!${NC}"
fi
