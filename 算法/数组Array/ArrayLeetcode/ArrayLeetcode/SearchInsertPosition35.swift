//
//  SearchInsertPosition35.swift
//  ArrayLeetcode
//
//  Created by 宋开开 on 2023/7/31.
//

import Foundation

// 35. 搜索插入位置
// 用例：[1,3,5,6] 5, [1,3,5,6] 2, [],
class SearchInsertPosition35 {
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        for i in 0 ..< nums.count {
            if target <= nums[i] {
                return i
            }
        }
        return nums.count
    }
    // 二分法
//    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
//        if nums.count == 0 {
//            return nums.count
//        }
//        var left = 0
//        var right = nums.count - 1
//        while left <= right {
//            let mid = left + (right - left) >> 1
//            if nums[mid] < target {
//                left = mid + 1
//            } else if nums[mid] > target {
//                right = mid - 1
//            } else {
//                return mid
//            }
//        }
//        return left
//    }
}
