# alpine-sandbox
meex-alpine sandbox


docker build -t="meextech/sandbox:v1.5" .
docker run meextech/sandbox:v1.5 -it -rm /bash

有时候，脚本文件的格式（如换行符）可能会导致问题。确保 entry.sh 脚本使用的是 Unix 格式（LF 换行符），而不是 Windows 格式（CRLF 换行符）。你可以使用 dos2unix 工具来转换文件格式：
sudo apt update 
sudo apt install dos2unix
dos2unix entry.sh