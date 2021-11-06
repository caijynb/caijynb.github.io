## 使用if进行分支判断

```
func main() {
	var today = "monday"
	if today == "monday"{
		fmt.Println("fuck")
	} else if today == "friday" {
		fmt.Println("nice")
	} else {
		fmt.Println("boring")
		}

}
```





if 条件{

​    语句

}



不需要像python一样加:



## 使用switch进行分支判断

switch 变量{

case <目标值1>:

​    语句1

case <目标值2>:

​    语句2

}



```go
func main() {
	var today = "tuesday"
	switch today {
	case "monday": //case 目标值:
		fmt.Println("fuck")
	case "friday":
		fmt.Println("nice")
	case "tuesday", "wednesday", "thursday": //使用,分割多个可选值
		fmt.Println("boring")
	}
}
```





switch的另一种用法是像if...else if...一样，在每个分支中单独设置比较条件

```go
func main() {
	var today = "tuesday"
	switch {
	case today == "monday": //case 目标值:
		fmt.Println("fuck")

	case today == "tuesday":
		fmt.Println("boring")

	case today == "friday":
		fmt.Println("nice")
	}
}
```





此外，go语言switch还有独特的fallthrough关键字，用于执行下一个分支的代码

```go
func main() {
	var today = "tuesday"
	switch {
	case today == "monday": //case 目标值:
		fmt.Println("fuck")

	case today == "tuesday":
		fmt.Println("boring")
		fallthrough
	case today == "friday":
		fmt.Println("nice")
	}
}
```



之前是只单单打印一个boring，现在会连着打印boring和nice

