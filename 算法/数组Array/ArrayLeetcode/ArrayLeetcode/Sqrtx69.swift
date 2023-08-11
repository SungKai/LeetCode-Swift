//
//  Sqrtx69.swift
//  ArrayLeetcode
//
//  Created by 宋开开 on 2023/7/31.
//

import Foundation

// 69. x 的平方根
// 用例:8, -1, 0
// 1 2 3
class Sqrtx69 {
    func mySqrtx69(_ x: Int) -> Int {
        if x < 0 {
            return -1
        }
        var left = 1
        var right = x
        while left <= right {
            let mid = left + (right - left) >> 1
            if mid < x / mid {
                left = mid + 1
            } else if mid > x / mid {
                right = mid - 1
            } else {
                return mid
            }
        }
        return right
    }
}
