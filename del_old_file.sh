#!/bin/bash
path=/opt
disk_take=`df -h $path | tail -1 | awk -F ' ' '{print $5}' | awk -F '%' '{print $1}'`
apk_path=/opt/smmc/data_backup/apk

del_old_apk_file()
{
	if [ $disk_take -gt 70 ]
	then
		echo 'is over take up'
		find $apk_path -mtime +30 -name "*apk" -exec rm -rf {} \;
		echo '删除创建天数超过30的apk文件'
	fi
}

while :
do
	del_old_apk_file
	sleep 60
done