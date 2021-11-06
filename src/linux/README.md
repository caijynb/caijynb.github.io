# Introduction

这里记录一些杂七杂八的操作



## 免密登录和多SSH-Key共存

免密登录确切的说应该是密钥登录，在本地生成一对密钥，将公钥拷贝到远程服务器的`~/.ssh/authorized_keys`文件中，这样ssh就可以直接连接到远程主机上，不需要再自己输入密码。scp和rsync命令也不需要再敲一遍密码。



本地主机:

```
ssh-keygen -t rsa
```

默认生成的私钥为 `~/.ssh/id_rsa`

生成的公钥为`~/ssh/id_rsa.pub`







但是因为我已经有这两个文件（gitlab的sshkey），再生成就会将其覆盖掉。所以要指定保存为其他的文件名

```
ssh-keygen -t rsa -f docserver_id_rsa
```



但是由于
