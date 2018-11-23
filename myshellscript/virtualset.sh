rpm -q libguestfs-tools-c &> /dev/null || yum -y install libguestfs-tools-c
i=0
mountpoint="/media/virtimage"
echo "请在一行输入一个虚拟机名称,IP地址,网卡名称,以空格隔开
也可以事先输入文件，以文件作为参数执行
如果网卡名称和上一行一致,可以不输入网卡名
输入end或两次回车结束输入" 
###定义一个函数,将数据存入数组###
superread (){
read -t 20 name addr devname
dev=${devname:-$dev}
[ "$name" == "" ] && break
[ $name == "end" ] && break
if virsh domstate $name |grep -q running ;then
echo "修改虚拟机网卡数据,需要关闭虚拟机"
echo "虚拟机已经关闭，请继续输入"
virsh destroy $name
fi
[ ! -d $mountpoint ]&& mkdir $mountpoint
if mount | grep -q "$mountpoint" ;then
umount $mountpoint &>/dev/null
fi
na[$i]=$name
de[$i]=$dev
ad[$i]=$addr
}
if [ $# -eq 0 ];then
while :
do
superread
let i++
done
else
echo "$1 的内容为"
cat $1
read -t 10 -p '你确定吗？(y/n)' confirm
[ "$confirm" != "y" ] && echo "已退出" && exit
while :
do
superread
let i++
done < $1
fi
for j in `seq 0 $[i-1]`
do
echo '正在更改"'${na[$j]}'"的配置，请稍后'
umount $mountpoint &>/dev/null
sleep 3
wait
guestmount -d ${na[$j]} -i $mountpoint
wait
mip=${ad[$j]%.*}
nip=${mip##*.}
sip=${ad[$j]%.*}.254
[ -d $mountpoint ] && rm -rf $mountpoint/etc/sysconfig/network-scripts/ifcfg-${de[$j]}
echo "BROWSER_ONLY=no
BOOTPROTO=static
DEFROUTE=yes
IPV4_FAILURE_FATAL=no
IPV6INIT=yes
IPV6_AUTOCONF=yes
IPV6_DEFROUTE=yes
IPV6_FAILURE_FATAL=no
IPV6_ADDR_GEN_MODE=stable-privacy
NAME=${de[$j]}
DEVICE=${de[$j]}
IPADDR=${ad[$j]}
ONBOOT=yes
PREFIX=24" >> $mountpoint/etc/sysconfig/network-scripts/ifcfg-${de[$j]}
[ $nip -eq 122 ] && echo "GATEWAY=$sip" >> $mountpoint/etc/sysconfig/network-scripts/ifcfg-${de[$j]}
[ -d $mountpoint ] && rm -rf $mountpoint/etc/hostname
echo "${na[$j]}.tedu.cn" >> $mountpoint/etc/hostname 
[ $nip -eq 122 ] || echo "[rhel7]
name=rhel7
baseurl=ftp://$sip/rhel7
enabled=1
gpgcheck=0" >> $mountpoint/etc/yum.repos.d/rhel7.repo
mkdir $mountpoint/root/.ssh/ &> /dev/null
\cp -rf /var/ftp/authorized_keys $mountpoint/root/.ssh/authorized_keys
[ -d $mountpoint ] && rm -rf $mountpoint/etc/resolv.conf
cp /var/ftp/autojump_v21.1.2.tar.gz $mountpoint/root/
echo "nameserver 222.246.129.80" >> $mountpoint/etc/resolv.conf
#如果网卡配置文件中有客户配置的 IP 地址,则脚本提示修改 IP 完成
awk -F= -v x=${ad[$j]} '$2==x{print "完成..."}' $mountpoint/etc/sysconfig/network-scripts/ifcfg-${de[$j]}
umount $mountpoint &> /dev/null
sleep 3
wait
done
umount $mountpoint &> /dev/null 
echo '所有设置完成'
