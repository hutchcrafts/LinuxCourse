#!/bin/bash

#define colours

GRN='\033[0;32m'                                        #green 
BLUE='\033[0;34m'                                       #blue 
RED='\033[0;31m'                                        #red 
ORNG='\033[0;33m'                                       #orange
NC='\033[0m'                                            #no colour


#defining functions

check_ans()                                             #function to check correct input when asked for y/n
{
while true; read -p "y/n: " ans
                do

                if [ $ans == "y" ] ; then
                        break

                elif [ $ans == "n" ]; then
                        break                           #break while loop

                else                                    #if user didnt answer neither n nor y

                        echo -e "\n${RED}I don't understand, try again!${NC}\n"
                        continue                        #continue while loop
                fi
                done
}


file11()						#function to create file with input given in instructions
{
echo "5 6 3 7 4 4 9 6 7 9 8 2 3 6 4 5 1 1 3 10 12" > File11.txt
}


create_file()						#function to ask user about input file File11.txt
{
if [[ -e File11.txt ]]; then
        echo -e "\n${RED}File11.txt required for this script already exists. Do you want to overwrite it with given data?${NC}"
        check_ans

        if [ "$ans" == "y" ] ; then                     #create file and inform about it
                file11
                echo -e "\n${GRN}File11.txt has been modified!${NC}"

        elif [ "$ans" == "n" ]; then                    #confirm that file was not modified
                echo -e "\n${ORNG}File11.txt has NOT been modified!${NC}"

        fi

else
        file11
        echo -e "\n${BLUE}File11.txt with input data did not exist in this directory, so it has been created.${NC}"          
        echo -e "${BLUE}This file is required to run the script.${NC}"        
fi
}


#main code starts here

declare -a array1 sort_array1				#declare arrays

create_file						#call function to manage required File11.txt

echo -e "\n${BLUE}Input data in File11.txt is: ${NC}"	#display data stored in File11.txt
cat File11.txt



cat File11.txt | tr ' ' '\n' > File11Temp            	#transform input from line to list temporarily

array1=`awk '!a[$0]++' File11Temp`			#using awk delete all duplicated inputs and store result in array1

rm File11Temp						#remove temporary list 



sort_array1=($(echo "${array1[@]}" | sort -nr ))	#sort array contents in reversed numerical order

echo -e "\n\n${BLUE}Reversed unique array is \n${GRN}${sort_array1[@]}${NC}\n"	#display final result


