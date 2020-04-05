#!/bin/bash

#################################################
# Redaguota:	2018-10-29						#
# Paskirtis:	Isrusiuoja nordVPN failus pagal #
#				salies koda i katalogus su 		#
#				salies pavadinimu				#
#################################################


clear
# Gauti direktorija
echo "Pilnas kelias i direktorija"
read DIRECTORY
cd $DIRECTORY
clear
FILES=$(ls $DIRECTORY)
COUNTRY_CODES=$(cat ~/skriptai/Country_ISO_codes.txt | awk '{print $1}')
COUNTRIES=$(cat ~/skriptai/Country_ISO_codes.txt | awk '{$1=""; print $0}')
COUNT="1"

# konvertuoti i array
ALL_FILES=( $FILES ) 
#ALL_COUNTRY_CODES=( $COUNTRY_CODES )
ALL_COUNTRIES=($COUNTRIES)


for FILE_NAME in $FILES
do
	CODE=$(echo $FILE_NAME | cut -c1-2 | awk '{print toupper($0)}')
	COUNTER="0"
	for i in $COUNTRY_CODES
	do
		if [[ $i = $CODE ]]
		then
			dir_name=${ALL_COUNTRIES[$COUNTER]} 
		fi
		COUNTER=$((COUNTER+1))
	done
	mkdir $dir_name > /dev/null 2>&1
	mv ./$FILE_NAME ./$dir_name
	echo "$FILE_NAME 	perkeltas i 	$dir_name 	($COUNT/${#ALL_FILES[@]})"
	COUNT=$((COUNT+1))
done

echo " "
echo "------------------------"
echo "-        BAIGTA!       -"
echo "------------------------"