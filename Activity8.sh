#!/bin/sh

declare -a integers

integer()
{
read -p "Enter another number: " b </dev/tty

num=$b

for(( i=5; i<10; i++ ))
	do 
		read $num
if [ "$num" == stop ]
	break
elif [ "$i" == 10 ]
 	echo "You have entered &i numbers, that is enough!"
else
	integers[$i]="$num"
continue
fi
done
}



for(( i=0; i<5; i++))
do 
	read -p "Enter another number: " b </dev/tty
	integers[$i]=$b
done

read -p "You have entered &i numbers, do you want to continue? y/n " ANS </dev/tty

if [ "ANS"==y ]; then
	integer b
