#!/bin/bash

while [ -z $PRENOM ]
do 
read -p "Quel est votre prnénom ? "  PRENOM
done

echo "Votre prénom est $PRENOM"
