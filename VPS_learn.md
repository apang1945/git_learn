# VPS学习

## 软件和环境的搭建

### simplefileserver

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

### Aria2

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

### V2Ray搭建

使用一键安装脚本，输入`bash <(curl -s -L https://git.io/v2ray.sh)`

如果报错`unzip: 未找到命令`,输入``yum install -y unzip zip`安装即可。

1. 传输协议默认的 `TCP` 即可；

2. 端口号自己随意设置；

3. 选择广告拦截，建议不要开启，开启广告拦截会消耗服务器资源；

4. 选择开启SS：建议开启；

5. 选择 SS 端口号：依然自己随意设置，但不可以和上面的 V2Ray 端口号一样；

6. 选择 SS 加密协议：一般选择`chacha20-itef-poly1305`；

7. 之后按两次回车即可

### PuTTY 使用

* 如何使用PuTTY保存一个VPS的账号密码
  
  在Windows的桌面右键PuTTY，选择属性，修改目标为"C:\Program Files\PuTTY\putty.exe" -ssh -l root -pw xxx -P 22 xx.xx.xx.xx

---

## VPS安装依赖和插件

1. **Nodejs和Yarn**
- 以 sudo 用户身份运行下面的命令，下载并执行 NodeSource 安装脚本
  `curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash - `
  这个脚本将会添加 NodeSource 的签名 key 到你的系统，创建一个 apt 源文件，安装必备的软件包，并且刷新 apt 缓存。 如果你需要另外的 Node.js 版本，例如`12.x`，将`setup_14.x`修改为`setup_12.x`即可。

- NodeSource 源启用成功后，安装 Node.js 和 npm：
  `sudo apt install nodejs`
  nodejs 软件包同时包含node和npm二进制包

- 验证 Node.js 和 npm 是否正确安装。打印它们的版本号：
  输入`node --version`结果为`v14.2.0`

- 接下来是安装yarn
  
  ```bash
  curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
  echo ”deb https://dl.yarnpkg.com/debian/ stable main“ | sudo tee /etc/apt/sources.list.d/yarn.list
  sudo apt update && sudo apt install yarn
  yarn --version
  ```
2. **Centos7最小系统安装vim**
- 输入vim显示未找到命令，接下来要查询vim的包

- 输入`rpm -qa|grep vim`
  
  ![](/img/vim-install-1.png)

- 缺少几个可以使用`yum -y install vim-enhanced`，缺少较多使用`yum -y install vim*`，安装完成后就能使用vim了。可以对vim进行配置，如果想要对所有用户生效则使用全局配置，编辑`/etc/vimrc`配置文件即可。

- 简单配置如下：
  
  ```bash
  set encoding=utf-8      " 设定vim缓冲区以及界面的字符编码为utf-8
  set terencoding=utf-8  " 设定终端使用的字符编码为utf-8
  set fileencodings=utf-8,gbk,latin1      " 设定磁盘文件的字符编码优先为utf-8
  set nocompatible        " 关闭vi兼容模式
  set number              " 设定显示行号
  set ruler               " 设定在状态栏显示光标所在的行数等信息
  set cursorline          " 设定光标线突出显示当前行
  set showmode            " 设定在命令行界面最下面显示当前模式
  set showcmd             " 设定显示输入的命令
  set shiftwidth=4        " 设定<<和>>命令移动4个空格
  set softtabstop=4       " 设定退格键时一次删除4个空格
  set tabstop=4           " 设定tab为4个空格
  set autoindent          " 继承前一行的缩进方式，适用于多行注释
  set autochdir           " 设定自动切换当前目录为当前文件所在的目录
  set ignorecase          " 设定搜索的时忽略大小写
  set nowrapscan          " 禁止在搜索到文件两端时重新搜索
  set incsearch           " 输入搜索内容时就显示搜索结果
  set hlsearch            " 搜索时高亮显示被找到的文本
  set smartindent         " 设定开启新行时使用智能自动缩进
  set completeopt=preview,menu    " 设定代码补全
  set noerrorbells        " 设定关闭错误响铃
  set nobackup            " 设定不使用备份
  ```
3. **Centos7更新Git版本**
- 安装依赖包
  
  ```bash
  yum install curl-devel expat-devel gettext-devel openssl-devel zlib-devel asciidoc -y
  yum install  gcc perl-ExtUtils-MakeMaker -y
  ```

- 卸载旧版本`yum remove git`，git源码包[下载地址](https://mirrors.edge.kernel.org/pub/software/scm/git/)

- 打开用于存放下载的git包的文件夹`cd /usr/local/src/`

- 下载git压缩包`wget xxx（git-download-link）`

- 解压压缩包`tar -xvf git-2.xx.x.tar.xz`，并打开`cd git-2.xx.x`

- 编译并安装`make prefix=/usr/local/git all`，`make prefix=/usr/local/git install`

- 配置环境变量
  
  `echo "export PATH=$PATH:/usr/local/git/bin" >> /etc/profile && source /etc/profile`

- 随后验证git版本即可。
3. **Docker的安装与卸载**
   
   卸载docker `sudo apt-get remove docker docker-engine docker.io containerd runc` 一键安装Docker
   
   ```
   curl -fsSL https://get.docker.com -o get-docker.sh
   sh get-docker.sh
   ```
   
   Ubuntu 和 Debian 系统：
   
   `curl -sSL https://get.docker.com/ | sh`
   
   其他方式：
   
   ```bash
   # 阿里云
   curl -sSL http://acs-public-mirror.oss-cn-hangzhou.aliyuncs.com/docker-engine/internet | sh -
   #DaoCloud
   curl -sSL https://get.daocloud.io/docker | sh
   ```
   
   [其他Docker安装1](https://docs.docker.com/engine/install)
   
   [其他Docker安装2](https://blog.csdn.net/m0_37607365/article/details/79811086)

---

## Docker相关问题及解决方法

1. **删除容器报错image is being used by stopped container eca596ce0f9d**
   
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

2. **Docker在部署Wechat-chatgpt的总结**
   
   - `curl -S https://myip.ipip.net/`这个指令可以用来查询机器的IP以及所在位置
     
     ![](/img/ip-test.png)
   
   - 然后`cp config.yaml.example config.yaml`，这条指令的意思就是创建一个`config.yaml.example`和`config.yaml`，这个用来存放OpenAI的账号的相关信息，例子如下：
     
     ```yaml
     chatGPTAccountPool:
       -  session_token: xxx
     chatPrivateTiggerKeyword: ""
     openAIProxy: ""
     clearanceToken: "xxx"
     userAgent: "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36" 
     ```
     
     这些相关的参数在[OpenAI](https://chat.openai.com/chat)，登录账号之后，按F12打开开发者模式，选择应用，找到cookies，然后查找相关的数据。还有一个操作是`cat`指令，查看文件内容。
     
     `docker build . -t wechat-chatgpt_local:1.2.2`，这条指令的意思是构建镜像，`-t`的意思是添加标签，这里我们添加的标签是`wechat-chatgpt_local:1.2.2`，`.`的含义是表示当前目录，典型用法如下：`docker build -t ImageName:TagName dir`
   
   - 之后执行`docker-compose down&& docker-compose up -d`这条指令是用来更新容器的。
   
   - 执行`dockers logs -f xxx`可以查看xxx容器的输出日志。

---

## VPS常见命令及操作

1. Lunix放行指定端口
   
   - 查看防火墙状态
     
     `firewall-cmd --state` running代表防火墙正在运行中,如果防火墙处在关闭状态,则运行下面命令开启防火墙`systemctl start firewalld.service`
   
   - 查看某个端口是否放行
     
     `firewall-cmd --query-port=端口号/tcp`
   
   - 放行指定端口
     
     `firewall-cmd --zone=public --add-port=8080/tcp --permanent`
   
   - 重启防火墙和重新载入配置
     
     `systemctl restart firewalld.service`
     
     `firewall-cmd --reload`

---

## VPS常见错误解决

- **E: 仓库 “xxx” 没有 Release 文件 **
  
  首先直接输入`cd /etc/apt/sources.list.d`
  
  因为报错是（E: 仓库 “…/bzindovic/… Release” 没有 Release 文件
  ），应该更改 sources.list.d 里的“bzindovic”，在/etc/apt/sources.list.d 的路径下，输入ls 查看文件目录，找到需要删除的文件
  
  在终端输入`sudo mv 要更改的文件.list + 要更改的文件.list.bak` （而不是输入sudo mv 要更改的文件.list.bak ）
  
  例如：` sudo mv bzindovic-ubuntu-suitesparse-bugfix-1319687-bionic.list   bzindovic-ubuntu-suitesparse-bugfix-1319687-bionic.list.bak`
  
  然后再运行`sudo apt-get update `就不会报错了

- **/bin/sh  cc:  未找到命令**
  
  失败原因是未安装gcc
  
  解决办法：`yum install gcc-c++ -y`

- **Ubuntu安装yum报错**
  
  安装报错E: Unable to locate package，解决办法如下：
  
  首先备份sources.list文件,`sudo cp /etc/apt/sources.list /etc/apt/sources.list.backup`
  
  更换源`vim /etc/apt/sources.list` 然后按I进入编辑模式，粘贴命令`shift + insert`，选择[Ubuntu 20.04](https://mirrors.tuna.tsinghua.edu.cn/help/ubuntu/)然后在第一行添加镜像`deb http://archive.ubuntu.com/ubuntu/ trusty main universe restricted multiverse`
  
  最终sources.list文件如下：
  
  然后更新源，并安装yum
  
  ```shell
  apt-get update
  apt-get install yum
  ```
  
  会有如下提示：`The following packages have unmet dependencies:`这个是缺少相关依赖，按照提示逐一安装即可。然后运行`sudo apt-get install yum` ，安装结束后检查是否安装成功，运行`yum --version`即可。

- **Ubuntu安装Vim时报错，Waiting for cache lock: Could not get lock /var/lib/dpkg/lock-frontend. It is held**
  
  首先运行的是`apt install vim`这条指令，后来就报错`Waiting for cache lock: Could not get lock /var/lib/dpkg/lock-frontend. It is held`，报错如下图所示：
  
  ![](/img/vim_install_wrong.png)
  
  **解决办法为：**
  
  因为我是在运行`apt install xxx`出错，所以先输入`ps afx|grep apt`来查看系统现在和apt有关的进程，输入之后结果如下：
  
  ![](/img/vim_install_wrong1.png)
  
  图中显示vim存在一个进程，而且显示了这个进程的编号1509，所以接下来输入`kill 1509`，之后在运行`ps afx|grep apt`，就看到没有vim相关的进程了，之后安装vim就非常顺利了。
  
  ![](/img/vim_install_wrong2.png)
  
  **扩展：**
  
  `ps afx|grep apt`这条指令的用途是查看系统相关进程
  
  **ps**将某个进程显示出来。
  
  **grep**命令是查找，是一种强大的文本搜索工具，它能使用正则表达式搜索文本，并把匹配的行打印出来。
