# Introduction

Gin是一个go开发的http web框架，具有高性能的优点。

gin的话，和普通web框架的差别就在于gin不负责前端的实现，只专注于写接口。



# 安装

```
 go get -u github.com/gin-gonic/gin
```



# 导入

```
import "github.com/gin-gonic/gin"
```



```go
package main

import "github.com/gin-gonic/gin"

func main() {
	r := gin.Default()
	r.GET("/ping", func(c *gin.Context) {
		c.JSON(200, gin.H{
			"message": "pong",
		})
	})
	r.Run() // listen and serve on 0.0.0.0:8080 (for windows "localhost:8080")
}
```



```
go run example.go
```

![](https://cdn.jsdelivr.net/gh/cjyshow/docimg@main/gin%20ping.png)
