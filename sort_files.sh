#!/bin/bash

#################################################
# Redaguota:	2018-07-18						#
# Paskirtis:	Isrusiuoja failus kataloge		#
#				pagal pirmas 2 pavadinimo		#
#				raides ir sukuria jiem aplanka	#
#				direktorijoje					#
#################################################


clear
# Gauti direktorija
echo "Pilnas kelias i direktorija"
read DIRECTORY
cd $DIRECTORY

clear
FILES=$(ls $DIRECTORY)
COUNT="1"
ALL_FILES=( $FILES ) # konvertuoti i array

for FILE_NAME in $FILES
do
	dir_name=$(echo $FILE_NAME | cut -c1-2)
	mkdir $dir_name > /dev/null 2>&1
	mv ./$FILE_NAME ./$dir_name
	
	echo "$FILE_NAME 	perkeltas i 	$dir_name 	($COUNT/${#ALL_FILES[@]})"
	COUNT=$((COUNT+1))
done

echo " "
echo "------------------------"
echo "-        BAIGTA!       -"
echo "------------------------"