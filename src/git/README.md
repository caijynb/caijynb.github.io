# Introduction



## 多ssh key共存

现在git的提交都通过ssh的方式，需要我们生成一对公私钥，将公钥复制到git网站设置里。

我们最常用的是github，但是一般公司会自建内部的git服务器。如果默认配置的话，那我们只能二选一，这显然是非常不便的。

所以我们要配置多密钥的共存



生成公司邮箱对应的ssh密钥（默认是在~/.ssh 生成id_rsa和id_rsa.pub，但是我们用-f参数指定后，生成的是company和company.pub)

```
ssh-keygen -t rsa -C "xxx@company.com" -f ~/.ssh/company
```



生成github对应的ssh密钥

```
ssh-keygen -t rsa -C "xxx@qq.com" -f ~/.ssh/github
```



去公司的git网站和github，添加ssh key

在~/.ssh目录下，`touch config`

```
# hyperchain
Host git.hyperchain.cn
HostName git.hyperchain.cn
PreferredAuthentications publickey
IdentityFile ~/.ssh/hyperchain

# github
Host github.com
HostName github.com
PreferredAuthentications publickey
IdentityFile ~/.ssh/github
```



通过git的方式将远程仓库和本地仓库关联起来，试了一下，可以提交。但是发现了另一个问题，就是往github提交，提交记录显示的用户名是公司的git账号用户名。



这是因为我很早之前全局设置git的用户名和邮箱(默认的git配置文件：~/.gitconfig)

```
git config --global user.name <用户名>
git config --global user.email <邮箱>
```

```
[user]
	name = caijiayu
	email = caijiayu@hyperchain.cn
```



所以我们要在github的项目目录下重新设置git的用户名和密码

```
git config user.name cjyshow
git config user.email admin@cjy.show
```





