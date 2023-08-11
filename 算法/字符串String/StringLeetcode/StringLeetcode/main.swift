//
//  main.swift
//  StringLeetcode
//
//  Created by 宋开开 on 2023/8/1.
//

import Foundation

class Solution {
    func reverseString(_ s: inout [Character]) {
        ReverseString344().reverseString(&s)
        print(s)
    }
    func reverseStringII(_ s: String, _ k: Int) {
        print(ReverseStringII541().reverseStr(s, k))
    }
    func strStr(_ hayStack: String, _ needle: String) {
        print(FindTheIndexOfTheFirstOccurrenceInAString28().strStr(hayStack, needle))
    }
    func repeatedSubstringPattern(_ s: String) {
        print(RepeatedSubstringPattern459().repeatedSubstringPattern(s))
    }
}

// 647. 回文子串
// "abc", ""
func countSubstrings(_ s: String) -> Int {
    let sArray = Array(s)
    var count = 0
    for i in 0 ..< s.count {
        if i + 1 < s.count, sArray[i] == sArray[i + 1] {
            count += extendSubstring(sArray, i, i + 1)
        }
        count += extendSubstring(sArray, i, i)
    }
    return count
}

private func extendSubstring(_ s: [Character], _ leftIndex: Int, _ rightIndex: Int) -> Int{
    var left = leftIndex
    var right = rightIndex
    var count = 0
    while left >= 0, right < s.count, s[left] == s[right] {
        left -= 1
        right += 1
        count += 1
    }
    return count
}

// 696. 计数二进制子串
// 用例: "00110011", "", "1"
func countBinarySubstring(_ s: String) -> Int {
    if s.count <= 1 {
        return 0
    }
    let sArray = Array(s)
    var last = 0
    var ans = 0
    var i = 0
    while i < sArray.count {
        var temp = 0
        let c = sArray[i]
        while i < sArray.count, c == sArray[i] {
            i += 1
            temp += 1
        }
        ans += min(temp, last)
        last = temp
    }
    return ans
}

// 227. 基本计算器 II
// "3+2*2", " sad ", "3 + -2", ""

func calculate(_ s: String) -> Int {
    if s.count == 0 {
        return 0
    }
    var stack = [Int]()
    var num = 0
    var ans = 0
    var operation = "+"
    for char in s + "+" {
        if char != " " {
            if char.isNumber {
                num = num * 10 + Int(String(char))!
                
            } else {
                switch operation {
                case "+":
                    stack.append(num)
                case "-":
                    stack.append(-num)
                case "*":
                    stack.append(stack.popLast()! * num)
                case "/":
                    stack.append(stack.popLast()! / num)
                default:
                    break
                }
                num = 0
                operation = String(char)
            }
        }
    }
    for i in stack {
        ans += i
    }
    return ans
}

// 3. 无重复字符的最长子串
// "abcabcbb", "", "aa bb"
func lengthOfLongestSubstring(_ s: String) -> Int {
    if s.count == 0 {
        return 0
    }
    let sArray = Array(s)
    var ans = 0
    var bucket = [Character: Int]()
    var leftIndex = 0
    var rightIndex = 0
    for i in 0 ..< sArray.count {
        if let count = bucket[sArray[i]], count > 0 {
            for j in leftIndex ..< i {
                bucket[sArray[j]] = nil
                if sArray[j] == sArray[i] {
                    leftIndex = j + 1
                    break
                }
            }
            bucket[sArray[i], default: 0] += 1
        } else {
            bucket[sArray[i], default: 0] += 1
            rightIndex = i
        }
        ans = max(ans, rightIndex - leftIndex + 1)
    }
    return ans
}

//var char: [Character] = ["h","e","l","l","o"]
//Solution().reverseString(&char)
//Solution().reverseStringII("abcdefg", 2)
//Solution().strStr("sadbutsad", "sad")
//Solution().repeatedSubstringPattern("abab")
//repeatedSubstringPattern("abab")
//print(countSubstrings(""))
//print(countBinarySubstring("00110011"))
//print(calculate("3+2*-2"))
print(lengthOfLongestSubstring("abcabcbb"))
