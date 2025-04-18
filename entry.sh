#!/bin/sh
#chpasswd < /root/passwd

if [ -f /meex/.init.sh ];then
    /meex/.init.sh
    rm -f /meex/.init.sh
fi
if [ -f /meex/.startup.sh ];then
    /meex/.startup.sh
fi
/usr/sbin/sshd -D