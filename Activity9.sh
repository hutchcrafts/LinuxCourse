
find_file()
{
FILE=$x
if [[ -e "$FILE" ]]; then
	echo "File exists" 
else 
	echo "File does not exist, so it will be created"
	touch "$FILE"
fi
}

read -p "Enter name of the file to check if it exists: " x
find_file $x
