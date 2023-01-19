#! /bin/bash
echo "重启xiaoya容器">> /root/taozi/restart.log
docker restart xiaoya
echo "重启命令的执行状态："$?>>echo "重启xiaoya容器">> /root/taozi/restart.log
if [ $? -eq 0 ]; then
    echo "执行成功！">> /root/taozi/restart.log
else
    echo "执行失败！">> /root/taozi/restart.log
    exit
fi
echo "重启xiaoya容器完毕！输出日志在/root/taozi/restart.log中">> /root/taozi/restart.log