//
//  ReverseStringII541.swift
//  StringLeetcode
//
//  Created by 宋开开 on 2023/8/1.
//

import Foundation

// 541. 反转字符串 II
// "abcdefg" 2, "", "a" 2
class ReverseStringII541 {
    func reverseStr(_ s: String, _ k: Int) -> String {
        var sArray = Array(s)
        for i in stride(from: 0, to: sArray.count, by: k * 2) {
            var left = i
            var right = min(sArray.count - 1, left + k - 1)
            while left <= right {
                (sArray[left], sArray[right]) = (sArray[right], sArray[left])
                left += 1
                right -= 1
            }
        }
        return String(sArray)
    }
}
