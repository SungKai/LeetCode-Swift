# 二叉树 Binary Tree

## 种类

- **满二叉树**

只有度为0的结点和度为2的结点，并且度为0的结点在同一层上，则这棵二叉树为满二叉树。 

/ 深度为k，有2^k - 1 个节点的二叉树

<img src="/Users/songjiaming/Library/Application Support/typora-user-images/image-20230514120611320.png" alt="image-20230514120611320" style="zoom:50%;" />

- **完全二叉树**

在完全二叉树中，除了最底层节点可能没填满外，其余每层节点数都达到最大值，并且最下面一层的节点都集中在该层最左边的若干位置。

![image-20230514120815410](/Users/songjiaming/Library/Application Support/typora-user-images/image-20230514120815410.png)

- **搜索二叉树**

有数值，有序树

左儿子 < 根节点 < 右儿子

![image-20230514122048570](/Users/songjiaming/Library/Application Support/typora-user-images/image-20230514122048570.png)

- 平衡二叉搜索树AVL（Adelson-Velsky and Landis）

它是一棵空树或它的左右两个子树的高度差的绝对值不超过1，并且左右两个子树都是一棵平衡二叉树。

![image-20230514122201321](/Users/songjiaming/Library/Application Support/typora-user-images/image-20230514122201321.png)





## 存储方式

### 链式存储

使用指针，类似链表

![image-20230514122402078](/Users/songjiaming/Library/Application Support/typora-user-images/image-20230514122402078.png)

### 顺序存储

<img src="/Users/songjiaming/Library/Application Support/typora-user-images/image-20230514122431346.png" alt="image-20230514122431346"  />

## 遍历方式

### 深度优先遍历

先往深走，遇到叶子节点再往回走。

- 前序遍历（递归法，迭代法）
- 中序遍历（递归法，迭代法）
- 后序遍历（递归法，迭代法）



**这里前中后，其实指的就是中间节点的遍历顺序**，只要记住 **前中后序指的就是中间节点的位置**就可以了。

看如下中间节点的顺序，就可以发现，中间节点的顺序就是所谓的遍历方式

- 前序遍历：中左右
- 中序遍历：左中右
- 后序遍历：左右中

![image-20230514123441969](/Users/songjiaming/Library/Application Support/typora-user-images/image-20230514123441969.png)

经常会使用**递归**的方式来实现深度优先遍历，也就是实现前中后序遍历。

**之前学习讲栈与队列的时候，就说过栈其实就是递归的一种实现结构**，也就说前中后序遍历的逻辑其实都是可以借助**栈**使用**非递归**的方式来实现的。

### 广度优先遍历

一层一层的去遍历

- 层次遍历（迭代法）

- 层次遍历（迭代法）

而广度优先遍历的实现一般使用**队列**来实现，这也是队列**先进先出**的特点所决定的，因为需要先进先出的结构，才能**一层一层的来遍历二叉树**。



## 二叉树的定义

```swift
class TreeNode<T> {
  var value: T
  var left: TreeNode?
  var right: TreeNode?
  init(_ value: T, left: TreeNode? = nil, right: TreeNode? = nil) {
		self.value = value
    self.left = left
    self.right = right
  }
}
```

