//
//  FindFirstAndLastPositionOfElementInSortedArray34.swift
//  ArrayLeetcode
//
//  Created by 宋开开 on 2023/7/31.
//

import Foundation

// 34. 在排序数组中查找元素的第一个和最后一个位置
// 用例:  [5,7,7,8,8,10] 8/6, []
class FindFirstAndLastPositionOfElementInSortedArray34 {
    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        var left = 0
        var right = nums.count - 1
        var first = -1
        var last = -1
        if nums.count == 0 {
            return [first, last]
        }
        // 左边界
        while left <= right {
            let mid = left + (right - left) >> 1
            if nums[mid] >= target {
                right = mid - 1
            } else if nums[mid] < target {
                left = mid + 1
            }
            if nums[mid] == target {
                first = mid
            }
        }
        if first == -1 {
            return [first, first]
        }
        // 右边界
        left = first
        right = nums.count - 1
        while left <= right {
            let mid = left + (right - left) >> 1
            if nums[mid] > target {
                right = mid - 1
            } else if nums[mid] <= target {
                left = mid + 1
            }
            if nums[mid] == target {
                last = mid
            }
        }
        return [first, last]
    }
}
