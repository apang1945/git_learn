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

## Docker的安装与卸载

卸载docker
`sudo apt-get remove docker docker-engine docker.io containerd runc`
一键安装Docker

```
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh
```

[其他Docker安装](https://docs.docker.com/engine/install)

## Docker相关问题及解决方法

1. 删除容器报错image is being used by stopped container eca596ce0f9d
   
   该报错的原因是要删除的该镜像,被某个容器所引用
   
   首先查看所有的容器,包括未运行的容器
   
   `docker ps -a`运行结果如下
   
   ![](/img/docker-images-1.png)
   
   然后执行命令`docker rm <容器ID>`，`docker rmi <镜像ID>`
   
   ![](/img/docker-images-2.png)
   
   这样就可以删除被容器引用的镜像了。
   
   执行`docker image ls`列举容器所包含的镜像
   
   ![](/img/docker-images-3.png)
   
   执行`docker image rm 56d`删除镜像
   
   ![](/img/docker-images-4.png)
   
   扩展：如果要删除本地的镜像，可以使用 docker image rm 命令，其格式为：`docker image rm [选项] <镜像1> [<镜像2> ...]`，其中，`<镜像>` 可以是`镜像短ID`、`镜像长ID`、`镜像名` 或者 `镜像摘要`。
   
   我们可以用镜像的完整 ID，也称为 `长 ID`，来删除镜像。使用脚本的时候可能会用`长 ID`，但是人工输入就太累了，所以更多的时候是用 `短 ID` 来删除镜像。`docker image ls` 默认列出的就已经是短 ID 了，一般取前3个字符以上，只要足够区分于别的镜像就可以了。
   
   所以删除一个镜像可以使用以下命令：`docker image rm 501`或者`docker image rm centos`或者再精确一些docker image ls --digests，之后执行`docker image rm (name@digest)`。
   
   此外可以成批删除镜像，比如可以使用 `docker image ls -q` 来配合使用 `docker image rm`，这样可以成批的删除希望删除的镜像。
   
   比如，我们需要删除所有仓库名为 `redis` 的镜像：
   
   `docker image rm $(docker image ls -q redis)`
   
   或者删除所有在 `mongo:3.2` 之前的镜像：
   
   `docker image rm $(docker image ls -q -f before=mongo:3.2)`

## Lunix放行指定端口

1. 查看防火墙状态
   
   `firewall-cmd --state` running代表防火墙正在运行中,如果防火墙处在关闭状态,则运行下面命令开启防火墙`systemctl start firewalld.service`

2. 查看某个端口是否放行
   
   `firewall-cmd --query-port=端口号/tcp`

3. 放行指定端口
   
   `firewall-cmd --zone=public --add-port=8080/tcp --permanent`

4. 重启防火墙和重新载入配置
   
   `systemctl restart firewalld.service`
   
   `firewall-cmd --reload`


