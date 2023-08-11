//
//  main.swift
//  ListNodeLeecode
//
//  Created by 宋开开 on 2023/8/3.
//

import Foundation

class ListNode<E> {
    var val: E
    var next: ListNode?
//    init() {
//        self.val = 0
//        self.next = nil
//    }
    init(_ val: E) {
        self.val = val
        self.next = nil
    }
}

/// 根据数组创建链表
func creatListNode(_ nums: [Int]) -> ListNode<Int>? {
    let head: ListNode? = ListNode<Int>(-1)
    var currentNode = head
    for i in 0 ..< nums.count {
        let newNode = ListNode(nums[i])
        currentNode?.next = newNode
        currentNode = currentNode?.next
    }
    return head?.next
}

/// 打印链表
func showListNode(_ head: ListNode<Int>?) {
    var currentNode = head
    while currentNode != nil {
        print(currentNode!.val)
        currentNode = currentNode?.next
    }
}

// 203. 移除链表元素
// [1,2,6,3,4,5,6] 6, [] 1
func removeElements(_ head: ListNode<Int>?, _ val: Int) -> ListNode<Int>? {
    let dummyHead: ListNode? = ListNode<Int>(-1)
    dummyHead?.next = head
    var currentNode = dummyHead
    while currentNode?.next != nil {
        if currentNode?.next!.val == val {
            currentNode?.next = currentNode?.next?.next
        }
        currentNode = currentNode?.next
    }
    return dummyHead?.next
}

// 707. 设计链表
class MyLinkedList {
    class ListNode<E> {
        var val: E
        var next: ListNode?
        init(_ val: E) {
            self.val = val
            self.next = nil
        }
    }
    var dummyHead: ListNode<Int>?
    var size: Int
    
    init() {
        dummyHead = ListNode(0)
        size = 0
    }
    
    func getVal(_ index: Int) -> Int {
        if index >= size || index < 0 {
            return -1
        }
        var currentNode = dummyHead?.next
        for _ in 0 ..< index {
            currentNode = currentNode?.next
        }
        return currentNode!.val
//        return currentNode?.val ?? -1
    }
    
    func addAtHead(_ val: Int) {
        let newNode: ListNode? = ListNode(val)
        newNode?.next = dummyHead?.next
        dummyHead?.next = newNode
        size += 1
    }
    
    func addAtTail(_ val: Int) {
        let newNode: ListNode? = ListNode(val)
        var currentNode = dummyHead
        for _ in 0 ..< size {
            currentNode = currentNode?.next
        }
        currentNode?.next = newNode
        size += 1
    }
    
    func addAtIndex(_ index: Int, _ val: Int) {
        if index < 0 {
            addAtHead(val)
        }
        if index > size {
            addAtTail(val)
        }
        let newNode: ListNode? = ListNode(val)
        var currentNode = dummyHead
        for _ in 0 ..< index {
            currentNode = currentNode?.next
        }
        newNode?.next = currentNode?.next
        currentNode?.next = newNode
        size += 1
    }
    
    func deleteAtIndex(_ index: Int) {
        if index < 0 || index >= size {
            return
        }
        var currentNode = dummyHead
        for _ in 0 ..< index {
            currentNode = currentNode?.next
        }
        currentNode?.next = currentNode?.next?.next
        size -= 1
    }
}

// 24. 两两交换链表中的节点
// [1,2,3,4], [1,2,3], [], [1]
func swapPairs(_ head: ListNode<Int>?) -> ListNode<Int>? {
    if head == nil || head?.next == nil {
        return head
    }
    let dummyHead: ListNode? = ListNode(0)
    dummyHead?.next = head
    var currentNode = dummyHead
    while currentNode?.next != nil, currentNode?.next?.next != nil {
        let tempNodeFront = currentNode?.next
        let tempNodeNext = currentNode?.next?.next?.next
        
        currentNode?.next = currentNode?.next?.next
        currentNode?.next?.next = tempNodeFront
        currentNode?.next?.next?.next = tempNodeNext
        currentNode = currentNode?.next?.next
    }
    return dummyHead?.next
}

// 206. 反转链表
// [1,2,3,4], [1,2,3], [], [1]
func reverseList(_ head: ListNode<Int>?) -> ListNode<Int>? {
    if head == nil || head?.next == nil {
        return head
    }
    var curNode: ListNode<Int>? = head
    var preNode: ListNode<Int>? = nil
    while curNode != nil {
        let tempNode = curNode?.next
        curNode?.next = preNode
        preNode = curNode
        curNode = tempNode
    }
    return preNode
}

// 19. 删除链表的倒数第 N 个结点
// [1,2,3,4,5] 2, [1] 2, [], 1
func removeNthFromEnd(_ head: ListNode<Int>?, _ n: Int) -> ListNode<Int>? {
    let dummyHead: ListNode? = ListNode(0)
    dummyHead?.next = head
    var slow: ListNode? = dummyHead
    var fast: ListNode? = dummyHead
    for _ in 0 ..< n {
        if fast == nil {
            return nil
        }
        fast = fast?.next
    }
    while fast?.next != nil {
        fast = fast?.next
        slow = slow?.next
    }
    slow?.next = slow?.next?.next
    return dummyHead?.next
}

// 160. 相交链表
// [4,1,8,4,5] [5,6,1,8,4,5], [1] [1], []
func getIntersectionNode(_ headA: ListNode<Int>?, _ headB: ListNode<Int>?) -> ListNode<Int>? {
    if headA == nil || headB == nil {
        return nil
    }
    var listA: ListNode<Int>? = headA
    var listB: ListNode<Int>? = headB
    var lenA = 0
    var lenB = 0
    // 分别遍历求长度
    while listA != nil {
        listA = listA?.next
        lenA += 1
    }
    while listB != nil {
        listB = listB?.next
        lenB += 1
    }
    // 恢复
    listA = headA
    listB = headB
    // 让A 称为长链表
    if lenB > lenA {
        swap(&lenA, &lenB)
        swap(&listA, &listB)
    }
    // 求长度差
    var gap = lenA - lenB
    // A 先走
    while gap != 0 {
        listA = listA?.next
        gap -= 1
    }
    // 同时遍历A，B
    while listA != nil {
        if listA === listB {
            return listA
        }
        listA = listA?.next
        listB = listB?.next
    }
    return nil
}

// 142. 环形链表 II
// [3,2,0,-4] 1, [], [1] 0/-1
func detectCycle(_ head: ListNode<Int>?) -> ListNode<Int>? {
    if head == nil {
        return head
    }
    var fast: ListNode<Int>? = head
    var slow: ListNode<Int>? = head
    while fast != nil, slow != nil {
        fast = fast?.next?.next
        slow = slow?.next
        if slow === fast {
            var start: ListNode<Int>? = head
            while start !== slow {
                start = start?.next
                slow = slow?.next
            }
            return start
        }
    }
    return nil
}

// 234. 回文链表
// [1,2,2,1], [1,2,1], [], [1]
func isPalindrome(_ head: ListNode<Int>?) -> Bool {
    if head == nil {
        return false
    }
    // 找到中点
    var headNode: ListNode? = head
    var fastNode: ListNode? = headNode
    var slowNode: ListNode? = headNode
    while fastNode?.next != nil, fastNode?.next?.next != nil {
        slowNode = slowNode?.next
        fastNode = fastNode?.next?.next
    }
    // 反转
    slowNode?.next = reverseList(slowNode?.next)
    slowNode = slowNode?.next
    // 验证
    while slowNode != nil {
        if headNode!.val != slowNode!.val {
            return false
        }
        slowNode = slowNode?.next
        headNode = headNode?.next
    }
    return true
}

// 328. 奇偶链表
// [1,2,3,4,5], [], [1]
func oddEvenList(_ head: ListNode<Int>?) -> ListNode<Int>? {
    let dummyHead: ListNode? = ListNode(0)
    var currentNode = head
    dummyHead?.next = currentNode
    var oddEnd = head
    var nextNode = head?.next
    let evenHead = head?.next
    var isOdd = true
    while currentNode != nil {
        currentNode?.next = currentNode?.next?.next
        if isOdd {
            oddEnd = currentNode
        }
        currentNode = nextNode
        nextNode = nextNode?.next
        isOdd = !isOdd
    }
    oddEnd?.next = evenHead
    return dummyHead?.next
}

// 83. 删除排序链表中的重复元素
// [1,1,2] [], [1]
func deleteDuplicates(_ head: ListNode<Int>?) -> ListNode<Int>? {
    if head == nil {
        return head
    }
    let dummyHead: ListNode? = ListNode(0)
    var slowNode: ListNode? = head
    var fastNode: ListNode? = head
    dummyHead?.next = slowNode
    var preVal = head!.val
    while fastNode != nil {
        if fastNode!.val != preVal {
            slowNode?.next = fastNode
            slowNode = slowNode?.next
            preVal = fastNode!.val
        }
        fastNode = fastNode?.next
    }
    slowNode?.next = nil
    return dummyHead?.next
}

// 148. 排序链表
// [1,3,2,4,5], [], [1]
func sortList(_ head: ListNode<Int>?) -> ListNode<Int>? {
    if head == nil || head?.next == nil {
        return head
    }
    // 找中点
    var slowNode: ListNode? = head
    var fastNode: ListNode? = head
    while fastNode?.next != nil, fastNode?.next?.next != nil {
        slowNode = slowNode?.next
        fastNode = fastNode?.next?.next
    }
    // 分割链表
    let mid = slowNode?.next
    slowNode?.next = nil
    // 递归排序左右链表
    let leftNode = sortList(head)
    let rightNode = sortList(mid)
    // 合并
    return mergeList(leftNode, rightNode)
}

// 合并排序两个链表
func mergeList(_ left: ListNode<Int>?, _ right: ListNode<Int>?) -> ListNode<Int>? {
    let dummyHead: ListNode? = ListNode(0)
    var currentNode: ListNode? = dummyHead
    var leftNode: ListNode? = left
    var rightNode: ListNode? = right
    while leftNode != nil, rightNode != nil {
        if leftNode!.val < rightNode!.val {
            currentNode?.next = leftNode
            leftNode = leftNode?.next
        } else {
            currentNode?.next = rightNode
            rightNode = rightNode?.next
        }
        currentNode = currentNode?.next
    }
    if leftNode != nil {
        currentNode?.next = leftNode
    } else if rightNode != nil {
        currentNode?.next = rightNode
    }
    return dummyHead?.next
}

// 剑指 Offer 62. 圆圈中最后剩下的数字
// 5 3, 0, 70866 116922(太慢了 超出时间限制）

func lastRemaining_LinkedList(_ n: Int, _ m: Int) -> Int {
    // 创建链表
    let dummyHead: ListNode? = ListNode<Int>(-1)
    var currentNode = dummyHead
    for i in 0 ..< n {
        let newNode = ListNode(i)
        currentNode?.next = newNode
        currentNode = currentNode?.next
        if i == n - 1 {
            currentNode?.next = dummyHead?.next
            // 特殊情况处理：当m = 1时,直接返回最后一个：
            if m == 1 {
                return currentNode!.val
            }
        }
    }
    var num = 0
    var nowNode = dummyHead
    while nowNode?.next !== nowNode {
        if num == m - 1 {
            nowNode?.next = nowNode?.next?.next
            num = 0
        }
        nowNode = nowNode?.next
        num += 1
    }
    return nowNode!.val
}

var head: ListNode<Int>? = creatListNode([4,2,1,3])
var head2: ListNode<Int>? = creatListNode([5,6,1,8,4,5])
//showListNode(removeElements(head, 6))
//showListNode(swapPairs(head))
//showListNode(reverseList(head))
//showListNode(removeNthFromEnd(head, 2))
//showListNode(getIntersectionNode(head, head2))
//print(isPalindrome(head))
//showListNode(oddEvenList(head))
//showListNode(deleteDuplicates(head))
//showListNode(sortList(head))
print(lastRemaining_LinkedList(70866, 116922))
