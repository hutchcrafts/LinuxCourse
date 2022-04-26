#!/bin/sh

BLUE='\033[0;34m'                                       #blue for correct answer
RED='\033[0;31m'                                        #red for wrong answer
ORNG='\033[0;33m'                                       #orange for user input
NC='\033[0m'                                            #no colour 

declare -i score=0                                      #define score integer


#function for writing questions

writeQ()
{
echo "1. Africa is the largest continent by area-False-, Asia is the largest
2. Equatorial circumference of Earth is 40 075 km-True-
3. Only 5 countries sit along the equator-False-, there are 13 countries along equator.
4. Baikal is the deepest lake in the world-True-
5. Canada is geographically closest to the North Pole-True-
6. Iceland sits on 2 tectonic plates-Eurasian and North American-True-
7. France shares a border with Brazil-True-, France has a region called French Guiana which is located in South America 
8. Colorado is the longest river in the world-False-, Nile is the longest
9. Singapore is the richest country in the world-False-, Luxembourg is the richest
10. Naypyidaw is a capital of Myanmar-True-" > Questions7.txt

}


#check if file with questions exists

if [ -e Questions7.txt ]; then
	echo -e "${BLUE}\nThis script uses external file as Questions database.${NC}"
	echo -e "${BLUE}Do you want to overwrite questions in existing file?${NC}\n"
	while true; read -p "y/n: " ans
		do

		if [ $ans == "y" ] ; then

			writeQ
			echo -e "\n${ORNG}File has been overwritten.${NC}\n"
			break

		elif [ $ans == "n" ]; then
        		echo -e "\n${ORNG}File remained unchanged${NC}\n"
        		break                                           #break while loop

		else
       			echo -e "\n${RED}I don't understand, try again!${NC}\n"
       			continue                                        #continue while loop
		fi
		done
	else 
	echo -e "${BLUE}\nThis script uses external file as Questions database, but it has not been found.${NC}"
	echo -e "${BLUE}The Questions file has been created for you.${NC}\n"
	writeQ
fi


echo -e "\n${BLUE}Welcome to the Quiz! You have to answer True or False to each of 10 questions.\n For every correct answer you will collect one point. Good Luck!${NC}\n"

cat Questions7.txt | (while read line

do
QUES=`echo $line | awk -F'-' '{print$1}'`
ANS=`echo $line | awk -F'-' '{print$2}'`
INF=`echo $line | awk -F'-' '{print$3}'`

echo "$QUES"

        while true; read -p "Enter your answer: True/False " ANSQ </dev/tty             #get input from terminal
                do									#check if the input is correct
                echo "$ANSQ" | grep -vq 'True' && echo "$ANSQ" | grep -vq 'False'
                        if test $? -eq 0 ; then						#if not, continue while loop
                                echo -e "${RED}You have to answer True or False, try again!${NC}\n"
                        continue
                else
                        break

                        fi
                break
                done

echo -e "${ORNG}$ANSQ${NC}"
        if [ "$ANSQ" = "$ANS" ]; then
                score=$score+1
                echo -e "${BLUE}Correct answer! $INF${NC}\n"
        else
                echo -e "${RED}Wrong answer! The correct answer is $ANS$INF${NC}\n"
        fi

done <Questions7.txt

echo -e "${ORNG}Your score is: $score${NC}\n" )                      

#IMPORTANT
#Pipe after [cat Questions7.txt] creates subshell for while loop, which affects variable SCORE.
#When [while loop]  ends, the variable stored in SCORE is destroyed, so it cannot be recalled outside of [while loop].
#Parenthesis around whole [while loop] solves the problem for displaying final score.
