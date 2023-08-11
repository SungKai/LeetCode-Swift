//
//  ValidPerfectSquare367.swift
//  ArrayLeetcode
//
//  Created by 宋开开 on 2023/7/31.
//

import Foundation

// 367. 有效的完全平方数
// 用例: 16, 0, -1
class ValidPerfectSquare367 {
    func isPerfectSquare(_ num: Int) -> Bool {
        if num > 0 {
            var left = 1
            var right = num
            while left <= right {
                let mid = left + (right - left) >> 1
                if mid * mid < num {
                    left = mid + 1
                } else if mid * mid > num {
                    right = mid - 1
                } else {
                    return true
                }
            }
        }
        return false
    }
}
