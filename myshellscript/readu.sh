#!/bin/bash
while read -u3 i && read -u4 j;do 
echo $i $j 
done 3<1.txt 4<2.txt
