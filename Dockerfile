# **************************************
#
# MeexTech Sandbox
#
# ENV: PROD
# VERSION: 3.15
#
# *************************************

FROM alpine:3.15

RUN set -eux && sed -i 's/dl-cdn.alpinelinux.org/mirrors.tuna.tsinghua.edu.cn/g' /etc/apk/repositories

LABEL maintainer="MeexTech"
LABEL email="53505495@qq.com"

ENV VERSION=1.0
###############################
# install applications
###############################
RUN apk add --no-cache openssh
RUN apk add --no-cache bash

###############################
# allow root login
###############################
RUN sed -i 's/#PermitRootLogin[ ]prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

###############################
# generate ssh key
###############################
RUN ssh-keygen -t ecdsa -f /etc/ssh/ssh_host_ecdsa_key
RUN ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key
RUN ssh-keygen -t dsa -f /etc/ssh/ssh_host_dsa_key
RUN ssh-keygen -t ed25519 -f /etc/ssh/ssh_host_ed25519_key

#设置时区为上海
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
RUN echo "Asia/Shanghai" > /etc/timezone

#设置时区
RUN apk add --no-cache tzdata
ENV TZ=Asia/Shanghai
#设置编码
ENV LANG=en_US.UTF-8

###############################
# change password
###############################
RUN mkdir -p /root
#RUN echo root:meexsandbox > /root/passwd

RUN mkdir -p /meex

EXPOSE 22
COPY entry.sh /usr/bin/entry.sh
RUN chmod +x /usr/bin/entry.sh

ENTRYPOINT ["/usr/bin/entry.sh"]