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

关于BT-Tracker：

