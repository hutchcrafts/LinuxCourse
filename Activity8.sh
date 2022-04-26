#!/bin/sh

#define colours

GRN='\033[0;32m'                                        #green 
BLUE='\033[0;34m'                                       #blue 
RED='\033[0;31m'                                        #red 
ORNG='\033[0;33m'                                       #orange
NC='\033[0m'                                            #no colour

declare -a integers					#declare array
declare -i num count=0 					#declare integer


#define functions

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

check_num()						#function to accept only numerical input
{
while true; read -p "Enter number: " num   

do							#check if the input is numerical
	echo "$num" | grep -q '[[:punct:]]' || echo "$num" | grep -iq [a-z]  	#grep -i is for case insensitive; 
										#grep -q for search without results output
	if test $? -eq 0 ; 				#if input is incorrect
	then
		echo -e "${RED}This is not a number! Try again ${NC}"
	continue					#go to enter input again
		
	else
		break
	fi
done
	
}


add_num()						#function to add number
{
check_num

echo " "

integers+=($num)

count=$count+1
}


#calculations functions

sum_int()					#sum of integers
{
sum=0

for i in ${integers[@]}; 
	do
  		sum=`expr $sum + $i`
	done

echo -e "${ORNG}Sum of entered integers is: ${GRN}$sum${NC}"
}

prod_int() 					#product of integers
{
multi=1

for i in "${integers[@]}"; 
	do
        	multi=`expr $multi \* $i`
    	done

echo -e "${ORNG}Product of entered integers is: ${GRN}$multi${NC}"
}

av_int()					#average of integers
{
sum_int

	avrg=`expr $sum / ${#integers[*]}`

echo -e "${ORNG}Average of entered integers is: ${GRN}$avrg${NC}"
}


min_int()					#min of integers
{
min=${integers[0]}

for i in "${integers[@]}"; 
	do
		(( i < min )) && min=$i
	done
echo -e "${ORNG}Min of entered integers is: ${GRN}$min${NC}"
}


max_int()					#max of integers
{
max=${integers[0]}

for i in "${integers[@]}"; 
	do
  		(( i > max )) && max=$i
	done

echo -e "${ORNG}Max of entered integers is: ${GRN}$max${NC}\n"
}



#main code starts here

echo -e "\n${BLUE}First you will be asked to enter 5 numbers, then you can decide if you want to add more numbers (up to 10)${NC}\n"

for count in {1..5} 
do
	add_num
	
done


while true; 
do
	echo -e "\n${BLUE}Do you want to add another number? ${NC}"
	check_ans

	if [ "$count" == "11" ]; then
		echo -e "\n${RED}That is enough! You have put 10 numbers, I can't take more!${NC}"
		break
	
	elif [ "$ans" == "y" ]; then
		add_num
		
		continue
	elif [ "$ans" == "n" ]; then
		break 
	fi
done

echo -e "\n\n${BLUE}Numbers you have entered: \n${GRN}${integers[@]}${NC}\n"

prod_int
av_int
sum_int
min_int
max_int


