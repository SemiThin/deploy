# drone
### 启动 gogs、drone-server、drone-runner 服务

```bash
docker-compose up -d
```

### 安装gogs 数据库自行选择 这里演示用的是sqlLite3
```bash
http://localhost:3000
```
<image width="340" src="images/1.png"/>

### 新建git仓库并提交
```bash
echo "# deploy" >> README.md
git init
git add README.md
git commit -m "first commit"
git branch -M main
git remote add origin ssh://git@192.168.3.193:10022/D/demo.git
git push -u origin main
```

### 激活仓库
```bash
http://localhost:8088
```
<image width="340" src="images/2.png"/>


### 修改webhook 如果用域名部署的可以跳过此步骤

<image width="340" src="images/3.png"/>


### 设置ssh/docker等私密信息 对应.drone.yml的from_secret
<image width="340" src="images/4.png"/>


### 新建docker镜像空间，此处用的阿里云
```bash
# 步骤请自行搜索
# 对应的是服务器部署的registry.cn-shenzhen.aliyuncs.com/semithin/demo
```


###  .drone.yml 通过 ssh 到服务器执行该docker-compose.yml文件

```bash
version: "3"
services:
  demo:
    image: registry.cn-shenzhen.aliyuncs.com/semithin/demo
    container_name: demo
    environment:
      TZ: Asia/Shanghai
    ports:
      - 8090:8080
    restart: always
```

### 再次提交git
```bash
├─docker-compose.yml           gogs、drone-server、drone-runner
├─Dockerfile                   dockerfile打包文件
├─Dockerfile.libc6             dockerfile父类镜像（可选）
├─.drone.yml                   drone流水线配置文件
├─.notify.tpl                  通知模版
├─main.go                      gin示例
```
<image width="340" src="images/5.png"/>


### 部署流程

<image width="340" src="images/6.png"/>


### 通知

<image width="340" src="images/7.png"/>


### 访问部署后的服务

```bash
curl localhost:8090/ping
```

<image width="340" src="images/8.png"/>
