//
//  BinarySearch704.swift
//  ArrayLeetcode
//
//  Created by 宋开开 on 2023/7/31.
//

import Foundation

// 704 二分查找
// 用例：[],[1,2,3,4,5] 4
class BinarySearch704 {
    func search(_ nums: [Int], _ target: Int) -> Int {
        if nums.count == 0 {
            return -1
        }
        var left = 0
        var right = nums.count - 1
        while left <= right {
            let mid = left + (right - left) >> 1
            if nums[mid] < target {
                left = mid + 1
            } else if nums[mid] > target {
                right = mid - 1
            } else {
                return mid
            }
        }
        return -1
    }
}
