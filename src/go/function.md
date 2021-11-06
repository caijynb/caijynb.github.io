go定义函数的关键字是`func`

函数声明方式：

```
func 函数名(<参数名> <参数类型>) <返回值类型>{
	代码
}
```

其中参数名和返回值类型都是可选的





## 匿名函数

```go
var f = func (){ fmt.Println("hello,world")}

func main(){
	f()
}
```

```go
var f = func (x string){ fmt.Println(x)}

func main(){
	f("hello,world")
}
```

