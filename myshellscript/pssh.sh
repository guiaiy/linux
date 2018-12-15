#!/bin/bash
bf=$2
bingfa=${bf:-1}
n=0
dir="/tmp"
[ ! -f /root/.ssh/know_hosts ] || rm -rf /root/.ssh/know_hosts
superread (){
read -t 20 pp addr ss
[ "$addr" == "" ] && break
[ $addr == "end" ] && break
ad[$1]=$addr
}
echo "环境准备中请稍后。。。"
sleep 2
rpm -q pssh &> /dev/null || yum -y install pssh
p=$1
if [ -f $p ];then
        echo "$1 的内容为"
        cat $1
        read -t 10 -p '你确定吗？(y/n)' confirm
        [ "$confirm" != "y" ] && echo "已退出" && exit
	while :
	do
		superread $i
		let i++
	done < $1
	start_time=`date +%s`
	rm -rf $dir/host.txt
	echo `awk '{print $2}' $1` >> $dir/host.txt
	sed -i "/[ ]/s/[ ]/\n/g" $dir/host.txt
	num=0
	for i in $@
	do
		let num++ 
		if  [ $num -gt 2 ];then
			pscp.pssh -h $dir/host.txt -O "StrictHostKeyChecking=no" $i /tmp/
			pssh -h $dir/host.txt -t 1000 -p $bingfa -P "source /tmp/${i##*/}"
		fi
	done
	wait
	stop_time=`date +%s`
	echo "TIME:`expr $stop_time - $start_time`"
else
	start_time=`date +%s`
        num=0
        for i in $@
        do
                let num++
                if  [ $num -gt 1 ];then
                        pscp.pssh -H $p -O "StrictHostKeyChecking=no" $i /tmp/
                        pssh -H $p -t 1000 -P "source /tmp/${i##*/}"
                fi
        done
        wait
        stop_time=`date +%s`
        echo "TIME:`expr $stop_time - $start_time`"
fi
