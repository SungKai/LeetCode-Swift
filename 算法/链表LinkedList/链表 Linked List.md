# 链表 Linked List

## 基础知识

线性结构

链表的每一个节点由两部分构成

- **数据域（data）**
- **指针域（next）**

链表的**入口节点**称为链表的头结点也就是**head**。

![Screen Shot 2022-03-07 at 3.37.32 PM](/Users/songjiaming/Documents/Typora/leetcode-LinkedList/Screen Shot 2022-03-07 at 3.37.32 PM.png)



## 储存方式：

不同于**数组(Array)**的连续分布

> 数组(Array)：存放在连续内存空间里相同数据类型的集合

但是，连续的分配可能造成空间的浪费，而链式存储很好的解决了这个问题，不必存放在连续内存空间里

链表中的节点不是连续分布的，二十散乱分布在内存中的某地址上，分配机制取决于操作系统的内存管理

<img src="/Users/songjiaming/Documents/Typora/leetcode-LinkedList/Screen Shot 2022-03-07 at 3.38.16 PM.png" alt="Screen Shot 2022-03-07 at 3.38.16 PM" style="zoom:50%;" />

与数组的比较

|      | 插入 / 删除的时间复杂度 | 查询的时间复杂度 | 适用场景                         |
| ---- | ----------------------- | ---------------- | -------------------------------- |
| 数组 | O(n)                    | O(1)             | 数据量固定，频繁查询，较少增删   |
| 链表 | O(1)                    | O(n)             | 数据量不固定，频繁增删，较少查询 |

## 链表类型

### 单链表

### 双链表

![image-20230327130046209](/Users/songjiaming/Library/Application Support/typora-user-images/image-20230327130046209.png)



### 循环链表

链表首尾相连

![image-20230327130304537](/Users/songjiaming/Library/Application Support/typora-user-images/image-20230327130304537.png)

## 基本操作

### 删除节点

只需要把C节点的next 指针指向E节点

但是丢弃的D节点仍然占用了内存，最好是手动释放

![image-20230327130509836](/Users/songjiaming/Library/Application Support/typora-user-images/image-20230327130509836.png)

### 添加节点

只需要把C节点的next 指针指向F节点，F节点的next 指针再指向D节点

![image-20230327130725971](/Users/songjiaming/Library/Application Support/typora-user-images/image-20230327130725971.png)





## 重要知识点

### 链表表示方法

```swift
public class ListNode<E> {
    public var val: E
    public var next: ListNode?
    public init(_ val: E) {
        self.val = val
        self.next = nil
    }
}
```



### 虚拟头节点 dummyHead

在进行链表操作时，尤其是删除节点时，经常会因为对当前节点进行操作而导致**内存**或者**指针**出现问题

解决方法：

1. 尽量处理当前节点的下一个节点而不是当前节点本身
2. 使用虚拟头节点dummyHead，也能够统一操作











