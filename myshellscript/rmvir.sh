#!/bin/bash
set -- `getopt b: "$@"`
	case $1 in
	-b)	if [ $# -eq 5 ];then
			for i in `seq $4  $5`
			do
				virsh destroy $2$i &> /dev/null
				virsh undefine $2$i
				rm -rf /var/lib/libvirt/images/$2$i.img
			done
		elif [ $# -lt  5 ];then
			virsh destroy $2$4 &> /dev/null
			virsh undefine $2$4
			rm -rf /var/lib/libvirt/images/$2$4.img
		fi;;
	*)	for i in $@
 		do	 
			[ $i == "--" ] && continue 
			virsh undefine $i
			rm -rf /var/lib/libvirt/images/$i.img
		done ;;
	esac

