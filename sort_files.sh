#!/bin/bash

# Sorts files in directory by first 2 name letters
# and moves them to created directories

clear
echo "Full path to directory"
read DIRECTORY
cd $DIRECTORY

clear
FILES=$(ls $DIRECTORY)
COUNT="1"
ALL_FILES=( $FILES )

for FILE_NAME in $FILES
do
	dir_name=$(echo $FILE_NAME | cut -c1-2)
	mkdir $dir_name > /dev/null 2>&1
	mv ./$FILE_NAME ./$dir_name

	echo "$FILE_NAME 	moved to	$dir_name 	($COUNT/${#ALL_FILES[@]})"
	COUNT=$((COUNT+1))
done

echo " "
echo "------------------------"
echo "-         DONE!        -"
echo "------------------------"