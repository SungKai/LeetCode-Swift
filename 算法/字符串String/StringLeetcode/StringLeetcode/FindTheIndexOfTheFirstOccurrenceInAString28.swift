//
//  FindTheIndexOfTheFirstOccurrenceInAString28.swift
//  StringLeetcode
//
//  Created by 宋开开 on 2023/8/2.
//

import Foundation

// 28. 找出字符串中第一个匹配项的下标
// "sadbutsad" "sad"/"sat", "",
class FindTheIndexOfTheFirstOccurrenceInAString28 {
    func strStr(_ haystack: String, _ needle: String) -> Int {
        let s = Array(haystack)
        let p = Array(needle)
        var j = 0
        var next = [Int](repeating: 0, count: p.count)
        if haystack.count > 0, needle.count > 0 {
            getNext(&next, p)
            for i in 0 ..< s.count {
                // 回退
                while j > 0, s[i] != p[j] {
                    j = next[j - 1]
                }
                // 匹配
                if s[i] == p[j] {
                    j += 1
                }
                // 全匹配
                if j == p.count {
                    return i - p.count + 1
                }
            }
        }
        return -1
    }
    // KMP
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
