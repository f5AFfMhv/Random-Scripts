#!/bin/bash

#########################################################
#Redaguota: 18-03-30									#
#Paskirtis: Pakeicia visu failu eilute direktorijoje	#
#########################################################

clear
# Gauti direktorija
echo "Pilnas kelias i direktorija"
read DIRECTORY
cd $DIRECTORY

# Gauti idedama teksta
echo "Kuria eilute pakeisti?"
read INPUT_STRING_NR
echo "Kokiu tekstu pakeisti?"
read INPUT_STRING

clear
FILES=$(ls $DIRECTORY)
COUNT="1"
for FILE_NAME in $FILES
	do
	sed -i "$((INPUT_STRING_NR))c $INPUT_STRING" $FILE_NAME 
	# Konvertuoti i eile
	ALL_FILES=( $FILES )
	echo "$FILE_NAME			pakeista ($COUNT/${#ALL_FILES[@]})"
	COUNT=$((COUNT+1))
done
echo " "
echo "------------------------"
echo "-        BAIGTA!       -"
echo "------------------------"