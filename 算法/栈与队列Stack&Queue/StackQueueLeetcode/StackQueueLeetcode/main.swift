//
//  main.swift
//  StackQueueLeetcode
//
//  Created by 宋开开 on 2023/8/3.
//

import Foundation

class Stack <T> {
    private var elements = [T]()
    func push(_ val: T) {
        elements.append(val)
    }
    func pop() -> T? {
        elements.popLast()
    }
    func top() -> T? {
        elements.last
    }
    var isEmpty: Bool {
        return elements.isEmpty
    }
}

class Queue <T> {
    private var elements = [T]()
    func push(_ val: T) {
        elements.append(val)
    }
    func pop() -> T? {
        if elements.isEmpty {
            return nil
        } else {
            return elements.removeFirst()
        }
    }
    func top() -> T? {
        elements.first
    }
    var isEmpty: Bool {
        return elements.isEmpty
    }
    var count: Int {
        return elements.count
    }
}

// 232. 用栈实现队列
class MyQueue {
    var stackIn: [Int]
    var stackOut: [Int]
    init() {
        stackIn = []
        stackOut = []
    }
    func push(_ x: Int) {
        stackIn.append(x)
    }
    func pop() -> Int {
        if stackOut.isEmpty {
            while !stackIn.isEmpty {
                stackOut.append(stackIn.popLast()!)
            }
        }
        return stackOut.popLast() ?? -1
    }
    func peek() -> Int {
        let top = pop()
        stackOut.append(top)
        return top
    }
    func empty() -> Bool {
        return stackIn.isEmpty && stackOut.isEmpty
    }
}

// 225. 用队列实现栈
class MyStack {
    var queue: Queue<Int>
    init() {
        queue = Queue<Int>()
    }
    func push(_ x: Int) {
        queue.push(x)
    }
    func pop(_ x: Int) -> Int? {
        if queue.isEmpty {
            return -1
        }
        for _ in 1 ..< queue.count {
            queue.push((queue.pop())!)
        }
        return queue.pop()
    }
    func top() -> Int? {
        let ans = queue.pop()!
        queue.push(ans)
        return ans
    }
    func empty() -> Bool {
        return queue.isEmpty
    }
}

// 150. 逆波兰表达式求值
// ["2","1","+","3","*"], [""], [";}"], [/0]
func evalRPN(_ token: [String]) -> Int {
    if token.count == 0 {
        return -1
    }
    var stack = [Int]()
    for c in token {
        if c == "" {
            return -1
        }
        let n = Int(c)
        if let num = n {
            stack.append(num)
        } else {
            var res = 0
            let numBack = stack.popLast()!
            let numFront = stack.popLast()!
            switch c {
            case "+":
                res = numFront + numBack
            case "-":
                res = numFront - numBack
            case "*":
                res = numFront * numBack
            case "/":
                if numBack == 0 {
                    return -1
                }
                res = numFront / numBack
            default:
                print("invalid input")
                return -1
            }
            stack.append(res)
        }
    }
    return stack.last!
}

// 239. 滑动窗口最大值
// [1,3,-1,-3,5,3,6,7] 3, [] 0, [1] 3
func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
    if nums.count == 0 || k == 0 {
        return [-1]
    }
    var res = [Int]()
    var window = [Int](repeating: 0, count:nums.count)
    var start = 0
    var end = 0
    // 前k 个
    for i in 0 ..< k {
        if i >= nums.count {
            res.append(nums[window[start]])
            return res
        }
        while start < end, nums[i] > nums[window[end - 1]] {
            end -= 1
            if end < 0 {
                end = window.count - 1
            }
        }
        window[end] = i
        end += 1
    }
    res.append(nums[window[start]])
    for i in k ..< nums.count {
        while start < end, nums[i] > nums[window[end - 1]] {
            end -= 1
            if end < 0 {
                end = window.count - 1
            }
        }
        window[end] = i
        end += 1
        while window[start] <= i - k {
            start += 1
            if start >= window.count {
                start = 0
            }
        }
        res.append(nums[window[start]])
    }
    return res
}

class MyStack2 {
    var stack: [Int]
    var miniStack: [Int]
    init() {
        stack = []
        miniStack = []
    }
    func push(_ val: Int) {
        stack.append(val)
        if miniStack.isEmpty || miniStack.last! >= val {
            miniStack.append(val)
        }
    }
    func pop() {
        if !miniStack.isEmpty, miniStack.last! == stack.last! {
            miniStack.removeLast()
        }
        stack.removeLast()
    }
    func top() -> Int {
        return stack.last!
    }
    func getMin() -> Int {
        return miniStack.last!
    }
}

// 739. 每日温度
// [73,74,75,71,69,72,76,73], [], [1]
func dailyTemperatures(_ nums: [Int]) -> [Int] {
    var indexStack = [Int]()
    var ans = [Int](repeating: 0, count: nums.count)
    for i in 0 ..< nums.count {
        while !indexStack.isEmpty {
            let preIndex = indexStack.last!
            if nums[preIndex] >= nums[i] {
                break
            }
            indexStack.removeLast()
            ans[preIndex] = i - preIndex
        }
        indexStack.append(i)
    }
    return ans
}



//var stack = Stack<Int>()
//print(stack.pop() ?? "nnil")
//
//var queue = Queue<Int>()
//print(queue.pop() ?? "nnil")

//print(evalRPN(["2","1","+","3","*"]))
//print(maxSlidingWindow([1,3,-1,-3,5,3,6,7], 3))
print(dailyTemperatures([73,74,75,71,69,72,76,73]))
