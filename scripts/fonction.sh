#!/bin/bash

function internet () {
ping -c 1  8.8.8.8

if  [ $? -eq 0 ]
then
	echo "La connectivit√©  vers internet est √©tablie"
else 
	echo " Pas de connectivit√© vers internet"
fi 
}

internet
