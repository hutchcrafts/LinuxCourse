#!/bin/sh



write_numbers()
{
FILE=$x
LINES=$y

		#[shuf -i X-Y -nZ | xargs -nT] draws Z numbers in scale X-Y, xargs -nT formats them in groups of T numbers per line.
echo $?

if [[ -e "$FILE" ]]; then
        echo "File already exists" 
	echo $?
else
        echo "File does not exist, so it was created"
        shuf -i 1-10000 -n"$y" | xargs -n1  > "$FILE"
	echo $?
fi
}

echo "Enter name of the file and number of lines: " 
read x y

write_numbers $x $y

