BLUE='\033[0;34m'                                       #blue for good password
RED='\033[0;31m'                                        #red for weak password
NC='\033[0m'                                            #no colour 

read -p "Please enter your password: " PASS

len="${#PASS}"

if test $len -lt 8 ; then

echo -e "${RED}Password is too short. Min 8 characters are required!${NC}"
exit 1
fi

echo "$PASS" | grep -q [0-9][A-Z][a-z]
	if [[ $? -ne 0 ]]; then

	echo -e "${RED}Weak password! It should include at least 1 lowercase, 1 uppercase, 1 number and 1 special character!${NC}"
         
       exit 2
else 
	echo -e "${BLUE}Strong Password!${NC}"

fi

        


