# 剑指 Offer 05 替换空格

https://leetcode.cn/problems/ti-huan-kong-ge-lcof/

**<font color=red>数组填充类：双指针从后向前</font>**

## 题目描述

> 请实现一个函数，把字符串 s 中的每个空格替换成"%20"。
>
>  
>
> ```
> 示例 1：
> 示例 1：
> 
> 输入：s = "We are happy."
> 输出："We%20are%20happy."
> ```
>
>
> 限制：
>
> ```
> 0 <= s 的长度 <= 10000
> ```

## Core

- **数组填充类：双指针从后向前**

  - **可以先预先给数组扩容带填充后的大小，然后在从后向前进行操作。**
  - 好处
    - 不用申请新数组。
    - 从后向前填充元素，避免了从前向后填充元素时，每次添加元素都要将添加元素之后的所有元素向后移动的问题。这样的时间复杂度就是O(n^2^)

  ![替换空格](https://code-thinking.cdn.bcebos.com/gifs/%E6%9B%BF%E6%8D%A2%E7%A9%BA%E6%A0%BC.gif)





## Code

```swift
class Solution {
    func replaceSpace(_ s: String) -> String {
        var strArray = Array(s)
        var blankCount: Int = 0
        // 先看有几个空格
        for i in strArray {
            if i == " " {
                blankCount += 1
            }
        }
        // left 指向旧数组的最后一个元素
        var left = strArray.count - 1
        // right 指向新数组的最后一个元素
        var right = strArray.count + blankCount * 2 - 1
        // 对数组扩容
        for _ in 0 ..< (blankCount * 2) {
            strArray.append(" ")
        }
        // 移动
        while left < right {
            if strArray[left] == " " {
                strArray[right] = "0"
                strArray[right - 1] = "2"
                strArray[right - 2] = "%"
                left -= 1
                right -= 3
            } else {
                strArray[right] = strArray[left]
                left -= 1
                right -= 1
            }
        }
        return String(strArray)
    }
}
```











