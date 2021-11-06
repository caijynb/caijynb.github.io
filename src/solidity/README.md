# 介绍

Solidity是是一款基于以太坊虚拟机 Ethereum Virtual Machine (EVM)的智能合约编写语言。是一种静态语言，支持继承、库、复杂类型定义等功能。



# Solidity开发环境配置

一般来说solidity开发用的ide都是web端的remix，直接翻墙用官网



此外就是给浏览器安装个metamask钱包插件。



以下都是在服务器上配置的：

## nodejs安装

```
apt-get install curl -y

curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -

apt-get install -y nodejs
```

如此就安装好了`nodejs`和`npm`

`setup_14.x`中的`14`可根据当前nodejs LTS版本更换成别的



## Go安装

```
wget -c https://golang.org/dl/go1.16.5.linux-amd64.tar.gz -O - | sudo tar -xz -C /usr/local
vim  /etc/profile
export PATH=$PATH:/usr/local/go/bin #写入到/etc/profile首行
source /etc/profile
```



## git安装

```
apt-get install git -y
```



## 以太坊源码（geth）编译

```
mkdir geth
cd geth
git init
git remote add origin https://github.com/ethereum/go-ethereum
git pull origin master
apt-get install make
make geth
```

编译好之后会有`Run "./build/bin/geth" to launch geth.`的说明



## web3.js包

`web3`库是使用最广泛的以太坊开发程序包，我们通过`npm`来安装

```
npm install web3 -g
```



## ganache安装

ganache用于创建测试账号和私钥，其实我感觉装不装都没啥问题

```
npm install -g ganache-cli
```



## truffle安装

Truffle是一个优秀的开发环境，测试框架、以太坊的资源管理通道。

```
npm install -g truffle
```

```
mkdir test && cd test

truffle init

tree

.

├── contracts

│  └── Migrations.sol

├── migrations

│  └── 1_initial_migration.js

├── test

└── truffle-config.js
```

contracts solidity合约目录

migrations 可编程部署脚本文件

test 用来测试App和合约的测试文件目录

truffle-config.js truffle配置文件



## solc命令行编译器

```
npm install -g solc
npm install -g solc-cli
```





# sol文件结构

## 1.编译开关

```
paragma solidity ^0.4.0
```

编译开关，表明需要编译器高于0.4.0版本才可以编译,`^`表示如果编译器版本低于`0.4.0`则不可编译，也可以指定编译器的版本范围

```
paragma solidity >=0.4.22 <0.6.0
```





## 2.引入其他源文件

全局引入

```
import "<filename>"
```



自定义命名空间引入

```
import * as <自定义名> "<filename>"
```





## 3.注释

```
// 单行注释

/*
这是
多行注释
*/
```

