#!/bin/sh

#defining colours

GRN='\033[0;32m'                                        #green 
BLUE='\033[0;34m'                                       #blue 
RED='\033[0;31m'                                        #red 
ORNG='\033[0;33m'                                       #orange
NC='\033[0m'  						#no colour

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


write_file()
{

#command explanation [shuf -i X-Y -nZ | xargs -nT] draws Z numbers in scale X-Y, xargs -nT formats them in groups of T numbers per line.

shuf -i 1-10000 -n"$y" | xargs -n1  > "$FILE"
}


write_numbers()
{
FILE=$x
LINES=$y



if [[ -e "$FILE" ]]; then
        echo -e "\n${ORNG}File exists. Do you want to overwrite it?${NC}" 
	check_ans

	if [ $ans == "y" ] ; then			#overwrite file and inform about it
		write_file
		echo -e "\n${GRN}File $FILE has been overwritten!${NC}"
	elif [ $ans == "n" ]; then			#confirm that file was not modified
		echo -e "\n${ORNG}File $FILE has NOT been modified!${NC}"
	fi
	
else
        echo -e "\n${RED}File does not exist, do you want to create it?${NC}"
	check_ans

       	if [ $ans == "y" ] ; then			#create file and inform about it
		write_file
		echo -e "\n${GRN}File $FILE has been created!${NC}"
	fi
	
fi
}

while true;
do
	echo -e "\n${BLUE}Enter a name of the file and number of lines: ${NC}" 
	read -p "Name: " x 
	read -p "Lines: " y

	write_numbers $x $y

	echo -e "\n${BLUE}Do you want to check another file?${NC}"	#check if user wants to continue
	check_ans

	if [ $ans == "y" ] ; then
		continue				#repeat the loop
	elif [ $ans == "n" ]; then
		echo -e "\n${ORNG}Ok, that's it for today!${NC}\n"
		break					#break while loop
	fi
done
