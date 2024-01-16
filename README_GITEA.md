# gitea

### 代码托管平台

- [Gogs](README.md)
- [Gitea](README_GITEA.md)

---

### 启动 gitea 服务

```bash
docker-compose up -d gitea
```

### 安装gitea
```bash
# 全部用ip访问，用localhost授权的时候会问题
http://192.168.10.33:3000
```
<image src="images/gitea_1.png"/>

### 创建仓库
```bash
# 此处不演示
```

### 创建应用
```bash
# 并把客户端ID和客户端密钥填到对应的docker-compose.yml位置
```

<image src="images/gitea_2.png"/>
<image src="images/gitea_3.png"/>


### 启动drone-server、drone-runner服务
```bash
docker-compose up -d drone-server drone-runner
```


### 应用授权

```bash
#点击Continue
http://192.168.10.33:8088
```
<image src="images/gitea_4.png"/>

### 激活仓库
<image src="images/2.png"/>

### 设置ssh/docker等私密信息 对应.drone.yml的from_secret
<image src="images/4.png"/>


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

### 提交git
```bash
├─docker-compose.yml           gitea、drone-server、drone-runner
├─Dockerfile                   dockerfile打包文件
├─Dockerfile.libc6             dockerfile父类镜像（可选）
├─.drone.yml                   drone流水线配置文件
├─.notify.tpl                  通知模版
├─main.go                      gin示例
```
<image src="images/5.png"/>


### 部署流程

<image src="images/6.png"/>


### 通知

<image width="340" src="images/7.png"/>


### 访问部署后的服务

```bash
curl localhost:8090/ping
```

<image src="images/8.png"/>

### 总结

gogs和gitea的部署方案差不多，都是稍微配置环境变量有些改动，gitea需要手动创建应用
