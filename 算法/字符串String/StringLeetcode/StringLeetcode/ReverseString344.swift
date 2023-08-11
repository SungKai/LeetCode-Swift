//
//  ReverseString344.swift
//  StringLeetcode
//
//  Created by 宋开开 on 2023/8/1.
//

import Foundation

// 344. 反转字符串
// 用例: ["h","e","l","l","o"], [],
class ReverseString344 {
    func reverseString(_ s: inout [Character]) {
        var left = 0
        var right = s.count - 1
        while left <= right {
            (s[left], s[right]) = (s[right], s[left])
            left += 1
            right -= 1
        }
    }
}

