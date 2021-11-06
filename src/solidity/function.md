solidity是门静态类型语言，对数据类型要求比较严格。solidity里面函数在定义时，如果有参数，必须以`<类型> 参数名`的方式声明。如果函数有返回值，必须以`returns (<类型>)`的方式一并声明。



```
function hello() constant returns (string){
	return "hello";
}
```



