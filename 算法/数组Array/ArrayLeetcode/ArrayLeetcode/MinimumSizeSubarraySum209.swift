//
//  MinimumSizeSubarraySum209.swift
//  ArrayLeetcode
//
//  Created by 宋开开 on 2023/8/1.
//

import Foundation

// 209. 长度最小的子数组
// 用例: [2,3,1,2,4,3] 7 / -1, [] 8
class MinimumSizeSubarraySum209 {
    func minSubArrayLen(_ target: Int, _ nums: [Int]) -> Int {
        if nums.count == 0 || target <= 0 {
            return -1
        }
        var sum = 0
        var ans = Int.max
        var headIndex = 0
        for tailIndex in 0 ..< nums.count {
            sum += nums[tailIndex]
            while sum >= target {
                ans = min(ans, tailIndex - headIndex + 1)
                sum -= nums[headIndex]
                headIndex += 1
            }
        }
        return ans == Int.max ? 0 : ans
    }
}

