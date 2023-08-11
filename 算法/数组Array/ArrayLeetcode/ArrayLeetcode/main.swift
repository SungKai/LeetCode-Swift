//
//  main.swift
//  ArrayLeetcode
//
//  Created by 宋开开 on 2023/7/31.
//

import Foundation

class Solution {
    // 704 二分查找
    func binarySearch(_ nums: [Int], _ k: Int) {
        print(BinarySearch704().search(nums, k))
    }
    // 35. 搜索插入位置
    func searchInsertPosition(_ nums: [Int], _ k: Int) {
        print(SearchInsertPosition35().searchInsert(nums, k))
    }
    func sqrtx(_ x: Int) {
        print(Sqrtx69().mySqrtx69(x))
    }
    func isPerfectSquare(_ num: Int) {
        print(ValidPerfectSquare367().isPerfectSquare(num))
    }
    func searchRange(_ nums: [Int], _ target: Int) {
        print(FindFirstAndLastPositionOfElementInSortedArray34().searchRange(nums, target))
    }
    func removeElement(_ nums: [Int], _ val: Int) {
        print(RemoveElement27().removeElement(nums, val))
    }
    func backspaceCompare(_ s: String, _ t: String) {
        print(BackspaceStringCompare844().backspaceCompare(s, t))
    }
    func minSubArray(_ target: Int, _ nums: [Int]) {
        print(MinimumSizeSubarraySum209().minSubArrayLen(target, nums))
    }
    func totalFruit(_ fruit: [Int]) {
        print(FruitIntoBaskets904().totalFruit(fruit))
    }
    func minWindow(_ s: String, _ t: String) {
        print(MinimumWindowSubstring76().minWindow(s, t))
    }
    func spiralOrder(_ matrix: [[Int]]) {
        print(SpiralMatrix54().spiralOrder(matrix))
    }
}

//Solution().binarySearch([-1,0,3,5,9,12], 111)
//Solution().searchInsertPosition([1,3,5,6], 9)
//Solution().sqrtx(19)
//Solution().isPerfectSquare(16)
//Solution().searchRange([5,7,7,8,8,10], 8)
//Solution().removeElement([3,2,2,3], 3)
//Solution().backspaceCompare("y#fo##f", "y#f#o##f")
//Solution().minSubArray(-1, [2,3,1,2,4,3])
//Solution().totalFruit([1,2,3,2,2])
//Solution().minWindow("ADOBECODEBANC", "ABC")
Solution().spiralOrder([[7],[9],[6]])
