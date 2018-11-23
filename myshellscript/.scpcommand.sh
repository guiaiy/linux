#!/bin/bash
ip=x
read -p '请输入目标ip地址(原ip直接回车,或者输入q退出)：'  ipp
ip=${ipp:-$ip}
[ "$ip" == "q" ] && exit
read -p '请输入脚本位置(原脚本直接回车)： '  lo
location=${lo:-$location}
chmod +x $location
ping -c2 $ip &>/dev/null
[ $? -ne 0 ] && continue
[ ! -f $location ] && continue
sh=${location##*/}
pssh -t 3 -H $ip pwd &>/dev/null
if [ $? -ne 0 ];then
ssh-copy-id -o StrictHostKeyChecking=no $ip
ssh -o StrictHostKeyChecking=no root@$ip "mkdir /root/.script &>/dev/null"
scp -o StrictHostKeyChecking=no $location root@$ip:/root/.script/ &>/dev/null
ssh -o StrictHostKeyChecking=no root@$ip "/root/.script/$sh"
else 
ssh -o StrictHostKeyChecking=no root@$ip "mkdir /root/.script &>/dev/null"
scp -o StrictHostKeyChecking=no $location root@$ip:/root/.script/ &>/dev/null
ssh -o StrictHostKeyChecking=no root@$ip "/root/.script/$sh"
fi
