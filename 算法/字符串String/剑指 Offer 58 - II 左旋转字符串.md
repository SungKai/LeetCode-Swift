# 剑指 Offer 58 - II 左旋转字符串

https://leetcode.cn/problems/zuo-xuan-zhuan-zi-fu-chuan-lcof/

**<font color=red>反转字符串思路</font>**

## 题目描述

> 字符串的左旋转操作是把字符串前面的若干个字符转移到字符串的尾部。请定义一个函数实现字符串左旋转操作的功能。比如，输入字符串"abcdefg"和数字2，该函数将返回左旋转两位得到的结果"cdefgab"。
>
>  
>
> ```
> 示例 1：
> 
> 输入: s = "abcdefg", k = 2
> 输出: "cdefgab"
> ```
>
> ```
> 示例 2：
> 
> 输入: s = "lrloseumgh", k = 6
> 输出: "umghlrlose"
> ```
>
>
> 限制：
>
> ```
> 1 <= k < s.length <= 10000
> ```



## Core

- 双指针
- 题目思路：
  - 反转区间为前n的子串
  - 反转区间为n到末尾的子串
  - 反转整个字符串

![img](https://code-thinking.cdn.bcebos.com/pics/%E5%89%91%E6%8C%87Offer58-II.%E5%B7%A6%E6%97%8B%E8%BD%AC%E5%AD%97%E7%AC%A6%E4%B8%B2.png)

## Code

```swift
class Solution {
    func reverseLeftWords(_ s: String, _ n: Int) -> String {
        var strArray = Array(s)
        // 1.先翻转前n个
        reverseStr(&strArray, 0, n - 1)
        // 2.翻转后面的
        reverseStr(&strArray, n, strArray.count - 1)
        // 3.全部翻转
        reverseStr(&strArray, 0, strArray.count - 1)
        return String(strArray)
    }
    func reverseStr(_ s:inout [Character],  _ startIndex: Int, _ endIndex: Int) {
        var start = startIndex
        var end = endIndex
        while start < end {
            (s[start], s[end]) = (s[end], s[start])
            start += 1
            end -= 1
        }
    }
}
```





