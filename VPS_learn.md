# VPS扩展

## simplefileserver

simplefileserver是一款可以将VPS里的文件通过网页的方式展现出来并用来实现下载的一个插件。以下是如何运行：

```shell
root@mao:~# sudo apt-get install python-setuptools

root@mao:~# pip install simplefileserver

root@mao:~# simplefileserver
Bottle v0.12.16 server starting up (using PasteServer())...
Listening on http://0.0.0.0:8080/
Hit Ctrl-C to quit.

serving on 0.0.0.0:8080 view at http://127.0.0.1:8080
////////////非必须
root@mao:~# simplefileserver 7090
Bottle v0.12.16 server starting up (using PasteServer())...
Listening on http://0.0.0.0:7090/
Hit Ctrl-C to quit.

serving on 0.0.0.0:7090 view at http://127.0.0.1:7090

///////////
```

然后通过ip:8080访问

## Aria2

一键操作如下

```shell
wget -N https://git.io/aria2.sh && chmod +x aria2.sh && bash aria2.sh
```

效果如下：

![](/img/Aria2-1.png)

关于BT-Tracker：（下载没有速度多半是因为BT-Tracker）

`https://trackerslist.com` 这个是个独立项目也提供更新，如果github访问慢可以使用这个
一般只需要将上面两个项目提供的trackers_best.txt文件的地址配置到aria2.conf的bt-tracker=的后面就可以加速，如果速度还是没有，也可将trackers_all.txt添加到bt-tracker=后面。

上面的方法需要复制trackers_best.txt中的地址到aria2.conf配置文件 中，这边提供一个脚本来自动执行，新建文件updateTracker.sh，将下面内复制进去，`chmod +x updateTracker.sh`增加执行权限，`./updateTracker.sh`地址就配置成功了，重启aria2，就可以下载了。

```shell
#!/bin/bash
list=`wget -qO- https://trackerslist.com/all.txt|awk NF|sed ":a;N;s/\n/,/g;ta"`
if [ -z "`grep "bt-tracker" /root/.aria2/aria2.conf`" ]; then
    sed -i '$a bt-tracker='${list} /root/.aria2/aria2.conf
    echo add......
else
    sed -i "s@bt-tracker=.*@bt-tracker=$list@g" /root/.aria2/aria2.conf
    echo update......
fi
```

## PuTTY 使用

* 如何使用PuTTY保存一个VPS的账号密码

  在Windows的桌面右键PuTTY，选择属性，修改目标为"C:\Program Files\PuTTY\putty.exe" -ssh -l root -pw xxx -P 22 xx.xx.xx.xx
