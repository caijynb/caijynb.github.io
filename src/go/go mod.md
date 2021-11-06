go的依赖管理，经历了GOPATH、GOVENDOR，但是这些都是靠修改路径实现的，比较繁琐。直到18年时GO 1.11推出了go mod，这才是比较成熟的依赖管理方式。

## GOPATH

新建一个目录，`export GOPATH=`这个目录。 再目录下新建一个src目录，把包放src下





## vendor

每个项目下新建一个vendor目录，把包放vendor目录下

解决不同项目使用不同版本的同一个包的冲突问题





## go module

new project -> go modules

 （这是ide的快捷操作，我们也可以自行在project目录下使用`go mod init`命令初始化go.mod文件）



项目会有一个`go.mod`

```
go get -u go.uber.org/zap
```

go get 安装依赖，-u 表示把如果之前安装过，更新最新版安装。![](https://cdn.jsdelivr.net/gh/cjyshow/docimg@main/zap mod.png)



go module下载下来的包在`GOROOT/pkg/mod`里：

![](https://cdn.jsdelivr.net/gh/cjyshow/docimg@main/pkg.png)



如何添加新的包呢？继续使用`go get`。

原来是可以直接代码中import，go run的时候会自动解析下载包。但go 1.16版本后，运行go命令（go run, go build,go test）时，如果import的依赖在go.mod文件中没有，不会再自动下载并修改go.mod和go.sum文件，而会提示需要手动执行 go get命令下载对应的包。原因是如果导入的包在没有提供任何依赖的情况自动添加新依赖，则可能会引起公共依赖包的升级等。



如果我们更新了项目的依赖，go.mod、go.sum文件可能会多一些文件。可以使用`go mod tidy`清理多余没有用的依赖

