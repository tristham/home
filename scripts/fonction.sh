#!/bin/bash

function internet () {
ping -c 1  8.8.8.8

if  [ $? -eq 0 ]
then
	echo "La connectivité  vers internet est établie"
else 
	echo " Pas de connectivité vers internet"
fi 
}

internet
