![](https://cdn.jsdelivr.net/gh/cjyshow/docimg@main/sortComplexity.png)



# 冒泡排序

冒泡排序是最简单基础的算法，就是遍历元素，每次遍历元素时将它逐个和后面的元素比大小，按比较结果决定是否交换顺序。所有元素遍历完，得到的数组就是有序的。

因为每次都是把较小（大）的元素移到后面，所以非常形象的像桶装水的气泡向上冒，因而被称为冒泡排序。



实际上标准的冒泡排序时间复杂度始终为o(n^2)。有序情况下时间复杂度是o(n)，是改进了冒泡排序的算法，设置了一个标志位。



```python
def bubbleSort(arr):
    n =len(arr)
    for i in range(n-1):
        for j in range(i+1,n):
            if arr[i] > arr[j]:
                arr[i],arr[j] = arr[j],arr[i]
		return arr

```

![](https://cdn.jsdelivr.net/gh/cjyshow/docimg@main/bubble%20sort.gif)



# 选择排序

选择排序在思路上也很简单，就是依次从未排序的数组中找出最小（大）的成员，放到已排序数组的末尾。

升序排列（从小到大）就设minIndex

```python
def selectSort(arr):
  n = len(arr)
  
  for i in range(n - 1):
		minIndex = i
    for j in range(i + 1, n):
			if arr[j] > arr[minIndex]:
				minIndex = j
        
    # 当i对应的数不是最小数时，将其互换
    if i != minIndex:
      arr[i], arr[minIndex] = arr[minIndex], arr[i]
    
   return arr
```

![](https://cdn.jsdelivr.net/gh/cjyshow/docimg@main/select%20sort.gif)







# 快速排序

快排应该是最有名的一种排序方式，思路其实也还成，但是实现上要比冒泡排序和选择排序难很多。对应的快排自然也会快很多，虽然在最极端情况下它的时间复杂度也是接近于o(n^2)



快排到思路是从数列里挑出一个元素，设为基准（pivot），然后将比它小的元素移到它左边，将比它大的元素移到它右边，这个叫分区操作。分区结束后这个元素就处于数列的中间位置。递归操作左分区和右分区。



为了操作简单，我们一般是选左端点作为基准值的。但是这样容易出现极端情况(如果本身就是升序数组的话，这样的时间复杂度拉满)，所以可以选一个随机值。让其与左端点互换。

```python
def quickSort(arr, start, end):
            # 只剩一个元素时，不用再进行排序
            if start >= end: return arr
            
            pivot = arr[start]
            l, r = start, end
            rdx = random.randint(start, end)
            nums[start], nums[rdx] = nums[rdx], nums[start]
            while l < r:
                # 循环到右边比基准值小的成员结束。
                while l < r and arr[r] >= pivot:
                    r -= 1
                # 循环直到左边比基准值大的成员结束。
                while l < r and arr[l] <= pivot:
                    l += 1
                
                # 交换左边比基准值大，右边比基准值小的两个数位置。让小的去左边，大的去右边
                arr[l], arr[r] = arr[r], arr[l]
            
            # 通过交换左指针和左端点位置来确定基准点的位置
            arr[start], arr[l] = arr[l], arr[start]
            
            # 递归操作。
            quick_sort(start, l-1)
            quick_sort(l+1, end)
```



![](https://cdn.jsdelivr.net/gh/cjyshow/docimg@main/quick%20sort.gif)
