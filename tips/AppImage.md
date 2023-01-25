系统里所有的快捷方式都存储在`/user/share/Applications`里，所有的文件都是`*.desktop`文件，之前安装Marktext的时候，在知乎大佬的[教程](https://zhuanlan.zhihu.com/p/555479039)里，创建的配置文件在[这里](/tips/marktext.desktop)，创建之后执行以下指令:

```bash
chomd +x xxx.AppImage // 可执行权限
sudo cp marktext.destop /usr/share/applications #移动到系统文件夹
#添加右键打开方式
cd /usr/share/applications
sudo gedit defaults.list
#在最后一行添加：
text/markdown=marktext.desktop
```

参考如下：

[marktext官方配置](https://github.com/marktext/marktext/blob/develop/resources/linux/marktext.desktop)

[什么是AppImage](https://blog.csdn.net/aboutmn/article/details/87254930)

[.desktop文件属性](/tips/desktop-nature.md)
