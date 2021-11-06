# 变量声明

solidity的变量声明非常简单

```
<变量类型> <变量名>
<变量类型> <变量名> = <值> // 声明同时赋值
```

solidity的变量把写在函数外的变量叫状态变量，永久地储存在合约里。





# 变量类型



## 值类型

| 变量类型 | 说明                                                         |
| -------- | ------------------------------------------------------------ |
| bool     | 值为true或false，solidity中1、0不能代表true、false           |
| int/uint | 整型，int和uint默认都是256。还有int8、int16、int24、int32...int256和uint8、uint16、uint24、uint32...uint256 |
| address  | 地址类型，长度为20B，以太坊地址是由私钥算出公钥，取公钥后40位作为地址。前面会加0x,所以整个地址字符串有42个字符。 |
| byte     | 定长字节数字，有byte1，byte2，byte3...byte32。可以设定16进制或数字的字面量，也可以设定字符 |
| enum     | 枚举类型是solidity中的一种用户自定义类型                     |

```
contract test{
		// 枚举类型demo
    enum Direction{east,south,west,north}
    Direction choice;
}
```



## 引用类型





| 变量类型      | 说明                                                         |
| ------------- | ------------------------------------------------------------ |
| bytes         | 不定长字节数组是个动态数组，能够容纳任意长度的字节。         |
| string        | 字符串                                                       |
| int[]或uint[] | 数组，创建时需要利用new关键字。默认是可以通过.length修改长度的storage数字，但是也有定长的memory数组 |
| struct        | 结构体，组合数据类型                                         |

```
contract test{
    function f(){
        uint[]memory a = new uint[](7);
    }
    uint[] b;
    function g(){
        b = new uint[](7);
        b.length = 10;
        b[9] = 100;
    }

}
```

```
contract test{
    struct people{
        address addr;
        string name;
    }
}
```



## 数据位置

合约里声明的每一个变量都有一个数据位置，一般是默认的。

但是在solidity 5.0以后的版本，引用类型（bytes、string、int[]、struct）的参数/变量/返回值在声明的时候必须要显式的添加”data location”的声明（专门写在后面）。



四种data location:

storage ：永久的存储，写入区块链中（局部变量、状态变量默认是storage）



memory：在合约中的本地内存变量，生命周期很短，函数执行结束后就销毁。不会被写入区块链中持久化 (函数的入参出参都用memory)



calldata：所有函数的调用数据，包括函数参数的保存位置。不可修改，但是不会被写入区块链中持久化（external 函数的入参是强制的calldata类型）



stack：以太坊的栈，1024级深，超过就会抛出异常。一般我们在声明引用类型数据位置时不会使用stack



<font color=red>storge永久保存合约的状态变量，消耗燃料最多。memory仅保存临时变量，函数调用之后释放，消耗燃料很小。calldata包含消息体的数据，其计算需要n(非零字节数)*68的gas费用。stack仅保存很小的局部变量，免费使用，但有数量限制（16个变量）</font>