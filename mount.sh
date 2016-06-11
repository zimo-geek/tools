#!/bin/bash

#created by hyolin
#date 20160611

if [ $# -ne 2 ];then 
    echo "usage: proc dev func"
    exit 1
fi
#sudo mount -t ntfs  -o rw,uid=1000,gid=1000,umask=0033 /dev/sdb1 /media/hyolin
dev=$1
func=$2


#device type
dtype=`sudo blkid |grep $dev |awk '{print $4}' |awk -F '=' '{print $2}' | awk -F '"' '{print $2}'`
#device label
dlabel=`sudo blkid |grep $dev |awk '{print $2}' |awk -F '=' '{print $2}' | awk -F '"' '{print $2}'`
if [ $func == 'mount' ];then
    
    sudo mkdir -p /media/$dlabel
    if [ $? -eq 0 ];then
        sudo mount -t $dtype  -o rw,uid=1000,gid=1000,umask=0033 $dev /media/$dlabel
    fi
elif [ $func == 'umount' ];then
    sudo umount /media/$dlabel
    if [ $? -eq 0 ];then
        sudo rmdir /media/$dlabel
    fi
else 
    echo -e "${func} not supported!"
fi

    
