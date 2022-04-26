#!/bin/sh

#adding colours to differentiate text and user info

BLUE='\033[0;34m'					#blue for user info
NC='\033[0m'						#no colour 

#defining variables

NAME=`whoami`						#username
DATE=`date +%F`						#date in YYYYMMDD format
TIME=`date +%R`						#time only
CDIR=`pwd`						#current location	
FILES=`ls | wc -l`					#list and count in directory
BIGF=`du -hsx * | sort -rh | head -1`			#list files by size and show the biggest one

echo -e "\nYour username is ${BLUE}$NAME${NC}" 	#-e is required to apply formatting
echo -e "Current date is ${BLUE}$DATE${NC}"
echo -e "Current time is ${BLUE}$TIME${NC}"
echo -e "Your current directory is ${BLUE}$CDIR${NC}"
echo -e "There is ${BLUE}$FILES${NC} file(s) in this directory"
echo -e "The biggest file in this directory is ${BLUE}$BIGF${NC}\n"
