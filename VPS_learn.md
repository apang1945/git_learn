# VPS学习

---

## 插件的安装

1. **simplefileserver**
   
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

2. **Aria2**
   
   一键操作如下
   
   ```shell
   wget -N https://git.io/aria2.sh && chmod +x aria2.sh && bash aria2.sh
   ```
   
   效果如下：
   
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

3. **V2Ray搭建**
   
   使用一键安装脚本，输入`bash <(curl -s -L https://git.io/v2ray.sh)`
   
   如果报错`unzip: 未找到命令`,输入``yum install -y unzip zip`安装即可。
   
   1. 传输协议默认的 `TCP` 即可；
   
   2. 端口号自己随意设置；
   
   3. 选择广告拦截，建议不要开启，开启广告拦截会消耗服务器资源；
   
   4. 选择开启SS：建议开启；
   
   5. 选择 SS 端口号：依然自己随意设置，但不可以和上面的 V2Ray 端口号一样；
   
   6. 选择 SS 加密协议：一般选择`chacha20-itef-poly1305`；
   
   7. 之后按两次回车即可

4. **PuTTY 使用**
   
   - 如何使用PuTTY保存一个VPS的账号密码
     
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
4. **Docker和Docker-compose的安装与卸载**
- 安装Docker：
  
  ```bash
  curl -fsSL https://get.docker.com -o get-docker.sh
  或者
  wget -qO- get.docker.com | bash
  
  sh get-docker.sh
  docker -v #查看Docker版本
  systemctl enable docker #Docker开机启动
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

- Docker的配置
  
  避免Docker日志文件过于多需要配置先配置一下Docker
  
  ```bash
  cd /etc/docker
  nano daemon.json
  ```
  
  daemon.json的配置在[这里](/tips/daemon.json)

- 卸载docker
  
  ```bash
  sudo apt-get remove docker docker-engine docker.io containerd runc
  或者以下命令
  sudo apt-get purge docker-ce docker-ce-cli containerd.io
  sudo rm -rf /var/lib/docker
  sudo rm -rf /var/lib/containerd
  ```

- 安装docker-compose
  
  ```bash
  sudo curl -L "https://github.com/docker/compose/releases/download/v2.14.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
  sudo chmod +x /usr/local/bin/docker-compose
  docker-compose --version
  ```

- **国内安装docker和docker-compose**
  
  - docker安装
    
    ```bash
    # 阿里云
    curl -sSL http://acs-public-mirror.oss-cn-hangzhou.aliyuncs.com/docker-engine/internet | sh -
    #DaoCloud
    curl -sSL https://get.daocloud.io/docker | sh
    ```
  
  - 卸载docker
    
    ```bash
    sudo apt-get remove docker docker-engine
    rm -fr /var/lib/docker/
    ```
  
  - 安装docker-compose
    
    ```bash
    curl -L https://get.daocloud.io/docker/compose/releases/download/v2.1.1/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
    chmod +x /usr/local/bin/docker-compose
    ```
5. **Centos7开启BBR加速**
   
   - yum来更新系统版本`yum update`
   
   - 查看系统版本`cat /etc/redhat-release`
   
   - 安装elrepo并升级内核
     
     ```bash
     rpm --import https://www.elrepo.org/RPM-GPG-KEY-elrepo.org
     rpm -Uvh http://www.elrepo.org/elrepo-release-7.0-2.el7.elrepo.noarch.rpm
     yum --enablerepo=elrepo-kernel install kernel-ml -y
     ```
   
   - 更新grub文件并重启系统
     
     ```bash
     egrep ^menuentry /etc/grub2.cfg | cut -f 2 -d \'
     grub2-set-default 0
     reboot
     ```
   
   - 开启BBR
     
     ```bash
     nano /etc/sysctl.conf
     #添加以下内容
     net.core.default_qdisc=fq
     net.ipv4.tcp_congestion_control=bbr
     ```
   
   - 验证是否开启
     
     ```bash
     lsmod | grep bbr  #返回tcp_bbr成功
     lsmod | grep fq  #返回sch_fq成功
     ```

6. **ohmyzsh**
   
   ohmyzsh的GitHub在[这里](https://github.com/ohmyzsh/ohmyzsh)，如果GitHub无法访问的话，尝试这个在gitee上同步的仓库，一般的vps没有包含zsh，zsh是一个shell解释器，用来执行相应的命令，感觉最便捷的一点就是可以自定义快捷的指令替换，来实现更短的语句实现同样的功能。具体的配置在[这里](/tips/zshrc)。
   
   卸载ohmyzsh，一般来说直接运行`uninstall_oh_my_zsh`即可，但是之前从Gitee上找的国内镜像运行说是`-bash: uninstall_oh_my_zsh: command not found`，这里就需要找到ohmyzsh的文件夹里的卸载程序了，输入`.oh-my-zsh/tools/uninstall.sh`即可解决，如果遇到`.sh`文件没有执行权限的话，进入到tools文件夹下，输入`chmod u+x uninstall.sh`，然后再运行即可解决。
   
   ```bash
   sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" #安装
   vim .zshrc #编辑配置文件
   source .zshrc #令上面修改的配置文件生效
   alias install="sudo apt-get install" #添加别名配置的例子
   ```
   
   **备注**：在卸载zsh之后千万不能急着执行`reboot`，因为此时的Shell解释器还是zsh，如果直接reboot的话，会导致系统开机无法找到zsh而卡住一直无法开机，这样的话就得重新安装系统了。**一定要注意**！！！
   
   此外以下是修改Shell解释器为默认bash的方法：
   
   ```bash
   cat /etc/shells #首先先查看系统中所有可用的shell
   # 接下来使用chsh命令来修改
   grep root /etc/passwd
   chsh --shell /bin/bash root
   grep root /etc/passwd
   ```

7. **为Docker添加定时重启**
   
   最近添加了Xiaoya大佬的[资源盘](http://alist.xiaoya.pro/)，Docker镜像在[这里](https://hub.docker.com/r/xiaoyaliu/alist)，具体操作只需要一个命令即可，因为使用的是5678端口，所以使用之前一定要检查端口占用，输入`lsof -i:5678`即可查询，然后输入`curl -s http://docker.xiaoya.pro/update_xiaoya.sh | bash`，直接运行即可。
   
   接下来介绍创建定时重启任务，首先创建一个文件夹来存放定时重启文件和日志记录，并加入`xiaoya-restart.sh`文件，之后的重启任务都可以仿照[这个](/tips/xiaoya-restart.sh)，之后运行`chmod u+x xiaoya-restart.sh`来增加执行权限，之后就需要将脚本加入定时任务中。
   
   输入`crontab -e`来编辑crontab文件，并加入定时任务，添加下面这条语句`0 */2 * * * /root/xxx/xiaoya-restart.sh`，注意将xxx替换为自己的路径，这个语句的定时是每隔两小时执行一次，如需要别的配置，只需要修改前边的语句即可，可以参考[crontab执行时间](https://tool.lu/crontab/)，还有一些具体的例子的解释用来学习，可以看这个[cron表达式详解](https://www.cnblogs.com/yanghj010/p/10875151.html)。之后需要重载crontab配置文件，博客文章里写的是执行`systemctl reload crond.service`，但是在Ubuntu系统运行之后报错`Failed to reload crond.service: Unit crond.service not found.`，查询之后发现：这是因为Ubuntu上的服务名称是cron不是crond，所以命令应该是：`sudo service cron start`

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

3. Docker修改映射的端口
   
   - 方法一
     
     删除原有容器`docker rm -f xxx`，修改`docker-compose.yml`文件，修改里边的端口，然后保存，之后运行：
     
     ```bash
     docker-compose down && docker-compose up -d
     ```
   
   - 方法二
     
     删除原有容器`docker rm -f xxx`，运行以下命令：
     
     ```bash
     docker run -d -p 8085:8085  -it --name 容器名称 镜像名称
     ```
   
   - 方法三
     
     ```bash
     docker stop container #停止docker容器
     docker commit container new_image:tag #commit该容器
     docker run -d -p 8888:8080 -it --name container01 new_image:tag #使用新镜像重新创建一个 Docker 容器
     
     #如果新容器想用回旧容器的名字，需要先删了旧容器，再改名
     docker rm -f container
     docker rename container01 container
     ```

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
   
   - 查看端口是否被占用`lsof -i:xxx`，xxx是端口号。

2. Luinx基本操作指令
   
   详细操作指令请到[这里](/tips/Lunix-order.md)查看
   
   解压压缩在[这里](/tips/unzip-learn.md)；
   
   mv命令在[这里](/tips/mv-learn.md)；

3. Docker基本操作指令
   
   详细操作指令请到[这里](/tips/Docker-orders.md)查看

4. Armbain无法连接GitHub
   
   下载github文件的时候会报错`Failed to connect to raw.githubusercontent.com port 443`，这个是因为github的dns被污染，导致域名解析失败，解决办法就是查真实IP，查询网站在[这里](https://www.ipaddress.com)，然后输入`raw.githubusercontent.com`查询即可，查询结果如下图
   
   ![](/img/armbian-github-1.png)
   
   比如选择第一个`185.199.108.133`，然后在终端输入`ping 185.199.108.133`，查看是否可以Ping通
   
   ![](/img/armbian-github-2.png)
   
   显示这样就表明可以Ping通，然后修改hosts即可
   
   输入`nano /etc/hosts`，将`185.199.108.133   raw.githubusercontent.com`添加进去即可完美解决。还有一个这个[GitHub520](https://github.com/521xueweihan/GitHub520)，但是还没有测试。

PS：备份一些经常使用的Tips

[咕咕鸽常用的脚本](https://blog.laoda.de/archives/useful-script)

---

## VPS常见错误解决

- **E: 仓库 “xxx” 没有 Release 文件**
  
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

- **rm: cannot remove ‘xxx‘: Is a directory**
  
  文件或者目录不能删除
  
  使用以下指令：
  
  ```bash
  rm -rf xxx #递归删除文件名或目录,-r是递归处理，就是一层一层的删,-f是强制删除
  sudo rm -d #-d删除文件夹
  ```

- **运行`./*.sh`提示`zsh: permission denied`**
  
  ```bash
  chmod u+x *.sh
  #chmod是权限管理命令change the permissions mode of a file的缩写。
  #u代表所有者。x代表执行权限。’+’ 表示增加权限。
  chmod u+x file.sh 就表示对当前目录下的file.sh文件的所有者增加可执行权限。
  ```

- **Debian更新软件报错**
  
  运行报错`Repository 'http://ftp.us.debian.org/debian bullseye InRelease' changed its 'Version' value from '11.5' to '11.6'`
  
  主要是说源从稳定源切换到不稳定源，运行`apt-get update --allow-releaseinfo-change`即可解决

- 运行`./*.sh`提示`-bash: ./*.sh: 权限不够`
  
  是因为没有权限，输入`chmod 777 ./*.sh`即可解决

- **Debian11中文显示乱码**
  
  安装locales
  
  `apt-get install locales`
  
  设置语言首选项
  
  `dpkg-reconfigure locales`
  
  此时选择`zh_CN.UTF-8`，注意空格是选择，回车是确定，按下空格之后再按回车，然后选择`zh_CN.UTF-8`，稍后`reboot`重启即可。
