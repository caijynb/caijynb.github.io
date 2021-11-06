solidity中不支持switch，条件判断只有if、else if和else

```
if (<条件>){
	<执行代码>
}
```



条件后面不需要跟`:`号

条件判断的括号不可省略，但是执行代码如果是单行的话，大括号可以省略。



```
if (totalPoints > bet.line)
	balances[bet.over] += bet.amount*2;
	
else if (totalPints<bet.line)
	balances[bet.under] +=bet.amount*2;

else{
	balances[bet.under] += bet.amount;
	balance[bet.over] += bet.amount;
}
```





PS: solidity不像其他语言，1不等于True，不是布尔类型。