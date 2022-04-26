#!/bin/sh

GRN='\033[0;32m'                                        #green 
BLUE='\033[0;34m'                                       #blue 
RED='\033[0;31m'                                        #red 
ORNG='\033[0;33m'                                       #orange
NC='\033[0m'                                            #no colour 

#defining functions

check_ans()						#function for checking input if asked for y/n
{
while true; read -p "y/n: " ans
		do

		if [ $ans == "y" ] ; then
			break

		elif [ $ans == "n" ]; then
        		break                           #break while loop

		else					#if user didnt answer neither n nor y

       			echo -e "\n${RED}I don't understand, try again!${NC}\n"
       			continue                      	#continue while loop
		fi
		done
}



find_file()						#function for finding file
{
FILE=$x							#defining input for function
if [[ -e "$FILE" ]]; then				#checking if file exists
        echo -e "\n${GRN}File exists${NC}" 		

else
        echo -e "\n${RED}File does not exist, do you want to create it?${NC}"
        check_ans					#if file does not exist check if user want to create it
							#checking answers
	if [ $ans == "y" ] ; then			#create file and inform about it
		touch "$FILE"
		echo -e "\n${GRN}File $FILE has been created!${NC}"
	elif [ $ans == "n" ]; then			#confirm that file was not created
		echo -e "\n${ORNG}File $FILE has NOT been created!${NC}"
	fi
		
fi
}


#main code starts here


while true; 						#while loop to let user check files many times
do 
echo -e "\n${BLUE}Enter name of the file to check if it exists: ${NC}"
read x							#getting name of searched file
find_file $x						#using function to find file

echo -e "\n${BLUE}Do you want to check another file?${NC}"	#check if user wants to continue
check_ans
	if [ $ans == "y" ] ; then
		continue				#repeat the loop
	elif [ $ans == "n" ]; then
		echo -e "\n${ORNG}Ok, that's it for today!${NC}"
		break					#break while loop
	fi
done
            
