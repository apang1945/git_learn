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
if [ -z "`grep "bt-tracker" /root/.aria2c/aria2.conf`" ]; then
    sed -i '$a bt-tracker='${list} /root/.aria2c/aria2.conf
    echo add......
else
    sed -i "s@bt-tracker=.*@bt-tracker=$list@g" /root/.aria2c/aria2.conf
    echo update......
fi
```

## PuTTY 使用

* 如何使用PuTTY保存一个VPS的账号密码

  在Windows的桌面右键PuTTY，选择属性，修改目标为"C:\Program Files\PuTTY\putty.exe" -ssh -l root -pw xxx -P 22 xx.xx.xx.xx









## Ubuntu安装yum报错

* 安装报错E: Unable to locate package，解决办法如下：

  ![](/img/yum-1.png)

  首先备份sources.list文件,`sudo cp /etc/apt/sources.list /etc/apt/sources.list.backup`

  更换源`vim /etc/apt/sources.list` 然后按I进入编辑模式，粘贴命令`shift + insert`，选择[Ubuntu 20.04](https://mirrors.tuna.tsinghua.edu.cn/help/ubuntu/)然后在第一行添加镜像`deb http://archive.ubuntu.com/ubuntu/ trusty main universe restricted multiverse`
  
  最终sources.list文件如下：
  
  ![](/img/yum-2.png)
  
  然后更新源，并安装yum
  
  ```shell
  apt-get update
  apt-get install yum
  ```
  
  会有如下提示：`The following packages have unmet dependencies:`这个是缺少相关依赖，按照提示逐一安装即可。然后运行`sudo apt-get install yum `，安装结束后检查是否安装成功，运行`yum --version`即可。

## VPS安装Nodejs和Yarn
- 以 sudo 用户身份运行下面的命令，下载并执行 NodeSource 安装脚本
`curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash - `
这个脚本将会添加 NodeSource 的签名 key 到你的系统，创建一个 apt 源文件，安装必备的软件包，并且刷新 apt 缓存。 如果你需要另外的 Node.js 版本，例如`12.x`，将`setup_14.x`修改为`setup_12.x`。
- NodeSource 源启用成功后，安装 Node.js 和 npm：
`sudo apt install nodejs`
nodejs 软件包同时包含node和npm二进制包
- 验证 Node.js 和 npm 是否正确安装。打印它们的版本号：
输入`node --version`结果为`v14.2.0`

接下来是安装yarn
```
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo ”deb https://dl.yarnpkg.com/debian/ stable main“ | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt update && sudo apt install yarn
yarn --version
```