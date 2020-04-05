#!/bin/bash

#########################################################
#Redaguota: 19-03-12									#
#Paskirtis: Paskaiciuoja ivesto slaptazodzio sha1 hasha	#
#			ir patikrina pwnedpasswords duomenu bazeje	#
#			pagal pirmus 5 hash simbolius				#
#########################################################

clear
# Gauti slaptazodi
echo "Ivesk slaptazodi"
read PASSWORD

HASH=$(echo -n $PASSWORD | sha1sum | awk '{print $1}')
HASH_PREFIX=$(echo $HASH | cut -c -5)
HASH_SUFIX=$(echo $HASH | cut -c6-)
curl https://api.pwnedpasswords.com/range/$HASH_PREFIX | grep -i $HASH_SUFIX > /tmp/pwn_result

clear
echo "--------------------------------------------------------------"
echo -n "SHA1 hash: "
echo $HASH
echo -n "Tikrinu DB pagal: "
echo $HASH_PREFIX
echo -n "Isrenku is rezultatu: "
echo $HASH_SUFIX
echo "--------------------------------------------------------------"
echo "Rezultatas:"
cat /tmp/pwn_result
rm -f /tmp/pwn_result