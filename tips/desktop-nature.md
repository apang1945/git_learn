## .desktop文件

创建的配置文件在[这里](/tips/marktext.desktop)
基本模板：

```bash
[Desktop Entry]
Name=<应用程序名>
Type=Application
Exec=<应用程序完整路径>
Icon=<应用程序图标的完整路径>
Categories=<应用程序分类>
```

- Name: desktop 文件最终显示的名称（一定要注意和 desktop 文件名的区别）

- Type: 用于指定 desktop 文件的类型（包括 3 种类型：Application、Link、Directory)

- Exec: 用于指定二进制可执行程序的完整路径

- Icon: 指定应用程序图标的完整路径(可以省略后缀名)。图标支持 png 格式、svg 格式等，图标的推荐尺寸为 128x128。

#### Categories 参数

|Categories|分类|
| --- | --- |
|network|网络应用|
|Chat|社交沟通|
|Audio|音乐欣赏|
|Video|视频播放|
|Graphics|图形图像
|Office|办公学习|
|Translation|阅读翻译|
|Development|编程开发|
|Utility|系统管理|

[CSDN大佬的详细说明](https://blog.csdn.net/yanchenyu365/article/details/121852376)

