# 介绍

Golang是由google开发的一款静态强类型，编译型语言。



# 应用

Go语言在区块链开发和恶意软件编写上的应用比较多。

刚好我是一名在区块链公司实习的信息安全专业学生，感觉可太有必要学go了



# 安装

go的安装，主要是在ubuntu上用`apt-get install`的版本太低了

`go1.16.5.1`只是目前的最新版，大家可以根据官网的给出的最新版地址去下载安装

```
wget -c https://golang.org/dl/go1.16.5.linux-amd64.tar.gz -O - | sudo tar -xz -C /usr/local
vim  /etc/profile
export PATH=$PATH:/usr/local/go/bin #写入到/etc/profile首行
source /etc/profile
```

