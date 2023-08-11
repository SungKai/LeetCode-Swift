//
//  RepeatedSubstringPattern459.swift
//  StringLeetcode
//
//  Created by 宋开开 on 2023/8/2.
//

import Foundation

// 459. 重复的子字符串
// "abab", "",
class RepeatedSubstringPattern459 {
    func repeatedSubstringPattern(_ s: String) -> Bool {
        let sArray = Array(s)
        let len = s.count
        var next = [Int](repeating: 0, count: s.count)
        if s.count > 0 {
            getNext(&next, sArray)
            if len % (len - next[len - 1]) == 0, next[len - 1] != 0 {
                return true
            }
        }
        return false
    }
    private func getNext(_ next: inout [Int], _ needle: [Character]) {
        var j = 0
        next[0] = j
        for i in 1 ..< needle.count {
            while j > 0, needle[i] != needle[j] {
                j = next[j - 1]
            }
            if needle[i] == needle[j] {
                j += 1
            }
            next[i] = j
        }
    }
}
