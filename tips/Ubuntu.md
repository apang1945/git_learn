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
