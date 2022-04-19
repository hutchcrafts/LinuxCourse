#!/bin/bash

DAY=$(date +%F)

for FILE in *
 do
    mv $FILE ${DAY}-${FILE}
 done

echo -e "\nFiles in this directory have been renamed\n"
