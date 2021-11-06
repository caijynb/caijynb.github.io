# 包

* 每个目录只能有一个包（目录名和包名可以不同，约定上一般目录名和包名保持一致。一个包可以由多个go文件组成，所以显然包名和go文件名可以不同）
* main包包含可执行入口，即main函数必须写在main包里面
* go因为没有继承，所以只有public和private两种访问属性，不需要额外声明。包名、结构名、结构内变量名，结构方法名**首字母大写表示对别的包可见（public），首字母小写表示对别的包不可见（private）**



tree/node.go

```go
package tree

import "fmt"

type TreeNode struct {
	Value int
	Left,Right *TreeNode
}


func (node TreeNode) Print(){
	fmt.Println(node.Value)
}

func (node *TreeNode) SetValue(value int){
	node.Value = value
}
```



tree/entry/entry.go

```go
package main

import "studygo/tree"

func main()  {
	var root tree.TreeNode
	root.SetValue(5)
	root.Print()
}

```





# 拓展已有类型

因为go里面的包不支持继承，那么我们能不能在别的包使用这个包给它的结构新增一些方法呢？

当然是可以的，我们只需要新定义一个结构，这个结构只定义一个属性变量，类型是原来的结构（注意用引用传递），就可以写这个结构的方法。



tree/entry/entry.go

```go
package main

import (
	"fmt"
	"studygo/tree"
)

type myTreeNode struct {
	node *tree.TreeNode
}

func (mynode myTreeNode) isEven()  {
	if mynode.node.Value % 2 == 0{ //mynode.node mynode是没有node属性的
		fmt.Println("yes")
	}

}

func main()  {
	var root tree.TreeNode
	root.SetValue(8)
	root.Print()
	myTreeNode{&root}.isEven()
}
```



但是这样子写还是有点麻烦，可以使用内嵌的方式省略属性变量的定义。新定义的struct直接引用传递原来的struct，不需要写属性变量。拓展的方法也不需要再指向某个属性。

```go
package main

import (
	"fmt"
	"studygo/tree"
)

type myTreeNode struct {
	*tree.TreeNode
}

func (mynode myTreeNode) isEven()  {
	if mynode.Value % 2 == 0{
		fmt.Println("yes")
	}

}

func main()  {
	var root tree.TreeNode
	root.SetValue(8)
	root.Print()
	myTreeNode{&root}.isEven()
}
```



