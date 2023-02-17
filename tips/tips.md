这个文档用来写一下关于日常操作中一些简便的操作技巧

---

# Windows

## 优化

1. Windows Terminal欢迎界面的去除
   
   在terminal里点击设置，转到powershell的设置界面，在命令行后加入` -Nologo`，注意这里有一个空格。

2. Windows Terminal的ssh经常自己断开
   
   修改config文件
   
   ```bash
   cd .ssh
   vim config
   #在配置文件里加入以下命令
   ServerAliveInterval 60
   #这条指令的意思是每隔60秒向服务器发送一个空包来保持和服务器的连接
   
   #以下的未测试
   ServerAliveCountMax 3 #这条指令的意思是设置最多尝试连接次数，例如：最多尝试三次
   ```

3. Ubuntu和Windows时间不匹配
   
   先说下两个概念：
   
   UTC即Universal Time Coordinated，协调世界时，[世界统一时间](https://baike.baidu.com/link?url=HnX2f1XGSuotBE1y-885nj2eeiyHnFBdgWHP_f0hCNDSHO9kUbSSNDaYDJ9BQ4p5JUzMhZfbPKv76FkHnZ5CtPgACZ5uVpz3R48L_SDVcQr0Q7jI75gXTkKwerfz1sOY8VFrTL0ddG-NmmwxIfXFSK)
   
   GMT 即Greenwich Mean Time，格林尼治平时
   
   Windows 与 Mac/Linux 看待系统硬件时间的方式是不一样的：
   
   Windows把计算机硬件时间当作本地时间(local time)，所以在Windows系统中显示的时间跟BIOS中显示的时间是一样的。
   
   Linux/Unix/Mac把计算机硬件时间当作 UTC，所以在Linux/Unix/Mac系统启动后在该时间的基础上，加上电脑设置的时区数（ 比如我们在中国，它就加上“8” ），因此，Linux/Unix/Mac系统中显示的时间总是比Windows系统中显示的时间快8个小时。
   
   **解决办法：**
   
   1.在Ubuntu中把计算机硬件时间改成系统显示的时间，即禁用Ubuntu的UTC。
   
   在 Ubuntu 16.04 版本以前，关闭UTC的方法是编辑/etc/default/rcS，将UTC=yes改成UTC=no， 但在Ubuntu 16.04使用systemd启动之后，时间改成了由timedatectl来管理，所以更改方法是
   
   ```bash
   timedatectl set-local-rtc 1 --adjust-system-clock
   ```
   
   亦可以安装nptdate来实现
   
   ```bash
   sudo apt-get install ntpdate
   sudo ntpdate time.windows.com
   sudo hwclock --localtime --systohc
   ```
   
   2.修改 Windows对硬件时间的对待方式，让 Windows把硬件时间当作UTC。
   
   打开命令行程序，在命令行中输入下面命令并回车
   
   ```bash
   Reg add HKLM\SYSTEM\CurrentControlSet\Control\TimeZoneInformation /v RealTimeIsUniversal /t REG_DWORD /d 1
   ```

---

### 增强

1. **为Windows加入Vim**
   
   - 在GitHub下载Windows的安装包，在[这里](https://github.com/vim/vim-win32-installer/releases)，安装之后添加系统变量和用户变量，用户变量的名字命名为`VIM`
   
   - 配置VIM
     
     配置颜色主题：在[这里](https://ethanschoonover.com/solarized/)下载`solarized.vim`的配置主题，然后存放于vimxx（xx是版本号）文件夹中的colors文件夹下
     
     - 在安装目录下新建`.undo`文件夹（即`C:\Program Files\Vim\.undo`，也可放在自己喜欢的位置)，用来保存历史文件。
     
     - 在配置某个配置之前，可以先查看一下目前默认的是否开启，如果开启就不用配置了。具体查看方法是，在normal模式下，输入该配置，并加上“？”回车。例如：`:set number?`表示查看是否设置行号。
     
     - 基本配置在[这里](/tips/_vimrc)
   
   - 安装vundle插件
     
     在安装路径下新建`vimfiles\bundle`文件夹，在cmd执行下面命令：
     
     `git clone https://github.com/VundleVim/Vundle.vim.git C:\Program Files\Vim\vimfiles\bundle`
     
     在`_vimrc`中添加这些[内容](/tips/vim_plugin.txt)，依次安装各个常用插件，具体操作详情参考[这里](https://blog.csdn.net/qyhaill/article/details/99701566)。
     
     在cmd打开vim，并执行`:PluginInstall`安装插件。如果遇到提示`:PluginInstall`不是命令的错误，尝试把上面第二行`set rtp +=`后面的内容改为绝对路径。

2. **三种方法禁止Windows更新**
- 按Win+R打开“运行”，输入gpedit.msc点击确定
  
  依次选择计算机配置——>管理模板——>Windows 组件，然后找到“Windows 更新”选项 双击“配置自动更新”然后禁用即可。
- 按Win+R打开“运行”，输入services.msc点击确定。找到“Windows Update”，右键属性。禁用、停用，应用、确定保存，然后重启电脑
- 打开设置——>网络和Internet，然后找到你所使用的网络类型，再点进去，然后将设为按流量计费的连接打开。

只有第一个需要专业版才可以设置。

---

### 优化

1. 谷歌浏览器谷歌搜索之后点击新链接不会打开新的界面的解决办法
   
   - 用鼠标滑轮单击
   
   - Ctrl + 单击
   
   - 访问[谷歌](www.google.com)，然后点击右下角的设置，然后点击搜索设置，之后滚动窗口，找到“结果打开方法”，勾选“在新的浏览器窗口中打开所选的每条搜索结果”，点击“保存”按钮即可。

---

# Lunix

1. **Buyvm添加存储块**
   
   ```bash
   #检查是否存储卷在内
   fdisk -l
   #查看数据块编号（也可以在邮箱或者BVM客户面板找到）
   ls /dev/disk/by-id/
   #创建卷文件夹
   mkdir /storage256
   #挂载这个存储块到你这个vps
   mount -o discard,defaults /dev/disk/by-id/scsi-0BUYVM_SLAB_VOLUME-17327 /storage256
   #设置开机/重启自动挂载（避免关机后不挂载）
   echo '/dev/disk/by-id/scsi-0BUYVM_SLAB_VOLUME-17327 /apang ext4 defaults,nofail,discard 0 0' | sudo tee -a /etc/fstab
   #列出所有可用块设备的信息
   lsblk
   #显示磁盘占用
   df -h
   ```
