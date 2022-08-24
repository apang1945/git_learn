# git_learn(personal)
1. git初始化
* 初始化username和user email以及后续修改
```javascript
  git config --global user.name "Your Name"
  git config --global user.email "email@example.com"
  git config --global user.name 'userName'    // 修改登陆账号，userName为你的git账号
  git config --global user.email 'email'      // 修改登陆邮箱，email为你的git邮箱
  git config --global user.password 'password'  // 修改登陆密码，password为你的git密码
```
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
```javascript
cd /e          //打开e盘
mkdir test     //创建文件夹指令，在e盘创建一个名为test的文件夹
pwd            //显示当前所在位置，输出结果为/e/test
cd test        //打开test文件夹
git init       //用于建立本地git存储库
```
- - -
# take notes a successfull git
```javascript
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