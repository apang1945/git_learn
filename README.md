# git_learn(personal)
1. git初始化
    初始化username和user email
```javascript
  git config --global user.name "Your Name"
  git config --global user.email "email@example.com"
```
2. 基本命令学习
```javascript
cd /e
mkdir test
pwd
cd test
git init
```
  命令解析
>切换到E盘
>创建test的文件夹
>打开test文件夹
>把这个目录变成Git可以管理的仓库

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