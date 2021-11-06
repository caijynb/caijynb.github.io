## 链表结构

链表是基础常考的一种数据结构

链表是一种线性表，但不是线性的顺序存储，而是在每一个节点里存当前节点的值，和下一个节点的位置指针

```
class ListNode:
	def __init__(self, val=0, next=None):
		self.val = val
		self.next = next
```



PS: 链表是一个抽象的数据结构，或者说严格来说并没有一个链表的数据类型。一般我们都是定义节点(ListNode)类型，通过头节点，从而在逻辑上形成了整个链表。



## 链表方法

### 遍历链表

```python
while L:
	L.val
	L = L.next
```









## Leetcode

### [两数相加](https://leetcode-cn.com/problems/add-two-numbers/)

#### 题目描述

给你两个 非空 的链表，表示两个非负的整数。它们每位数字都是按照 逆序 的方式存储的，并且每个节点只能存储 一位 数字。

请你将两个数相加，并以相同形式返回一个表示和的链表。

你可以假设除了数字 0 之外，这两个数都不会以 0 开头。

 

示例 1：

![](https://assets.leetcode-cn.com/aliyun-lc-upload/uploads/2021/01/02/addtwonumber1.jpg)



```
输入：l1 = [2,4,3], l2 = [5,6,4]
输出：[7,0,8]
解释：342 + 465 = 807.
```



示例 2：

```
输入：l1 = [0], l2 = [0]
输出：[0]
```



示例 3：

```
输入：l1 = [9,9,9,9,9,9,9], l2 = [9,9,9,9]
输出：[8,9,9,9,0,0,0,1]
```



提示：

每个链表中的节点数在范围 [1, 100] 内
0 <= Node.val <= 9
题目数据保证列表表示的数字不含前导零



#### 题解

很简单的思路，就是把链表转数字，数字相加转回链表。这样就不需要考虑进位的问题，也不需要考虑链表长度不一的问题。

留意toll这个函数把数字转成链表，返回的只是头节点。所以我们需要两个变量，一个变量保存头节点，一个变量用于遍历，让节点不断向下。

```python
# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
def tonum(L):
    result = 0
    i = 0
    while L:
        result += L.val * 10**i
        i += 1
        L = L.next
    return result
    
def toll(n):
    num = n - n//10 *10
    temp = cur = ListNode(num)
    n = n // 10
    while n:
        (n,s) = divmod(n,10)
        cur.next = ListNode(s)
        cur = cur.next
    return temp

class Solution:
    def addTwoNumbers(self, l1: ListNode, l2: ListNode) -> ListNode:
        n1 = tonum(l1)
        n2 = tonum(l2)
        n = n1 + n2
        return toll(n)
```





### [反转链表](https://leetcode-cn.com/problems/UHnkqh/)

#### 题目描述

给定单链表的头节点 head ，请反转链表，并返回反转后的链表的头节点。

 

示例 1：

![](https://assets.leetcode.com/uploads/2021/02/19/rev1ex1.jpg)

```
输入：head = [1,2,3,4,5]
输出：[5,4,3,2,1]
```



示例 2：

![](https://assets.leetcode.com/uploads/2021/02/19/rev1ex2.jpg)

```
输入：head = [1,2]
输出：[2,1]
```



示例 3：

```
输入：head = []
输出：[]
```




提示：

链表中节点的数目范围是 [0, 5000]
-5000 <= Node.val <= 5000



#### 题解

```python
class Solution:
    def reverseList(self, head: ListNode) -> ListNode:
        if not head:
            return head
        arr = []
        while head:
            arr.append(head.val)
            head = head.next

        i = len(arr)-1
        newhead = cur = ListNode(arr[i])
        i -= 1
        while i >= 0 :
            cur.next = ListNode(arr[i])
            cur = cur.next
            i -= 1
        return newhead
```



和两数相加比较像的思路，先转数组，再数组转链表。这里一开始犯傻了，没有设两个变量且循环只有`cur.next = ListNode(arr[i])`，head=[1 2 3 4 5] ，返回的结果是[5 1]。加了`cur = cur.next`，返回的结果是[1]

所以必须设置两个变量，一个变量用于保存头节点，一个变量用于遍历

