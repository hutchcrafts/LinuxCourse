#!/bin/sh

BLUE='\033[0;34m'					#blue for correct answer
RED='\033[0;31m'					#red for wrong answer
ORNG='\033[0;33m'					#orange for user input
NC='\033[0m'						#no colour 
score=0							#define score

echo -e "\n${BLUE}Welcome to the Quiz! You have to answer True or False to each of 10 questions.\n For every correct answer you will collect one point. Good Luck!${NC}\n"

cat Questions7.txt | while read line

do 
QUES=`echo $line | awk -F'-' '{print$1}'`
ANS=`echo $line | awk -F'-' '{print$2}'`
INF=`echo $line | awk -F'-' '{print$3}'`

echo "$QUES"

	while true; read -p "Enter your answer: True/False " ANSQ </dev/tty		#get input from terminal
		do 
		echo "$ANSQ" | grep -vq 'True' && echo "$ANSQ" | grep -vq 'False'
			if test $? -eq 0 ; then
				echo -e "${RED}You have to answer True or False, try again!${NC}\n"
			continue
		else
			break

			fi
		break
		done

echo -e "${ORNG}$ANSQ${NC}"
	if [ "$ANSQ" = "$ANS" ]; then
		score=`expr $score + 1`
		echo -e "${BLUE}Correct answer! $INF${NC}\n"
	else 
		echo -e "${RED}Wrong answer! The correct answer is $ANS$INF${NC}\n"
	fi

done <Questions7.txt

echo -e "\n${ORNG}Your score is: $score${NC}\n"    			#why score is not working?



