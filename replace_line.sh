#!/bin/bash
# Replaces one line on all files in specified directory.

clear
echo "Full path to source directory"
read DIRECTORY
cd $DIRECTORY

echo "Line nr you want to change"
read INPUT_STRING_NR
echo "Enter string you want to be placed in specified line"
read INPUT_STRING

clear
FILES=$(ls $DIRECTORY)
COUNT="1"
for FILE_NAME in $FILES
	do
	sed -i "$((INPUT_STRING_NR))c $INPUT_STRING" $FILE_NAME
	ALL_FILES=( $FILES )
	echo "$FILE_NAME			changed ($COUNT/${#ALL_FILES[@]})"
	COUNT=$((COUNT+1))
done
echo " "
echo "------------------------"
echo "-         DONE!        -"
echo "------------------------"