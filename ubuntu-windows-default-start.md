# Ubuntu和Windows双系统电脑修改默认启动项

最近因为电脑安装TrollStore需要Lunix系统，准备用虚拟机，但是虚拟机识别不了DFU模式的手机，貌似是端口识别问题。但是最近使用下来，安装了Ubuntu之后呢默认启动项就变成了Ubuntu，而且只有10秒考虑时间，于是研究了了一下如何修改Windows为默认启动。

首先进入Ubuntu，打开终端，快捷键为`Curl+Alt+T`然后输入`sudo gedit /boot/grub/grub.cfg`（或者或进入/etc/default/文件夹下，打开终端，输入命令：`sudo gedit grub`）

将第6行`GRUB_DEFAULT=0`修改为想要默认启动的系统序号，设置完后保存，具体修改的数值参考自己系统的启动，例如由于是从0开始计数，因为我的Windows的启动项在第三个，所以数值就是2。

![](/img/ubuntu-windows-default-start.jpg)

然后输入`(sudo) update-grub`更新grub文件，然后重启系统即可默认进入Windows系统。

