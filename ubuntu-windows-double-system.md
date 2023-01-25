# Ubuntu和Windows双系统的搭建

[清华镜像Uhuntu](https://mirrors.tuna.tsinghua.edu.cn/ubuntu-releases/)可以下载最新的ubuntu，我想要装双系统，所以需要选`ubuntu-xxx-desktop-xxx.iso`这个，将镜像文件下载到桌面
然后使用U盘烧录软件[Rufus](https://rufus.ie/downloads/)，下载之后选择U盘，选择镜像文件，目标系统类型要选择**UEFI**，然后开始烧录，与此同时准备压缩电脑磁盘。
点击Windows的磁盘管理，选择要安装的盘，点击压缩，我选择了35G内存，然后不需要新建卷，只需要让它空闲就好。
随后需要选择从U盘启动，Windows10比较方便，按住Shift之后点击重启，会直接到启动管理界面，选择可以移除的U盘，我的在第一排第二个，选了之后自动进入U盘启动
![U盘启动界面](/img/Upan-launch.jpg)

之后就开始读取U盘，进入之后需要注意的有以下几点

- 安装类型里选择其他选项，选错了会导致原来的Windows系统受到损坏

- 到了选择磁盘安装Ubuntu的时候需要点击空闲的磁盘并选择挂载点，只需要输入一个`/`即可
  之后等待安装即可
  
# Enjoy it.