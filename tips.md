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

### 增强

1. 为Windows加入Vim
   
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
