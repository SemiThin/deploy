#全自动方案一 
FROM alpine:latest

WORKDIR /app

COPY demo /app

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories
#解决docker alpine /bin/sh: ./main: not found
RUN apk add --no-cache libc6-compat


CMD ["./demo"]


# 手动构建一次父类镜像方案二 docker build -t alpine:libc6 -f Dockerfile.libc6 .
#RUN docker images
#FROM alpine:libc6

#COPY demo /app

#CMD ["./demo"]

