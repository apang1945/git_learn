# git_learn(personal)
1. git初始化

    * 初始化username和user email以及后续修改

        ```shell
        git config --global user.name "Your Name"
        git config --global user.email "email@example.com"
        git config --global user.name 'userName'    // 修改登陆账号，userName为你的git账号
        git config --global user.email 'email'      // 修改登陆邮箱，email为你的git邮箱
        git config --global user.password 'password'  // 修改登陆密码，password为你的git密码
        ```

    * 基本操作步骤

        ```shell
        cd /e
        mkdir test
        pwd
        cd test
        git init /e/test
        git add README.md
        git commit -m "first commit"
        git branch -M main
        git remote add origin https://github.com/xxx/xxx.git
        git push -u origin main
        ```

    * Git基本操作指令

        ```shell
        cd /e          //打开e盘
        mkdir test     //创建文件夹指令，在e盘创建一个名为test的文件夹
        pwd            //显示当前所在位置，输出结果为/e/test
        cd test        //打开test文件夹
        git init       //用于建立本地git存储库 
        ```

2. 杂项

    * SSH相关 

      生成SSH Key  `ssh-keygen -t rsa –C "youremail@example.com"`
      
      `ssh-keygen -t rsa`意思是创建一个rsa密钥, `–C "youremail@example.com"`是为这个密钥建立备注, 备注为`youremail@example.com`, 也可以使用taozi之类的名字 

      测试SSH连接  `ssh -T git@github.com`

      可能会看到类似如下的警告：

      ```shell
      > The authenticity of host 'github.com (IP ADDRESS)' can't be established.
      > RSA key fingerprint is SHA256:nThbg6kXUpJWGl7E1IGOCspRomTxdCARLviKw6E5SY8.
      > Are you sure you want to continue connecting (yes/no)?
      ```

      验证所看到消息中的指纹是否匹配 [GitHub 的公钥指纹](https://docs.github.com/cn/github/authenticating-to-github/githubs-ssh-key-fingerprints)。 如果是，则输入 `yes`：

      ```shell
      > Hi username! You've successfully authenticated, but GitHub does not
      provide shell access.
      ```

    * Branch 相关

      * 查看本地分支`git branch`.

        ![](/img/branch-1.png)

      * 查看远程分支`git branch -r`,`-r `表示` remote`.

        ![](/img/branch-2.png)

      * 查看所有分支`git branch -a`

        ![](/img/branch-3.png)

    * Config 相关

      * 查看用户信息

        ```shell
        git config --system --list       # system
        git config --global --list      # global 用户级别
        git config --local --list      # local 当前仓库
        ```

        ![](/img/config-1.png)

    * 远程仓库相关

      * 检查远程地址`git remote -v`

        ![](/img/config-2.png)

      * git修改远程仓库（未尝试）

        * 修改命令 `git remote set-url origin [url]`

        * 先删后加

            ```shell
            git remote rm origin
            git remote add origin [url]
            ```

        * 直接修改config文件

            修改后如果git pull会提示fatal: refusing to merge unrelated histories这个问题:

            解决方法:

            ```shell
            git pull origin master --allow-unrelated-histories
            ```

    * 服务器相关

      * 文件操作

        * 切换用户

            ```shell
            su - 切换到root用户
            su – taozi 切换到taozi用户
            ```

        * 切换目录

            ```shell
            cd ~ 切换到主目录
            cd /tmp 切换到目录/tmp
            cd dir 切换到当前目录下的dir目录
            cd / 切换到根目录
            cd .. 切换到到上一级目录
            cd ../.. 切换到上二级目录
            cd ~ 切换到用户目录，比如是root用户，则切换到/root下
            ```

        * 文件删除

          * 删除文件：`rm /root/install.log`（需要确认）

          * 直接删：`rm -f /root/install.log`

          * `rm *` 删除当前目录下的所有文件（未隐藏文件)

        * 修改目录/文件
          
          * 查看目录下文件/目录：list ll ll -al ls/root
          
          * 创建目录：`mkdir ./b`、 `mkdir -pv root/a/b/c/d` 创建多级目录，并显示详情，即使父目录不存在
          
          * 创建文件：touch maotaozi.txt
          
          * 复制目录：cp -r ./abc ./
          
          * 复制文件：cp ./install.log /root
          
          * `cp * /tmp` ：把当前目录下的所有未隐藏文件复制到/tmp/目录下
          
          * `cp -a docs docs.bak` ：递归性地把当前目录下的docs目录复制为新目录docs.bak,保持文件属性，并复制所有


3. Lunix命令

    * vi/vim命令

      基本上 vi/vim 共分为三种模式，分别是**命令模式（Command mode）**，**输入模式（Insert mode）**和**底线命令模式（Last line mode）**。 这三种模式的作用分别是：
      
      * 命令模式常用命令

        * **i** 切换到输入模式，以输入字符。

        * **x** 删除当前光标所在处的字符。

        * **:** 切换到底线命令模式，以在最底一行输入命令。

      * 输入模式常用命令

        * **BACK SPACE**，退格键，删除光标前一个字符

        * **DEL**，删除键，删除光标后一个字符

        * **Page Up**/**Page Down**，上/下翻页

        * **Insert**，切换光标为输入/替换模式，光标将变成竖线/下划线

        * **ESC**，退出输入模式，切换到命令模式

      * 底线命令模式

        * **q** 退出程序

        * **w** 保存文件

        * **Esc** 退出底线命令模式

      * 一般模式切换编辑模式
      
          | 进入输入或取代的编辑模式 |      |
          | :----------------------- | :--: |
          | I,i                      | 进入输入模式(Insert mode)：<br/>i 为『从目前光标所在处输入』， I 为『在目前所在行的第一个非空格符处开始输入』。 (常用) |
          | A,a                      | 进入输入模式(Insert mode)：<br/>a 为『从目前光标所在的下一个字符处开始输入』， A 为『从光标所在行的最后一个字符处开始输入』。(常用) |
          | O,o                      | 进入输入模式(Insert mode)：<br/> 这是英文字母 o 的大小写。o 为在目前光标所在的下一行处输入新的一行； O 为在目前光标所在的上一行处输入新的一行！(常用) |
          | R,r                      | 进入取代模式(Replace mode)：<br/> r 只会取代光标所在的那一个字符一次；R会一直取代光标所在的文字，直到按下 ESC 为止；(常用) |
          | Esc                      |              退出编辑模式，回到一般模式中(常用)              |

      * 一般模式切换指令行模式
      
          | 指令行的储存、离开等指令 |                                                              |
          | ------------------------ | ------------------------------------------------------------ |
          | :w                       | 将编辑的数据写入硬盘档案中(常用)                             |
          | :w!                      | 若文件属性为『只读』时，强制写入该档案                       |
          | :q                       | 离开 vi (常用)                                               |
          | :q!                      | 若曾修改过档案，又不想储存，使用` ! `为强制离开不储存档案    |
          | :wq                      | 储存后离开，若为 `:wq! `则为强制储存后离开 (常用)            |
          | ZZ                       | 这是大写的 Z 喔！如果修改过，保存当前文件，然后退出！效果等同于(保存并退出) |
          | ZQ                       | 不保存，强制退出。效果等同于 `:q!`。                         |
          | :w [filename]            | 将编辑的数据储存成另一个档案（类似另存新档）                 |
          | :r [filename]            | 在编辑的数据中，读入另一个档案的数据。亦即将 『filename』 这个档案内容加到游标所在行后面 |
          | :n1,n2 w [filename]      | 将 n1 到 n2 的内容储存成 filename 这个档案。                 |
          | :! command               | 暂时离开 vi 到指令行模式下执行 command 的显示结果！例如 『:! ls /home』即可在 vi 当中察看 /home 底下以 ls 输出的档案信息！ |
          | :set nu                  | 显示行号，设定之后，会在每一行的前缀显示该行的行号           |
          | :set nonu                | 与 set nu 相反，为取消行号！                                 |

    ![](/img/vi-1.png)



4. 常见问题及其解决方案
   * Push的时候出现这个`error: failed to push some refs to`
     * 远程库与本地库代码不一致导致的，我们只要把远程库同步到本地库即可，使用如下命令：`git pull --rebase origin master`，指令意思就是把远程库中的跟新合并到本地库中（可能存在冲突需要解决），`--rebase`的作用是取消本地库中刚刚提交的commit，并把他们接到更新后的版本库中。
     * 使用如下命令，将commit的代码撤回，然后再git pull也行：`git reset --soft HEAD^`，`HEAD^`的意思是上一个版本，也可以写成`HEAD~1`，如果你进行了2次commit，想都撤回，可以使用`HEAD~2`。






- - -
# take notes a successfull git
* 记录
  ```
    cd /e
    mkdir gitlearn
    cd gitlearn
    pwd
    git init /e/gitlearn #Initialized empty Git repository in E:/gitlearn/.git/
    git add README.md
    git commit -m "first commit"
    git branch -M main
    git remote add origin https://github.com/xxx/xxx.git
    git push -u origin main
  ```