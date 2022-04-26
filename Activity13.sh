#!/bin/sh

#defining colours

GRN='\033[0;32m'                                        #green 
BLUE='\033[0;34m'                                       #blue 
RED='\033[0;31m'                                        #red 
ORNG='\033[0;33m'                                       #orange
NC='\033[0m'                                            #no colour


check_file()
{
while true; read -p "Enter name of the file: " FILE     #defining input for function
do
        if [[ -e "$FILE" ]]; then                       #checking if file exists
        echo -e "\n${GRN}File $FILE exists${NC}\n" 
        break

        else
        echo -e "\n${RED}File does not exist, try again.${NC}\n"
        continue
        fi
done
}


find_comm()
{

diff -ui "$f1" "$f2" > change.txt

sed -i 1,2d change.txt

ch1=`awk '/^-/' change.txt`

ch2=`awk '/^+/' change.txt`

                                                #if elements found than print them 
        echo -e "\n${BLUE}Only in $f1${NC}\n$ch1"

        echo -e "\n${BLUE}Only in $f2${NC}\n$ch2"

#rm change.txt
}


#main code starts here

check_file FILE                                         #getting first file name
f1=$FILE

check_file FILE                                         #getting second file name
f2=$FILE

echo "You are comparing $f1 and $f2"

find_comm f1 f2                                         #comparing files 

