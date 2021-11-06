## 动态规划思想

动态规划（Dynamic Programming）是一种算法思想：若要解一个给定问题，我们需要解其不同部分（即子问题），再根据子问题的解以得出原问题的解。动态规划一般适用于找寻问题的最优解。





## 动态规划方法









## Leetcode

### [斐波那契数](https://leetcode-cn.com/problems/fibonacci-number/)

#### 题目描述

斐波那契数，通常用 F(n) 表示，形成的序列称为 斐波那契数列 。该数列由 0 和 1 开始，后面的每一项数字都是前面两项数字的和。也就是：

F(0) = 0，F(1) = 1
F(n) = F(n - 1) + F(n - 2)，其中 n > 1
给你 n ，请计算 F(n) 。

 

示例 1：

```
输入：2
输出：1
解释：F(2) = F(1) + F(0) = 1 + 0 = 1
```





示例 2：

```
输入：3
输出：2
解释：F(3) = F(2) + F(1) = 1 + 1 = 2
```



示例 3：

```
输入：4
输出：3
解释：F(4) = F(3) + F(2) = 2 + 1 = 3
```




提示：

0 <= n <= 30



#### 题解

1. 递归

   递归的思路就是：F(n) = F(n-1) + F(n-2)

   边界条件是n<=2，从n>2开始递归

   ```python
   class Solution:
       def fib(self, n: int) -> int:
           if n < 2:
               return n
           return self.fib(n - 1) + self.fib(n - 2)
   ```

   

2. 递归+记忆化搜索

   递归分为两段，当n<2 f(n)=n；当n>=2 f(n)=f(n-1)+f(n-2)。因此我们可以写出递归函数

   记忆化搜索可以称缓存，利用`@lru_cache()`装饰递归函数实现。本质上是一种动态规划

   ```python
   class Solution:
       def fib(self, n: int) -> int:
           @lru_cache()
           def f(n):
               if n < 2:
                   return n
               return f(n - 1) + f(n - 2)
           
           return f(n)
   
   ```

   

3. 动态规划

   本质递归思路，只不过用数组记录下来所有小于n的fib(n)

   ```python
   class Solution:
       def fib(self, n: int) -> int:
           data = [0, 1]
           for i in range(n-1):
               data.append(data[-2] + data[-1])
           return data[n]
   ```

   



