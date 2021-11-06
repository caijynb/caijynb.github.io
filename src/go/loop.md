## for循环

```go
func main() {
	var count = 10
	for count > 0 {
		fmt.Println(count)
		time.Sleep(time.Second)
		count--
	}
}
```

当然这样比较不优雅，**变量的设置;变量的比较;变量的自增自减**都可以写在for后面

```go
func main()  {
	var arr1 = [5]int{88,11,32,11,67}
	for i:=0;i<len(arr1);i++{
		fmt.Println(arr1[i])
	}
}
```





有意思的是，Go是没有while关键字的，是通过不为for语句设置任何条件来产生无限循环的，然后在有需要的时候通过在循环体内部使用break语句跳出循环



```go
func main() {
	var degrees = 0
	for {
		fmt.Println(degrees)
		degrees++
		if degrees >= 10 {
			degrees = 0
			if rand.Intn(2) == 0 {
				break
			}
		}
	}

}
```



## 遍历数组





go的for循环非常棒，默认的遍历和python的`enumerate`一样，返回索引和元素。但是我们这里不需要索引值，就用`_`占位。

```go
func main(){
	namearr := [] string{"zhangsan","lisi","wangwu"}
	for i,name := range namearr{
		fmt.Printf("第%v人是：%v \n",i+1,name)
	}
}
```

```go
func main(){
	namearr := [] string{"zhangsan","lisi","wangwu"}
	for _,name := range namearr{
		fmt.Println(name)
	}
}
```

