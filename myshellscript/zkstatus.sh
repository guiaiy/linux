#!/bin/bash
get_mode(){
exec 8<>/dev/tcp/$1/2181 
echo stat >&8
ZK_MODE=`cat <&8 | grep -Pi "^mode:"`
echo "${ZK_MODE:-NULL}"
exec 8<&-
}

for i in $@
do
	get_mode $i
done
