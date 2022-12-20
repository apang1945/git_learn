常用命令：

zxvf 解压

cvfz 压缩

**只需要记住，x是解包，c是压缩，处理含有z的文件的时候加一个z，t是查看压缩包里的文件，压缩的时候要写好压缩包的文件名**

---

- **tar文件格式**
  
  解包：`tar xvf FileName.tar`
  打包：`tar cvf FileName.tar DirName`
  (注：`tar`是打包，不是压缩！)

- **.gz文件格式**
  解压1：`gunzip FileName.gz`
  解压2：`gzip -d FileName.gz`
  压缩：`gzip FileName`

- **.tar.gz 和 .tgz**
  解压：`tar zxvf FileName.tar.gz`
  压缩：`tar zcvf FileName.tar.gz DirName`

- **.zip格式**
  
  解压：`unzip `

---

使用实例

- 将文件打包成tar包
  
  tar -cvf log1.tar log1.log
  tar -zcvf log2.tar.gz log2.log
  tar -jcvf log3.tar.bz2 log3.log
  
  说明：
  `tar -cvf log1.tar log1.log` 仅打包，不压缩！
  `tar -zcvf log2.tar.gz log2.log` 打包后，以 `gzip` 压缩
  `tar -zcvf log.tar.bz2 log3.log` 打包后，以 `bzip2` 压缩

- 查询包内有什么文件
  
  `tar -ztvf log2.tar.gz`
  
  `-t`显示压缩文件的内容

- 备份文件夹内容是排除部分文件
  
  以下的命令是排除project里的service
  
  ```shell
  tar --exclude project/service -zcvf project.tar.gz project/*
  ```

- 在文件夹当中，比某个日期新的文件才备份
  
  ```shell
  tar -N "2017/11/13" -zcvf log17.tar.gz /root/data
  ```

- 文件备份下来，并且保存其权限
  
  ```shell
  tar -zcvf log.tar.gz log1.log log2.log
  ```

- 只将 tar 内的部分文件解压出来
  
  ```shell
  tar -zxvf /root/data/log.tar.gz log2.log
  ```

- 将 tar 包解压缩
  
  ```shell
  tar -zxvf /root/data/log.tar.gz
  ```

---

**tar**

| 选项   | 含义          |
| ---- | ----------- |
| `-z` | 支持gzip解压文件  |
| `-x` | 从压缩的文件中提取文件 |
| `-v` | 显示操作过程      |
| `-f` | 指定压缩文件      |
| `-c` | 建立新的压缩文件    |
| `-t` | 显示压缩文件的内容   |
|      |             |
|      |             |
|      |             |

**unzip**

| 选项        | 含义                                             |
| --------- | ---------------------------------------------- |
| `-d 目录名`  | 将压缩文件解压到指定目录下。                                 |
| `-n`      | 解压时并不覆盖已经存在的文件。                                |
| `-o`      | 解压时覆盖已经存在的文件，并且无需用户确认。                         |
| `-v`      | 查看压缩文件的详细信息，包括压缩文件中包含的文件大小、文件名以及压缩比等，但并不做解压操作。 |
| `-t`      | 测试压缩文件有无损坏，但并不解压。                              |
| `-x 文件列表` | 解压文件，但不包含文件列表中指定的文件。                           |
