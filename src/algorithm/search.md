## 顺序查找

没什么好说的，就是遍历整个数组。因为我们刷题用的程序语言是python，用`enumerate`定位到某个元素的同时可以直接返回它的索引



## 二分查找

二分查找是一种在有序数组（嗯，前面学的排序算法不就派上用场了）中找一特定元素的算法。搜索过程从数组的中间元素开始，如果中间元素正好是要查找的元素，则搜索过程结束；如果某一特定元素大于或者小于中间元素，则在数组大于或小于中间元素的那一半中查找，而且跟开始一样从中间元素开始比较。如果在某一步骤数组为空，则代表找不到。这种搜索算法每一次比较都使搜索范围缩小一半。

```python
def search(nums, target):
        left, right = 0, len(nums) - 1
        # 左端点和右端点比较，一定是<=。最简单的例子，列表只有一个元素，左右端点都是0，如果只是<，没法比。
        while left <= right:
            # //是python的整除，这里left+(right-left)//2 就是(left+right)//2，这么写能防溢出。
            mid = left + (right - left) // 2
            if nums[mid] == target:
                return mid
            # 目标值比中值小，右端点变成中点-1，很好理解、 反之左端点变成中值+1
            if target < nums[mid]:
                right = mid - 1
            else:
                left = mid + 1
        return -1

```

