#!/bin/bash

# Martynas J.
# Takes password as an input and calculates sha1 sum.
# Gets all sha1 sums from pwnedpasswords database, that matches 5 first chars with calculated sum.
# Finds if there are exact sha1 sum matches localy and returns results.

clear
echo "Enter password"
read -s PASSWORD

clear
HASH=$(echo -n $PASSWORD | sha1sum | awk '{print $1}')
HASH_PREFIX=$(echo $HASH | cut -c -5)
HASH_SUFIX=$(echo $HASH | cut -c6-)
echo -n "SHA1 hash of your password: "
echo $HASH
echo -n "Getting all records from DB that matches: "
echo $HASH_PREFIX
PWN_COUNT=$(curl -s https://api.pwnedpasswords.com/range/$HASH_PREFIX | grep -i $HASH_SUFIX | awk -F ':' '{print $2}')
echo "Number of times your password was leaked:" ${PWN_COUNT}
