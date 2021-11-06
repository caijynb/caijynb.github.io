# 常量

声明常量的关键字是`const`

```go
func main() {
	const year = 21
	const name = "cjy"
	fmt.Printf("My name is %v,I'm %v years old", name, year)
}
```

声明常量没什么可说的，在go中唯一值得注意的一点就是：常量被声明后，可以不像变量一样一定要使用，但是不能被重新赋值，会引起编译器报错。





# 变量



## 变量声明

go声明变量的关键字是var。以下3种都是go的变量声明方式：

```go
var age_1 uint8 = 31
var age_2 = 32
age_3 := 33
```



可见go变量声明还是比较灵活的，可以带变量类型（不过和别的语言不一样的是，**Go是变量名在前变量类型在后**），也可以像python一样，不带变量类型，声明变量的同时赋值，编译器会根据变量的值自动推导变量类型。

声明变量带变量类型，但不赋值，有一个zero value。

此外，最后一种方式叫变量短命名。变量短命名可以让for循环的循环索引在循环开始的时候临时定义使用，保证它的作用域只在for循环中。



同时声明多个变量：

```go
var 变量名1, 变量名2 <变量类型>
var 变量名1, 变量名2 = 值1, 值2
变量名1, 变量名2 := 值1, 值2

// 方法1:括号包裹，变量赋值直接换行
var (
		distance=100
		speed=50
	)
```





## 变量类型

| 变量类型      | 说明                                                         |
| ------------- | ------------------------------------------------------------ |
| bool          | 布尔类型，值为true或false。go中的1和0不代表true或false       |
| int、uint     | int、uint类型会根据计算机的硬件选择最合适的位长（32位或64位）。声明整型变量时,类型推断默认使用int。 |
| Int8、uint8   | -128到127、0到255（2^8-1）                                   |
| int16、uint16 | -32768到32767、0到65535                                      |
| int32、uint32 | -2147483648到2147483647、0到4294967295                       |
| int64、uint64 | -9223372036854775808到9223372036854775807、0到18446744073709551615 |
| float64       | 64位，占用8个字节。声明浮点类型变量时,类型推断默认使用float64 |
| float32       | 32位，占用4个字节                                            |
| string        | 字符串类型，GO会把双引号包裹起来的字面值推断成string类型。   |
| [] <变量类型> | 定义数组                                                     |





# 数组

## 声明

```go
func main() {
	var names [5]string //声明一个定长数组
	names[0] = "test"
	fmt.Println(names[1]) //打印数组中未被赋值的元素并不会报错
	var ages = []int{32, 55, 32} //声明一个不定长数组并赋值
	fmt.Println(ages[1]) //55
}

```

声明定长数组并赋值，不一定要给所有元素都赋值

数字数组为声明的元素值一律为0

用变量短命名的方式声明数组，必须同时给它赋值





## 数组是值类型

这和大部分语言（如python）数组（列表）是引用类型不一样

最明显的表现是当数组作为参数传入函数的时候，别的语言都是引用传递，函数中对数组的改变直接生效。

Go则不同，是值传递，拷贝了一个新的数组参与函数的运算。作为参数的那个数组变量变量

```python
def changeFirst(arr):
    arr[0]=100
    print(arr)

if __name__ == "__main__":
    arr1 = [88, 11, 32, 11, 67]
    changeFirst(arr1)
    print(arr1)
 """
[100, 11, 32, 11, 67]
[100, 11, 32, 11, 67]
 """
```

```go
func changeFirst(arr [5]int){
	arr[0]=100
	fmt.Println(arr)
}

func main()  {
	var arr1 = [5]int{88,11,32,11,67}
	changeFirst(arr1)
	fmt.Println(arr1)
}
/*
[100 11 32 11 67]
[88 11 32 11 67]
*/
```



想让Go函数数组做参数引用传递也很简单，函数定义时参数类型前面加个`*`，函数使用传参时数组变量前面加个`&`取地址

```go
func changeFirst(arr *[5]int){
	arr[0]=100
	fmt.Println(arr)
}

func main()  {
	var arr1 = [5]int{88,11,32,11,67}
	changeFirst(&arr1)
	fmt.Println(arr1)
}

/*
&[100 11 32 11 67]
[100 11 32 11 67]
*/
```







# 切片

go语言一般不直接使用数组，而是使用切片（slice），切片是指向数组的视图。

**PS：声明数组的时候，`[]int`这种不定长数组，也是一种切片。**

```go
func main()  {
	var arr = [6]int{88,11,32,11,67,55}
	fmt.Println("arr[2:6] = ",arr[2:6])
	fmt.Println("arr[2:] = ",arr[2:])
	fmt.Println("arr[:6] = ",arr[:6])
	fmt.Println("arr[:] = ",arr[:])
}
/*
arr[2:6] =  [32 11 67 55]
arr[2:] =  [32 11 67 55]
arr[:6] =  [88 11 32 11 67 55]
arr[:] =  [88 11 32 11 67 55]
*/
```



函数参数类型写成`[]int`就是切片，切片传参，是一种引用传递的方式，函数中对切片的修改会生效到原数组上

```go
func changeSliceFirst(s []int){
	s[0]=100
	fmt.Println(s)
}

func main()  {
	var arr = [6]int{88,11,32,11,67,55}
	changeSliceFirst(arr[:])
	fmt.Println(arr)
}
/*
[100 11 32 11 67 55]
[100 11 32 11 67 55]
*/
```



## append函数

不想python，append是数组的方法。go中append是一个内置的函数，它的参数1是要操作的切片，参数2可以是（一个或多个）元素，也可以是另一个`切片...`，`...`相当于遍历这个切片的所有元素。

看到这里我们就明白了，利用append函数可以实现添加元素和删除元素

```go
func main()  {
	var arr = []int{88,11,32,22,67,55}
	arr=append(arr, 123)
	fmt.Println(arr)
	arr=append(arr[:3],arr[4:]...)
	fmt.Println(arr)
}
/*
[88 11 32 22 67 55 123]
[88 11 32 67 55 123]
*/
```





# map

就是别的语言的字典，但是go中map的value要求是同一类型

`map [<key类型>] <value类型> `

```go
func main()  {
	m := map[string] string{
		"p1":"aaa",
		"p2":"bbb",
		"p3":"ccc",
		"p4":"ddd",
	}

	for k,v := range m{
		fmt.Printf("%v 是 %v\n",k,v)
	}

}
/*
p4 是 ddd
p1 是 aaa
p2 是 bbb
p3 是 ccc
*/
```

发现遍历map并不是按顺序遍历的，而且每一次结果都不一样。这是因为map是无序的，hash map



```go
func main()  {
	m := map[string] string{
		"p1":"aaa",
		"p2":"bbb",
		"p3":"ccc",
		"p4":"ddd",
	}

	p1value := m["p1"]
	fmt.Println(p1value) // aaa
}

```



当我们去取map里不存在的key时，依然是可以取成功的，不会有报错，只不过返回零值。

那么如何判断值存不存在呢？

```go
func main()  {
	m := map[string] string{
		"p1":"aaa",
		"p2":"bbb",
		"p3":"ccc",
		"p4":"ddd",
	}

	p1value,ok := m["p4"]
	fmt.Println(p1value,ok)
	p2value,ok := m["p5"]
	fmt.Println(p2value,ok)
}
/*
ddd true
 false
*/
```



map增加或删除kv对

```go
func main()  {
	m := map[string] string{
		"p1":"aaa",
		"p2":"bbb",
		"p3":"ccc",
		"p4":"ddd",
	}

	delete(m,"p4")
	fmt.Println(m)
	m["p5"] = "eee"
	fmt.Println(m)
}

/*
map[p1:aaa p2:bbb p3:ccc]
map[p1:aaa p2:bbb p3:ccc p5:eee]
*/
```







# 结构体

go里面是没有类的，所以结构体除了像别的语言可以实现自定义的数据结构，还相当于别的语言的类。



go语言面向对象只支持封装，不支持继承和多态。

结构体的创建

```go
func main()  {
	var root treeNode
	fmt.Println(root) //{0 <nil> <nil>}
	root = treeNode{value:3}
	root.left = &treeNode{}
	root.right = &treeNode{5,nil,nil}
	root.right.left = new(treeNode)
	fmt.Println(root)
	fmt.Println(root.right)
	fmt.Println(&root.right)
	fmt.Println(*root.right)
}
```



结构体还可以通过工厂函数创建

```go
func createNode(value int) *treeNode {
	return &treeNode{value: value}
}
```

返回局部变量的地址，换别的语言就报错了，但是go没问题



## 方法

结构体的方法定义`func (接收器名 结构体名) <函数名>(<参数 参数类型>){}`

接收器名相当于其他语言的this



```go
type treeNode struct {
	value int
	left,right *treeNode
}

func createNode(value int) *treeNode {
	return &treeNode{value: value}
}

func (node treeNode) print(){
	fmt.Println(node.value)
}

func (node treeNode) setValue(value int){
	node.value = value
}

func main()  {
	var root treeNode
	root = treeNode{value:3}
	root.left = &treeNode{}
	root.right = &treeNode{5,nil,nil}
	root.right.left = new(treeNode)
	root.left.right = createNode(8)

	root.left.right.setValue(5)
	root.left.right.print() //8
}
```

依然是8，并不是我们想要的5。这是因为go里面所有的函数参数都是值传递，函数中对参数的修改并不应用到传参的那个变量上来。

我们只要在定义函数的时候将参数类型前面加`*`，就可以改成引用传递（要改变内容必须使用值接受者）

```go
func (node *treeNode) setValue(value int){
	node.value = value
}
```

这样节点setValue(5)再print()结果就是5。go给参数类型加了`*`来引用传递参数，函数中使用参数直接照常使用，不需要使用`*`或`->`来。

