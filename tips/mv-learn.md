### mv命令：移动文件或改名

基本格式如下

```bash
mv 【选项】 源文件 目标文件
```

| 选项   | 含义                                            |
| ---- | --------------------------------------------- |
| `-f` | 强制覆盖，如果目标文件已经存在，则不询问，直接强制覆盖                   |
| `-i` | 交互移动，如果目标文件已经存在，则询问用户是否覆盖（默认选项）               |
| `-n` | 如果目标文件已经存在，则不会覆盖移动，而且不询问用户                    |
| `-v` | 显示文件或目录的移动过程                                  |
| `-u` | 若目标文件已经存在，但两者相比，源文件更新，则会对目标文件进行升级             |
| `-b` | 若需覆盖文件，则覆盖前先行备份                               |
| `-t` | 定mv的目标目录，该选项适用于移动多个源文件到一个目录的情况，此时目标目录在前，源文件在后 |
|      |                                               |
|      |                                               |

---

命令示例

1. 文件改名
   
   `mv test.log new-test.log`

2. 移动文件
   
   `mv test.txt /xx/xx/`

3. 文件改名，并是否询问被覆盖
   
   `mv -i log1.txt log2.txt`
   
   文件改名，但是强制被覆盖
   
   `mv -f log3.txt log2.txt`

4. 目录的移动
   
   `mv dir1 dir2`，dir1移动到dir2

5. 所有文件到上一级目录
   
   `mv * ../`，但是这个不包含`.*`文件，可以这样再运行一次`mv .* ../`

6. 将当前目录的子文件移动到另一目录
   
   `mv xx/*.txt xxx`的意思是将xx文件夹下的.txt文件移动到xxx文件下
