### Luinx基本操作指令

| 指令                                         | 含义                                                               |
| ------------------------------------------ | ---------------------------------------------------------------- |
| `df -h`                                    | 查看磁盘的剩余容量                                                        |
| `rm -rf xxx`                               | 强制递归删除文件夹                                                        |
| `touch`                                    | touch命令用于修改文件或者目录的时间属性，包括存取时间和更改时间。若文件不存在，系统会建立一个新的文件，**可以创建文件** |
| `mkdir`                                    | 只能创建文件夹以及赋予相关的权限，**不可以创建文件**                                     |
| `hostnamectl`                              | 显示与设置主机名称,如果要查看系统的内核版本，可以`uname -r`                              |
| `hostname -I`或者`curl ifconfig.me`          | 查看服务器的IP                                                         |
| `tar -zxvf xxx.tar`                        | 解压压缩包，[常见指令](/tips/unzip-learn.md)                               |
| `tar cvfz xxx.tar`                         | 打包压缩包，常见指令如上                                                     |
| `mv a b`                                   | 将a重命名为b                                                          |
| `scp A B`                                  | 将A的文件传到B处                                                        |
| `systemctl enable xxx`                     | 设置开机启动                                                           |
| `systemctl disable xxx`                    | 关闭开机启动                                                           |
| `systemctl list-units --type=service`      | 查看已启动的服务                                                         |
| `systemctl list-unit-files \| grep enable` | 查看是否设置开机启动                                                       |
| `lsof -i:xxx`                              | 查看端口占用                                                           |
|                                            |                                                                  |
|                                            |                                                                  |
|                                            |                                                                  |
|                                            |                                                                  |
