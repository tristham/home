#!/bin/bash
MESSAGE=$1

date >> espace.txt
echo $MESSAGE >> espace.txt
df -h | grep "sd" >> espace.txt
