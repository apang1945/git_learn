# git_learn(personal)
1. git初始化

* 初始化username和user email以及后续修改
    ```javascript
  git config --global user.name "Your Name"
  git config --global user.email "email@example.com"
  git config --global user.name 'userName'    // 修改登陆账号，userName为你的git账号
  git config --global user.email 'email'      // 修改登陆邮箱，email为你的git邮箱
  git config --global user.password 'password'  // 修改登陆密码，password为你的git密码


* 基本操作步骤
  
    ```javascript
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

2. Git基本操作指令

    ```
    cd /e          //打开e盘
    mkdir test     //创建文件夹指令，在e盘创建一个名为test的文件夹
    pwd            //显示当前所在位置，输出结果为/e/test
    cd test        //打开test文件夹
    git init       //用于建立本地git存储库 
    ```

2. 杂项

* SSH相关

    * 生成SSH Key  `ssh-keygen -t rsa –C “youremail@example.com”`

        `ssh-keygen -t rsa`意思是创建一个rsa密钥`–C “youremail@example.com”`是为这个密钥建立备注，备注为`youremail@example.com`也可以使用taozi之类的名字
    
    * 测试SSH连接  `ssh -T git@github.com`

        可能会看到类似如下的警告：
    
        ```shell
        > The authenticity of host 'github.com (IP ADDRESS)' can't be established.
        > RSA key fingerprint is SHA256:nThbg6kXUpJWGl7E1IGOCspRomTxdCARLviKw6E5SY8.
        > Are you sure you want to continue connecting (yes/no)?
        ```

        验证所看到消息中的指纹是否匹配 [GitHub 的公钥指纹](https://docs.github.com/cn/github/authenticating-to-github/githubs-ssh-key-fingerprints)。 如果是，则输入 `yes`：

        ```shell
        > Hi username! You've successfully authenticated, but GitHub does not
        > provide shell access.
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

      ```javascript
      # system
      git config --system --list 
      # global 用户级别
      git config --global --list
      # local 当前仓库
      git config --local --list
      ```

      ![](/img/config-1.png)

  * 检查远程地址`git remote -v`

    ![](/img/config-2.png)

- - -
# take notes a successfull git
* 狂
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