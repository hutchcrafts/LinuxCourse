#!/bin/bash

#adding colours to differentiate text and user info

BLUE='\033[0;34m'	#blue for user info
NC='\033[0m'		#no colour 

#defining variables

NAME=`whoami`
DATE=`date +%F`
TIME=`date +%R`
CDIR=`pwd`
FILES=`ls | wc -l`
BIGF=`du -hsx * | sort -rh | head -1`

echo -e "\nYour username is ${BLUE}$NAME${NC}" 	#-e is required to apply formatting
echo -e "Current date is ${BLUE}$DATE${NC}"
echo -e "Current time is ${BLUE}$TIME${NC}"
echo -e "Your current directory is ${BLUE}$CDIR${NC}"
echo -e "There is ${BLUE}$FILES${NC} file(s) in this directory"
echo -e "The biggest file in this directory is ${BLUE}$BIGF${NC}\n"


