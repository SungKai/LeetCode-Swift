# 牛客JZ8 二叉树的下一个结点

https://www.nowcoder.com/practice/9023a0c988684a53960365b889ceaf5e?tpId=13&tqId=11210&tPage=1&rp=1&ru=/ta/coding-interviews&qru=/ta/coding-interviews/question-ranking&from=cyc_github

`medium`

**<font color=red>有指向父节点的指针，中序遍历</font>**

## 题目描述

> 给定一个二叉树其中的一个结点，请找出中序遍历顺序的下一个结点并且返回。注意，树中的结点不仅包含左右子结点，同时包含指向父结点的next指针。下图为一棵有9个节点的二叉树。树中从父节点指向子节点的指针用实线表示，从子节点指向父节点的用虚线表示
>
> <img src="https://uploadfiles.nowcoder.com/images/20210616/557336_1623844408327/D03B8D5BB902D4516BB92CB216E58EC4" alt="img" style="zoom: 50%;" />
>
> 示例:
>
> ```
> 输入:{8,6,10,5,7,9,11},8
> 
> 返回:9
> ```

## Core

- 分情况：
  - b：下一个节点是右子树的最左
  - d/i：向上遍历找第一个是其父节点的左子树 的节点



## Code

```swift
/**
 * public class TreeLinkNode {
 *   public var val: Int
 *   public var left: TreeLinkNode?
 *   public var right: TreeLinkNode?
 *   public var next: TreeLinkNode?
 *   public init(_ val: Int=0, _ left: TreeLinkNode?=nil, _ right: TreeLinkNode?=nil, _ next: TreeLinkNode?=nil) {
 *     self.val = val
 *     self.left = left
 *     self.right = right
 *     self.next = next
 *   }
 * }
 */
public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     * 
     * @param pNode TreeLinkNode类 
     * @return TreeLinkNode类
     */
    func GetNext ( _ pNode: TreeLinkNode?) -> TreeLinkNode? {
        guard let pNode = pNode else {
        return nil
    }
    if pNode.right != nil {
        var node = pNode.right
        while node?.left != nil {
            node = node?.left
        }
        return node
    }
    var parentNode = pNode.next
    var curNode = pNode
    while parentNode != nil, parentNode?.left !== curNode {
        curNode = parentNode!
        parentNode = parentNode?.next
    }
    return parentNode
    }
}
```





