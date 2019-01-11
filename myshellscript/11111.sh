#!/bin/bash
date=`date +%F`
dir="/root"
while :
do
	sleep 1
	[ ! -f $dir/$date/top ] && mkdir $dir/$date
	top -b -n 1 | head -6 >> $dir/$date/top
	sar 1 5 >> $dir/$date/cpu占用率
	df >> $dir/$date/df
for i in`cli <<EOF
show-status
EOF`
do
	echo $i >> $dir/$date/cli 
done
	zxstat > $dir/$date/zxstat
done
