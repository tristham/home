#!/bin/bash

CHIFFRE1='16'
CHIFFRE2='15'

if [ $CHIFFRE1 -lt $CHIFFRE2 ]
then
echo  "$CHIFFRE! est plus petit que  $CHIFFRE2"

elif  [ $CHIFFRE1 -gt $CHIFFRE2 ]
then
echo "$CHIFFRE1 est plus grand  que $CHIFFRE2"

else
echo "$CHIFFRE 1 est égale  à $CHIFFRE2"
fi

