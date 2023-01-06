## 使用Armbian的Docker装OpenWrt遇到的坑以及解决办法

1. 如何安装Armbian
   
   需要写盘工具[Rufus](https://rufus.ie/zh/)以及固件包，这里选择的固件包有多种，比如ophub大佬的[amlogic-s9xxx-armbian](https://github.com/ophub/amlogic-s9xxx-armbian)以及F大的[固件包](https://www.right.com.cn/forum/thread-4076037-1-3.html)，还有网盘搜集的固件包，都是下载`*.img`文件之后写入u盘，有的需要修改，视具体情况而定。
   
   要进入u盘的BOOT文件夹，在文件夹dtb里点击amlogic文件夹之后找到斐讯N1的dtb文件，并复制相关路径到`uEnv.*`（这个具体文件在哪里我也忘记了），操作了两个之后我也没怎么修改，感觉大佬已经提前修改好了，修改好之后是这样的，`FDT=/dtb/amlogic/meson-gxl-s905d-phicomm-n1.dtb`，并且只需要修改`FDT=xxx`即可。
   
   ![](/img/docker-openwrt-1.png)
   
   有的还需要修改这里`.重命名根目录u-boot-s905x-s912文件，改成u-boot.ext`，这个具体没有测试，都是已经改好的，接下来就是窒息的U盘启动了，试了好几次没有成功，在和at打电话的时候偶然间成功了，具体操作如下：首先连接HDMI和U盘剩下的一个usb接口用一个公对公的数据线连接电脑或者是可以供电的其他设备，最好不要用充电宝，因为充电宝好像会自动断电，极其难受，然后就是称之为虚晃操作，先接入供电线，这里有一个开机没有按任意键就直接emmc启动，尝试了数次之后，总结如下：等到刚刚要emmc启动的时候断电，拔掉电源线，此时是usb供电，不知道是什么原理，现在会自动从U盘启动，是不是极其迷幻？然后就等待命令跑完，之后会要求输入账号密码，账号都是`root`，密码都是`1234`，之后会让你重置root密码，按照要求输入两次即可，之后会让你创建一个新的用户还要输入密码，此时直接`Ctrl+C`跳过即可，然后就进入了Armbian，到此为止U盘启动大功告成，但之后会有越来越多的坑，呜呜呜。还有的说`run usb boot`即可，这个也还没有测试。

2. 坑1：将Armbian写入eMMC
   
   ophub大佬的操作简单，直接输入`armbian-install`即可，我也只是进行到这一步，大佬后来还有操作，但是我没有弄，[具体在这里](https://github.com/ophub/amlogic-s9xxx-armbian/blob/main/README.cn.md#%E6%9B%B4%E6%96%B0-armbian-%E5%86%85%E6%A0%B8)，或许这就是为啥我后来的Armbian连不上网，更换了国内源也没有用的原因了，这又是一个坑，我还没有填，因为转战了F大的固件，F大固件刷写eMMC要输入`./install-to-xxx.sh`，xxx是因为忘记了，但是在这里会遇到情况`-bash: ./install.sh: Permission denied`，这里是因为没有权限，输入以下命令解决：
   
   `chmod 777 ./*.sh`

上文说了使用github上的固件一直存在不能apt的问题。所以以下都是F大的固件的使用说明

3. 坑2：换源
   
   输入`nano /etc/apt/sources.list`编辑即可，配置文件在[这里](/tips/F-sources.list.txt)，之后输入`apt clean`和`apt update`即可。

4. 坑3：Docker pull超时
   
   解决办法：使用Docker Pull加速，也就是换源，修改daemon.json，具体配置在[这里](/tips/openwrt-daemon.json)
   
   然后运行以下命令来重启Docker服务
   
   ```bash
   systemctl daemon-reload
   service docker restart
   ```

5. 坑4：Docker安装OpenWrt
   
   以下OpenWrt的镜像，一个是[unifreq/openwrt-aarch64](https://hub.docker.com/r/unifreq/openwrt-aarch64)，话有一个是[sulinggg/openwrt](https://hub.docker.com/r/sulinggg/openwrt)
   
   - 首先拉取镜像`docker pull sulinggg/openwrt:armv8`
   
   - 然后开启网卡混杂模式
     
     ```bash
     #这个是暂时开启混杂模式
     ip link set eth0 promisc on
     #但这个重启会失效，通过下边的来设置开机修改
     /etc/init.d/networking restart     #重启网络
     ```
   
   - 但是这个测试也没用，不知道是不是我的方法有问题，目前使用的方法是创建`etc/network/interfaces.d/eth0`来修改,eth0配置在[这里](/tips/armbian-eth0)。
   
   - 创建 Docker 虚拟网络
     
     ```bash
     docker network create -d macvlan --subnet=192.168.123.1/24 --gateway=192.168.123.1 -o parent=eth0 macnet
     #eth0 为自己实际的网卡名，一般是eth0，输入ifcongig查看
     #macnet 为名称，macvlan 为模式，另外请将 192.168.123 修改为你自己主路由网段
     ```
   
   - 运行OpenWRT容器
     
     ```bash
     docker run --restart always --name openwrt -d --network macnet --privileged sulinggg/openwrt:armv8 /sbin/init
     ```
   
   - 配置 OpenWRT 容器网络
     
     ```bash
     #进入容器命令行
     docker exec -it openwrt bash
     #编辑网络配置文件
     nano /etc/config/network
     #重启网络
     /etc/init.d/network restart
     ```
     
     network配置文件在[这里](/tips/openwrt-network)。
   
   - 以下是主路由和旁路有的设置
     
     以下是N1的OpenWrt的设置。
     
     ![](/img/docker-openwrt-2.png)
     
     ![](/img/docker-openwrt-3.png)
     
     ![](/img/docker-openwrt-4.png)
     
     ![](/img/docker-openwrt-5.png)
     
     以下是K2p的设置。
     
     ![](/img/docker-openwrt-6.png)







PS：以下大佬的教程存档

[F大N1OPENWRT专版](https://www.right.com.cn/forum/thread-4076037-1-3.html)

[Docker安装OpenWRT做旁路由，魔法上网 - 科技玩家](https://www.kejiwanjia.com/jiaocheng/57242.html#:~:text=OpenWRT%20%E6%98%AF%E5%89%8D%E9%9D%A2%20--name%20%E6%8C%87%E5%AE%9A%E7%9A%84%E5%AE%B9%E5%99%A8%E5%90%8D%E5%AD%97%EF%BC%8C%E6%B2%A1%E6%9C%89%E6%8C%87%E5%AE%9A%E7%9A%84%E8%AF%9D%E4%BB%A5%E9%80%9A%E8%BF%87%E8%BF%90%E8%A1%8C%20docker,container%20ls%20%E6%98%BE%E7%A4%BA%E5%87%BA%E7%9A%84%20NAMES%20%E5%AD%97%E6%AE%B5%E8%8E%B7%E5%BE%97%E3%80%82)

[n1 docker安装openwrt（旁路由）](https://blog.csdn.net/zhangjingzheng/article/details/120178257)

[N1盒子通过Docker部署OpenWrt](https://www.jianshu.com/p/8d4229b087f7)
