#!/bin/bash
path=/home/sheldon/learn/shell/sed
disk_take=`df -h $path | tail -1 | awk -F ' ' '{print $5}' | awk -F '%' '{print $1}'`

del_old_apk_file()
{
	if [ $disk_take -gt 26 ]
	then
		echo 'is over take up'
		find $path -mtime +30 -name "*apk" -exec rm -rf {} \;
		echo '删除创建天数超过30的apk文件'
	fi
}

while :
do
	del_old_apk_file
	sleep 10
done