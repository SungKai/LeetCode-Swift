//
//  main.swift
//  BinaryTreeLeetcode
//
//  Created by 宋开开 on 2023/8/5.
//

import Foundation

class TreeNode<T> {
    var val: T
    var left: TreeNode?
    var right: TreeNode?
    init(_ val: T) {
        self.val = val
        self.left = nil
        self.right = nil
    }
    init(_ val: T, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

class Node {
    var val: Int
    var left: Node?
    var right: Node?
    var next: Node?
    init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
        self.next = nil
    }
}

class NNode {
    var val: Int
    var children: [NNode?]
    init(_ val: Int) {
        self.val = val
        self.children = []
    }
}

/// 创建二叉树
func buildTreeFromLevelOrderArray(_ array: [Int?]) -> TreeNode<Int>? {
    guard array.count > 0, let rootValue = array.first else {
        return nil
    }
    let root: TreeNode<Int>? = TreeNode(rootValue!)
    var queue = [TreeNode<Int>?]()
    queue.append(root)
    var currentIndex = 1
    
    while currentIndex < array.count {
        if let currentTreeNode = queue.removeFirst() {
            if let leftValue = array[currentIndex] {
                let leftChild = TreeNode(leftValue)
                currentTreeNode.left = leftChild
                queue.append(leftChild)
            }
            currentIndex += 1
            if currentIndex < array.count, let rightValue = array[currentIndex] {
                let rightChild = TreeNode(rightValue)
                currentTreeNode.right = rightChild
                queue.append(rightChild)
            }
            currentIndex += 1
        }
    }
    return root
}


// 输出二叉树
func showBinaryTree(_ root: TreeNode<Int>?) {
    guard let node = root else {
        return
    }
    print(node.val)
    showBinaryTree(node.left)
    showBinaryTree(node.right)
}

// 144. 二叉树的前序遍历
// [1, null, 2, 3], [], [1]
// 递归recursion
func preorderTraversal_recursion(_ root: TreeNode<Int>?) -> [Int] {
    var res = [Int]()
    preorder(root, &res)
    return res
}
func preorder(_ root: TreeNode<Int>?, _ res: inout [Int]) {
    if root == nil {
        return
    }
    res.append(root!.val)
    preorder(root!.left, &res)
    preorder(root!.right, &res)
}

// 迭代iteration
func preorderTraversal_iteration(_ root: TreeNode<Int>?) -> [Int] {
    var res = [Int]()
    if root == nil {
        return res
    }
    var stack = [TreeNode<Int>?]()
    stack.append(root)
    while !stack.isEmpty {
        let current = stack.removeLast()
        if let node = current?.right {  // 右
            stack.append(node)
        }
        if let node = current?.left {  // 左
            stack.append(node)
        }
        res.append(current!.val) // 中
    }
    return res
}

// 94. 二叉树的中序遍历
// 递归
func inorderTraversal_recursion(_ root: TreeNode<Int>?) -> [Int] {
    var res = [Int]()
    if root == nil {
        return res
    }
    inorder(root, &res)
    return res
}

func inorder(_ root: TreeNode<Int>?, _ res: inout [Int]) {
    if root == nil {
        return
    }
    inorder(root!.left, &res)
    res.append(root!.val)
    inorder(root!.right, &res)
}

// 迭代
func inorderTraversal_iteration(_ root: TreeNode<Int>?) -> [Int] {
    var res = [Int]()
    if root == nil {
        return res
    }
    var stack = [TreeNode<Int>?]()
    var currentNode = root
    while !stack.isEmpty || currentNode != nil {
        if currentNode != nil {
            stack.append(currentNode)
            currentNode = currentNode?.left
        } else {
            currentNode = stack.removeLast()
            res.append(currentNode!.val)
            currentNode = currentNode?.right
        }
    }
    return res
}

// 145. 二叉树的后序遍历
// 递归
func postorderTraversal_recursion(_ root: TreeNode<Int>?) -> [Int] {
    var res = [Int]()
    if root == nil {
        return res
    }
    postorder(root, &res)
    return res
}

func postorder(_ root: TreeNode<Int>?, _ res: inout [Int]) {
    if root == nil {
        return
    }
    postorder(root?.left, &res)
    postorder(root?.right, &res)
    res.append(root!.val)
}

// 迭代
func postorderTraversal_iteration(_ root: TreeNode<Int>?) -> [Int] {
    var res = [Int]()
    if root == nil {
        return res
    }
    var stack = [TreeNode<Int>?]()
    stack.append(root)
    while !stack.isEmpty {
        // 左右中 中右左
        let currentNode = stack.removeLast()
        if let left = currentNode?.left {  // 左
            stack.append(left)
        }
        if let right = currentNode?.right {  // 右
            stack.append(right)
        }
        res.append(currentNode!.val)  // 中
    }
    return res.reversed()
}

// 102.层序遍历
// [3,9,20,null,null,15,7], [], [1]
func levelOrder(_ root: TreeNode<Int>?) -> [[Int]] {
    var res = [[Int]]()
    if root == nil {
        return res
    }
    var queue = [root]
    while !queue.isEmpty {
        let count = queue.count
        var subArray = [Int]()
        for _ in 0 ..< count {
            let node = queue.removeFirst()
            subArray.append(node!.val)
            if let node = node?.left {
                queue.append(node)
            }
            if let node = node?.right {
                queue.append(node)
            }
        }
        res.append(subArray)
    }
    return res
}

// 107. 二叉树的层序遍历 II (自底向上的层序遍历)
func levelOrderBottom(_ root: TreeNode<Int>?) -> [[Int]] {
    var res = [[Int]]()
    if root == nil {
        return res
    }
    var queue = [root]
    while !queue.isEmpty {
        let count = queue.count
        var subArray = [Int]()
        for _ in 0 ..< count {
            let node = queue.removeFirst()
            subArray.append(node!.val)
            if let node = node?.left {
                queue.append(node)
            }
            if let node = node?.right {
                queue.append(node)
            }
        }
        res.insert(subArray, at: 0)
    }
    return res
}

// 199. 二叉树的右视图
// [1,2,3,null,5,null,4], []
func rightSideView(_ root: TreeNode<Int>?) -> [Int] {
    var res = [Int]()
    if root == nil {
        return res
    }
    var queue = [root]
    while !queue.isEmpty {
        let count = queue.count
        for i in 0 ..< count {
            let node = queue.removeFirst()
            if let val = node?.val {
                if i == count - 1 {
                    res.append(val)
                }
            }
            if let node = node?.left {
                queue.append(node)
            }
            if let node = node?.right {
                queue.append(node)
            }
        }
    }
    return res
}

// 116. 填充每个节点的下一个右侧节点指针
// [1,2,3,4,5,6,7], [], [1]
func connect(_ root: Node?) -> Node? {
    guard let root = root else {
        return nil
    }
    var queue: [Node?] = [root]
    while !queue.isEmpty {
        let count = queue.count
        var index = 0
        while index < count - 1 {
            let node = queue[index]
            node?.next = queue[index + 1]
            index += 1
        }
        for _ in 0 ..< count {
            let node = queue.removeFirst()
            if let left = node?.left {
                queue.append(left)
            }
            if let right = node?.right {
                queue.append(right)
            }
        }
    }
    return root
}

// 226. 翻转二叉树
// 递归
func invertTree_recursion(_ root: TreeNode<Int>?) -> TreeNode<Int>? {
    guard let root = root else {
        return root
    }
    swap(&root.left, &root.right)
    _ = invertTree_recursion(root.left)
    _ = invertTree_recursion(root.right)
    return root
}

// 迭代
func invertTree_iteration(_ root: TreeNode<Int>?) -> TreeNode<Int>? {
    guard let root = root else {
        return root
    }
    var stack = [root]
    while !stack.isEmpty {
        
        guard let node = stack.popLast() else {
            break
        }
        swap(&node.left, &node.right)
        if let node = node.left {
            stack.append(node)
        }
        if let node = node.right {
            stack.append(node)
        }
    }
    return root
}

// 101. 对称二叉树
// [1,2,2,3,4,4,3], []
func isSymmetric(_ root: TreeNode<Int>?) -> Bool {
    guard let root = root else {
        return false
    }
    var stack = [TreeNode<Int>?]()
    stack.append(root.left)
    stack.append(root.right)
    
    while !stack.isEmpty {
        let right = stack.removeLast()
        let left = stack.removeLast()
        if left == nil, right == nil {
            continue
        }
        if left == nil || right == nil || left!.val != right!.val {
            return false
        }
        stack.append(left?.right)
        stack.append(right?.left)
        stack.append(left?.left)
        stack.append(right?.right)
    }
    return true
}

// 572. 另一棵树的子树
func isSubtree(_ root: TreeNode<Int>?, _ subtree: TreeNode<Int>?) -> Bool {
    if root == nil || subtree == nil {
        return false
    }
    var queue = [root]
    while !queue.isEmpty {
        let count = queue.count
        for _ in 0 ..< count {
            let node = queue.removeFirst()
            if node!.val == subtree!.val {
                if isSame(node, subtree) {
                    return true
                }
            }
            if let left = node?.left {
                queue.append(left)
            }
            if let right = node?.right {
                queue.append(right)
            }
        }
    }
    return false
}

func isSame(_ root: TreeNode<Int>?, _ subtree: TreeNode<Int>?) -> Bool {
    var stack = [TreeNode<Int>?]()
    stack.append(root)
    stack.append(subtree)
    while !stack.isEmpty {
        let right = stack.removeLast()
        let left = stack.removeLast()
        if left == nil, right == nil {
            continue
        }
        if left == nil || right == nil || left!.val != right!.val {
            return false
        }
        stack.append(left?.left)
        stack.append(right?.left)
        stack.append(left?.right)
        stack.append(right?.right)
    }
    return true
}

// 559. N 叉树的最大深度
func maxDepth(_ root: NNode?) -> Int {
    var res = 0
    if root == nil {
        return res
    }
    var queue: [NNode?] = [root]
    while !queue.isEmpty {
        let count = queue.count
        res += 1
        for _ in 0 ..< count {
            let node = queue.removeFirst()
            for child in node!.children {
                queue.append(child)
            }
        }
    }
    return res
}

// 110. 平衡二叉树
func isBalance(_ root: TreeNode<Int>?) -> Bool {
    return getHeight(root) == -1 ? false : true
}

func getHeight(_ root: TreeNode<Int>?) -> Int {
    guard let root = root else {
        return 0
    }
    let leftHeight = getHeight(root.left)
    if leftHeight == -1 {
        return -1
    }
    let rightHeight = getHeight(root.right)
    if rightHeight == -1 {
        return -1
    }
    if abs(leftHeight - rightHeight) > 1 {
        return -1
    } else {
        return 1 + max(rightHeight, leftHeight)
    }
}

// 257. 二叉树的所有路径
func binaryTreePaths(_ root: TreeNode<Int>?) -> [String] {
    var res = [String]()
    guard let root = root else {
        return res
    }
    var path = [Int]()
    recurisonBinaryTreePath(root, path: &path, res: &res)
    return res
}

private func recurisonBinaryTreePath(_ root: TreeNode<Int>?, path: inout [Int], res: inout [String]) {
    path.append(root!.val)
    if root?.left == nil, root?.right == nil {
        var str = ""
        for i in 0 ..< path.count - 1 {
            str.append("\(path[i])->")
        }
        str.append("\(path.last!)")
        res.append(str)
        return
    }
    if let left = root?.left {
        recurisonBinaryTreePath(left, path: &path, res: &res)
        path.removeLast()
    }
    if let right = root?.right {
        recurisonBinaryTreePath(right, path: &path, res: &res)
        path.removeLast()
    }
}

// 404. 左叶子之和
func sumOfLeftLeaves_recusion(_ root: TreeNode<Int>?) -> Int {
    if root == nil {
        return 0
    }
    let leftValue = sumOfLeftLeaves_recusion(root?.left)  // 左
    let rightValue = sumOfLeftLeaves_recusion(root?.right)  // 右
    var midValue = 0
    if root?.left != nil, root?.left?.left == nil, root?.left?.right == nil {
        midValue = root?.left!.val ?? 0
    }
    let sum = midValue + leftValue + rightValue
    return sum
}

func sumOfLeftLeaves_iteration(_ root: TreeNode<Int>?) -> Int {
    if root == nil {
        return 0
    }
    var stack = [root]
    var sum = 0
    while !stack.isEmpty {
        let lastNode = stack.removeLast()
        if lastNode?.left != nil, lastNode?.left?.left == nil, lastNode?.left?.right == nil {
            sum += lastNode?.left!.val ?? 0
        }
        if let left = lastNode?.left {
            stack.append(left)
        }
        if let right = lastNode?.right {
            stack.append(right)
        }
    }
    return sum
}

// 112. 路径总和
func hasPathSum(_ root: TreeNode<Int>?, _ targetSum: Int) -> Bool {
    if root == nil {
        return false
    }
    return recursionTraversal(root, targetSum - root!.val)
}

private func recursionTraversal(_ root: TreeNode<Int>?, _ count: Int) -> Bool {
    if root?.left == nil, root?.right == nil, count == 0 {
        return true
    }
    if root?.left == nil, root?.right == nil {
        return false
    }
    if let left = root?.left {
        if recursionTraversal(left, count - left.val) {
            return true
        }
    }
    if let right = root?.right {
        if recursionTraversal(right, count - right.val) {
            return true
        }
    }
    return false
}

// 113. 路径总和 II
func hasPathSumII(_ root: TreeNode<Int>?, _ targetSum: Int) -> [[Int]] {
    var res = [[Int]]()
    var path = [Int]()
    if root == nil {
        return res
    }
    path.append(root!.val)
    pathRecurisonTraversal(root, targetSum - root!.val, &res, &path)
    return res
}

private func pathRecurisonTraversal(_ root: TreeNode<Int>?, _ count: Int, _ res: inout [[Int]], _ path: inout [Int]) {
    var count = count
    if root?.left == nil, root?.right == nil, count == 0 {
        res.append(path)
        return
    }
    if root?.left == nil, root?.right == nil {
        return
    }
    if let left = root?.left {
        path.append(left.val)
        count -= left.val
        pathRecurisonTraversal(left, count, &res, &path)
        count += left.val
        path.removeLast()
    }
    if let right = root?.right {
        path.append(right.val)
        count -= right.val
        pathRecurisonTraversal(right, count, &res, &path)
        count += right.val
        path.removeLast()
    }
}

// 106. 从中序与后序遍历序列构造二叉树
func buildTree(_ inorder: [Int], _ postorder: [Int]) -> TreeNode<Int>? {
    buildTreeHelper(inorder: inorder, inorderBegin: 0, inorderEnd: inorder.count, postorder: postorder, postBegin: 0, postEnd: postorder.count)
}

private func buildTreeHelper(inorder: [Int], inorderBegin: Int, inorderEnd: Int, postorder: [Int], postBegin: Int, postEnd: Int) -> TreeNode<Int>? {
    if postEnd - postBegin < 1 {
        return nil
    }
    let value = postorder[postEnd - 1]
    let root: TreeNode<Int>? = TreeNode(value)
    if postEnd - postBegin == 1 {
        return root
    }
    var index = 0
    if let i = inorder.firstIndex(of: value) {
        index = i
    }
    root?.left = buildTreeHelper(inorder: inorder, inorderBegin: inorderBegin, inorderEnd: index, postorder: postorder, postBegin: postBegin, postEnd: postBegin + (index - inorderBegin))
    root?.right = buildTreeHelper(inorder: inorder, inorderBegin: index + 1, inorderEnd: inorderEnd, postorder: postorder, postBegin: postBegin + (index - inorderBegin), postEnd: postEnd - 1)
    return root
}

// 105. 从前序与中序遍历序列构造二叉树
func buildTreeII(_ preorder: [Int], _ inorder: [Int]) -> TreeNode<Int>? {
    return buildTreeHelperII(preorder: preorder, preorderBegin: 0, preorderEnd: preorder.count, inorder: inorder, inBegin: 0, inEnd: inorder.count)
}

private func buildTreeHelperII(preorder: [Int], preorderBegin: Int, preorderEnd: Int, inorder: [Int], inBegin: Int, inEnd: Int) -> TreeNode<Int>? {
    if preorderEnd - preorderBegin < 1 {
        return nil
    }
    let value = preorder[preorderBegin]
    let root: TreeNode<Int>? = TreeNode(value)
    if preorderEnd - preorderBegin == 1 {
        return root
    }
    var index = 0
    if let i = inorder.firstIndex(of: value) {
        index = i
    }
    root?.left = buildTreeHelperII(preorder: preorder, preorderBegin: preorderBegin + 1, preorderEnd: preorderBegin + 1 + (index - inBegin), inorder: inorder, inBegin: inBegin, inEnd: index)
    root?.right = buildTreeHelperII(preorder: preorder, preorderBegin: preorderBegin + 1 + (index - inBegin), preorderEnd: preorderEnd, inorder: inorder, inBegin: index + 1, inEnd: inEnd)
    return root
}

// 654. 最大二叉树
func constructMaximumBinaryTree(_ nums: [Int]) -> TreeNode<Int>? {
    var nums = nums
    return traversal(&nums, 0, nums.count)
}

private func traversal(_ nums: inout [Int], _ left: Int, _ right: Int) -> TreeNode<Int>? {
    if left >= right {
        return nil
    }
    var maxIndex = left
    for i in (left + 1) ..< right {
        if nums[i] > nums[maxIndex] {
            maxIndex = i
        }
    }
    let root: TreeNode<Int>? = TreeNode(nums[maxIndex])
    root?.left = traversal(&nums, left, maxIndex)
    root?.right = traversal(&nums, maxIndex + 1 , right)
    return root
}

// 617. 合并二叉树
func mergeTree(_ root1: TreeNode<Int>?, _ root2: TreeNode<Int>?) -> TreeNode<Int>? {
    if root1 == nil {
        return root2
    }
    if root2 == nil {
        return root1
    }
    let r1 = root1
    let r2 = root2
    r1!.val += r2!.val
    r1?.left = mergeTree(r1?.left, r2?.left)
    r1?.right = mergeTree(r1?.right, r2?.right)
    return r1
}

// 700. 二叉搜索树中的搜索
func searchBST(_ root: TreeNode<Int>?, _ val: Int) -> TreeNode<Int>? {
    if root == nil || root!.val == val {
        return root
    }
    var res: TreeNode<Int>? = TreeNode(0)
    if root!.val > val {
        res = searchBST(root?.left, val)
    }
    if root!.val < val {
        res = searchBST(root?.right, val)
    }
    return res
}

// 98. 验证二叉搜索树
func isValidBTS(_ root: TreeNode<Int>?) -> Bool {
    var res = [Int]()
    isValidBTSTraversal(root, &res)
    for i in 1 ..< res.count {
        if res[i] <= res[i - 1] {
            return false
        }
    }
    return true
}

private func isValidBTSTraversal(_ root: TreeNode<Int>?, _ res: inout [Int]) {
    if root == nil {
        return
    }
    isValidBTSTraversal(root?.left, &res)
    res.append(root!.val)
    isValidBTSTraversal(root?.right, &res)
}

// 236. 二叉树的最近公共祖先
func lowestCommonAncestor(_ root: TreeNode<Int>?, _ p: TreeNode<Int>?, _ q: TreeNode<Int>?) -> TreeNode<Int>? {
    if root == nil || root === p || root === q {
        return root
    }
    let left = lowestCommonAncestor(root?.left, p, q)
    let right = lowestCommonAncestor(root?.right, p, q)
    if left != nil, right != nil {
        return root
    }
    if left == nil, right != nil {
        return right
    }
    if left != nil, right == nil {
        return left
    }
    return nil
}

// 235. 二叉搜索树的最近公共祖先
func lowestCommonAncestorBST(_ root: TreeNode<Int>?, _ p: TreeNode<Int>?, _ q: TreeNode<Int>?) -> TreeNode<Int>? {
    lowestCommonAncestorBST_traversal(root, p, q)
}

private func lowestCommonAncestorBST_traversal(_ root: TreeNode<Int>?, _ p: TreeNode<Int>?, _ q: TreeNode<Int>?) -> TreeNode<Int>? {
    if root == nil {
        return root
    }
    if root!.val > p!.val, root!.val > q!.val {
        let left = lowestCommonAncestorBST_traversal(root?.left, p, q)
        if left != nil {
            return left
        }
    }
    if root!.val < p!.val, root!.val < q!.val {
        let right = lowestCommonAncestorBST_traversal(root?.right, p, q)
        if right != nil {
            return right
        }
    }
    return root
}

// 450. 删除二叉搜索树中的节点
func deleteNode(_ root: TreeNode<Int>?, _ key: Int) -> TreeNode<Int>? {
    guard let root = root else {
        return nil
    }
    if root.val == key {
        if root.left == nil, root.right == nil {
            return nil
        } else if root.left == nil {
            return root.right
        } else if root.right == nil {
            return root.left
        } else {
            var cur = root.right
            while cur?.left != nil {
                cur = cur?.left
            }
            cur?.left = root.left
            return root.right
        }
    }
    if root.val > key {
        root.left = deleteNode(root.left, key)
    } else if root.val < key {
        root.right = deleteNode(root.right, key)
    }
    return root
}

// 108. 将有序数组转换为二叉搜索树

func sortedArrayToBST(_ nums: [Int]) -> TreeNode<Int>? {
    return sortArrayBSTTraversal(nums, 0, nums.count - 1)
}

private func sortArrayBSTTraversal(_ nums: [Int], _ left: Int, _ right: Int) -> TreeNode<Int>? {
    if left > right {
        return nil
    }
    let mid = left + (right - left) >> 1
    let root: TreeNode<Int>? = TreeNode(nums[mid])
    root?.left = sortArrayBSTTraversal(nums, left, mid - 1)
    root?.right = sortArrayBSTTraversal(nums, mid + 1, right)
    return root
}

// 538. 把二叉搜索树转换为累加树
func convertBST(_ root: TreeNode<Int>?) -> TreeNode<Int>? {
    guard let root = root else {
        return root
    }
    var pre = 0
    convertBSTTraversal(root, &pre)
    return root
}

private func convertBSTTraversal(_ root: TreeNode<Int>?, _ pre: inout Int) {
    guard let root = root else {
        return
    }
    convertBSTTraversal(root.right, &pre)
    root.val += pre
    pre = root.val
    convertBSTTraversal(root.left, &pre)
}

// 牛客JZ8 二叉树的下一个结点
public class TreeLinkNode {
    public var val: Int
    public var left: TreeLinkNode?
    public var right: TreeLinkNode?
    public var next: TreeLinkNode?
    public init(_ val: Int=0, _ left: TreeLinkNode?=nil, _ right: TreeLinkNode?=nil, _ next: TreeLinkNode?=nil) {
        self.val = val
        self.left = left
        self.right = right
        self.next = next
    }
}

func getNext(_ pNode: TreeLinkNode?) -> TreeLinkNode? {
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



let array: [Int?] = [2,1,3]
let array2: [Int?] = [4,1,2]
var root: TreeNode<Int>? = buildTreeFromLevelOrderArray(array)
var subtree: TreeNode<Int>? = buildTreeFromLevelOrderArray(array2)

//print(preorderTraversal_recursion(root))
//print(preorderTraversal_iteration(root))

//print(inorderTraversal_recursion(root))
//print(inorderTraversal_iteration(root))
//print(postorderTraversal_recursion(root))
//print(postorderTraversal_iteration(root))
//print(levelOrder(root))
//print(levelOrderBottom(root))
//print(rightSideView(root))
//print(invertTree_recursion(root))
//print(isSymmetric(root))
//print(isSubtree(root, subtree))
//print(isBalance(root))
//print(binaryTreePaths(root))
//print(sumOfLeftLeaves_recusion(root))
//print(sumOfLeftLeaves_iteration(root))
//print(hasPathSum(root, 5))
//print(hasPathSumII(root, 22))
print(isValidBTS(root))
