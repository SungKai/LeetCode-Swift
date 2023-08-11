//
//  RemoveElement27.swift
//  ArrayLeetcode
//
//  Created by 宋开开 on 2023/7/31.
//

import Foundation

// 27. 移除元素
// 用例：[3,2,2,3] 3/7, []
class RemoveElement27 {
    func removeElement(_ nums: [Int], _ val: Int) -> Int {
        var nums = nums
        if nums.count == 0 {
            return -1
        }
        var slow = 0
        for fast in 0 ..< nums.count {
            if nums[fast] != val {
                nums[slow] = nums[fast]
                slow += 1
            }
        }
        return slow
    }
}
