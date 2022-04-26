#!/bin/sh

#adding colours

RED='\033[0;31m'                                        #red 
ORNG='\033[0;33m'                                       #orange for user input
NC='\033[0m'                                            #no colour 


echo -e "${RED}All files in this directory will be renamed with current date at the beginning!${NC}"
echo -e "${ORNG}Do you want to proceed?${NC}"


while true; read -p "y/n: " ans
do

if [ $ans == "y" ] ; then

DAY=$(date +%F)                                         #date in YYYYMMDD format stored in variable

        for FILE in *                                   #for every file in current directory
        do
        mv $FILE ${DAY}-${FILE}                         #add date followed by dash and file name
        done

        echo -e "\n${RED}All files in this directory have been renamed${NC}\n"
        break                                           #break while loop

elif [ $ans == "n" ]; then
        echo -e "\n${ORNG}Files have remained unchanged${NC}\n"
        break                                           #break while loop

else
        echo -e "\n${RED}I don't understand, try again!${NC}\n"
        continue                                        #continue while loop
fi

done

