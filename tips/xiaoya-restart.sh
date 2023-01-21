#! /bin/bash
echo "重启xiaoya容器">> /root/taozi/xiaoya/restart.log
NOW=`date`
docker restart xiaoya
echo "重启命令的执行状态："$?>>echo "重启xiaoya容器">> /root/taozi/xiaoya/restart.log
if [ $? -eq 0 ]; then
    echo "执行成功！">> /root/taozi/xiaoya/restart.log
else
    echo "执行失败！">> /root/taozi/xiaoya/restart.log
    exit
fi
echo "重启xiaoya容器完毕！当前时间为：$NOW">> /root/taozi/xiaoya/restart.log