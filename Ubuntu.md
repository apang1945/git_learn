## Ubuntu安装Clash和Qv2ray以及如何创建启动应用程序

### Qv2ray

**一个坏消息是Qv2ray已经停止更新了**，太难受了，原项目地址在[这里](https://github.com/Qv2ray/Qv2ray/releases),直接下载`.AppImage`后缀的文件，之后给执行权限`sudo chmod 777 -R Qv2ray.v2.7.0-pre1.linux-x64.AppImage`，由于Qv2ray本身并不自带v2ray核心，安装完成后，需要去 github下载 v2ray的核心文件。V2ray核心的项目文件[在这里](https://github.com/v2fly/v2ray-core/releases)，安装最新版本一直报错，说是内核启动失败，后来看了网上大佬们的做法，换了养老版本4.45.2，地址在[这里](https://github.com/v2fly/v2ray-core/releases/tag/v4.45.2)，下载好之后点击上边下载的Qv2ray，双击之后会进入到图形化界面，然后点击左上角的首选项按钮，然后点击内核设置，里边有一个V2Ray资源目录，将资源目录的路径复制，之后执行以下指令：

```bash
mv ./v2ray/* /home/iguge/snap/qv2ray/3384/.config/qv2ray/vcore/ 
#这句话是将下载好的v2ray内核移动到资源目录
```

然后点击检查核心设置，此时换了4.45.2版本绝对没有任何问题，然后添加订阅之后即可。

#clash

在F大的仓库里下载适用于Linux的文件，目前的最新版本是`Clash.for.Windows-0.20.14-x64-linux.tar.gz`，下载地址在[这里](https://github.com/Fndroid/clash_for_windows_pkg/releases)，解压文件之后进入，运行`./cfw`即可开启Clash。之后只需要在系统的网络里加入代理，将端口设置为7890即可。

### 将AppImage加入桌面

详细参考[这里](/tips/AppImage.md)

### Ubuntu里常用的媒体播放器

| 播放器           | 安装指令                                   |
| ------------- | -------------------------------------- |
| VLC           | `sudo apt install vlc`                 |
| MPlayer       | `sudo apt install mplayer mplayer-gui` |
| SMPlayer      | `sudo apt install smplayer`            |
| MPV播放器        | `sudo apt install mpv`                 |
| Dragon Player | `sudo apt install dragonplayer`        |
| GNOME视频播放器    | `sudo apt install totem`               |
| Xine多媒体引擎     | `sudo apt install xine-ui`             |

[十大开源视频播放器1-不含安装](https://linux.cn/article-11481-1.html)

[十大开源视频播放器2-包括安装](https://bynss.com/linux/706589.html)

[WebDav多平台挂载](https://blog.csdn.net/qq_43632394/article/details/123415845)

### Ubuntu中的火狐浏览器打不开简书，显示403错误

在浏览器地址栏输入浏览器地址栏输入`about:config`

搜索 `general.useragent.override`，无则新建。

输入字符串: `Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36`即可。

还有一个大佬说：

通过修改general.useragent.override确实能访问。测试修改不能访问的User-Agent不同部分，发现只要把其中的Ubuntu删掉就可以了。

`Mozilla/5.0 (X11; Linux x86_64; rv:105.0) Gecko/20100101 Firefox/105.0`

### SSH上传文件到linux服务器

一般使用scp来传输文件

1. 从服务器上下载文件
   
   ```bash
   scp username@servername:remote_dir local_dir
   ```
   
2. 上传本地文件到服务器

   ```bash
   scp /path/filename username@servername:/path
   ```

3. 从服务器下载整个目录

   ```bash
   scp -r username@servername:remote_dir local_dir

   ```

4. 上传目录到服务器

   ```bash
   scp  -r local_dir username@servername:remote_dir
   ```
**ps:目标服务器要开启写入权限**

### Linux文件权限管理

#### 用户管理

账号信息在`/etc/passwd`下，密码记录在`/etc/shadow`下，群组记录在`/etc/group`下。

新增：`useradd -g init_group -G second_group -s shell username`

- `useradd vbird`新建用户vbird，所有参数为默认，创建home文件夹，默认权限为700

- `useradd -g users vbird`，为用户vbird指定初始群组为users

- `useradd -D`查看默认参数列表

#### 文件权限

可以以三种身份进行文件的存取：owner/group/others，对文件的操作权限有read/write/execute等。使用`ls -al`查看文件权限。

![](/img/Ubuntu-1.png)

第一列为文件权限。它由10位共四部分组成：文档类型（1位）+ owner的权限（3位）+ group的权限（3位）+ others的权限（3位）.

其中，权限的3位可为rwx，分别表示可读(read)、可写(write)、可执行（execute）。

#### 改变文件权限

- chgrp：改变文件群组，如：chgrp -R newgroup dirname

- chown：改变文件拥有者，如：chown -R newowner dirname，也可以直接修改群组：chown -R newowner:newgroup dirname

- chmod：改变文件权限特性，可以使用数字或字母设置权限，**一般用这个**

数字与字母的对应关系如下：

> r: 4, w: 2, r: 1

如，权限`drwxr-xr-x`用数字表示就是（4+2+1）+（4+0+1）+（4+0+1）=755。于是，修改文件权限就可以这样写：`chmod 755 filename`。

在使用字母符号修改文件权限时，对应关系如下：

> **user: u, group: g, others: o, all: a, read: r, write：w, execute: x**

于是，修改文件权限：`chmod u=rwx,go=rx filename`，即对文件设置了user拥有rwx权限，group和others拥有读/执行权限。

对所有用户增加写权限：`chmod a+w filename`。加号改为减号，即为去掉相应的权限。

### Linux强制关闭应用程序

一般使用xkill应用程序，但如果缺少的话，输入`sudo apt-get install xorg-xkill`,运行此命令后，您将看到鼠标指针将变为“x”或头骨。您只需将指针指向无响应的程序，然后单击它即可。这将在几秒钟内终止挂起程序。

使用一个简洁操作，设置键盘快捷键，创建自定义快捷方式

![](/img/Ubuntu-2.png)

使用使用kill，pkill和killall命令也可以

`top`命令中显示的进程列表,然后，可以按如下方式使用kill命令使用它的PID终止进程：
`kill [PID]`，还可以使用pkill通过使用以下语法来终止进程：`pkill [ProcessName]`，例如：`例：pkill gnome-software`，然后是killall命令，您可以使用它来杀死应用程序的所有实例。这是语法：`killall [ProcessName]`，例如：`killall gedit`。

### Linux使用ssh连接断连

```bash
sudo nano /etc/ssh/ssh_config
#然后添加以下几行
ServerAliveInterval 30
ServerAliveCountMax 6
```
