### Docker基本操作指令

| 指令                                                    | 含义                                                                                                                          |
| ----------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------- |
| `docker run xxx`                                      | 运行一个镜像                                                                                                                      |
| `docker stop xxx`                                     | 停止一个容器                                                                                                                      |
| `dokcer rm xxx`                                       | 删除某个容器                                                                                                                      |
| `docker rmi xxx`                                      | 删除一个镜像                                                                                                                      |
| `docerk ps` or `docker ps -a`                         | 查看docker内容器                                                                                                                 |
| `docekr images`                                       | 查看docker内镜像                                                                                                                 |
| `docekr inspect xxx`                                  | 检查镜像的具体信息                                                                                                                   |
| `docekr run -d --name -v -p -it --volumes-from xxx  ` | -d的意思是后台运行；--name的意思是为容器命名；-v的意思是选择挂载卷；-p的意识是映射端口；-i和-t一般一起使用为-it，它的意思是以交互模式运行，并分配一个伪输入终端；--volumes-from xxx的意思是选择xxx（容器名）； |
| `docker logs -f xxx`                                  | 查看xxx容器的输出日志                                                                                                                |
| `docker update --restart=always xxx`                  | 将正在运行的容器设为自启动                                                                                                               |
| `docker update --restart=no xxx`                      | 将自启动的容器取消自启动                                                                                                                |
| `systemctl restart docker.service`                    | 重启docker服务                                                                                                                  |
| `docker rm -f xxx`                                    | 强制删除某个容器                                                                                                                    |
|                                                       |                                                                                                                             |
|                                                       |                                                                                                                             |
|                                                       |                                                                                                                             |
|                                                       |                                                                                                                             |
|                                                       |                                                                                                                             |
|                                                       |                                                                                                                             |
