//
//  FruitIntoBaskets904.swift
//  ArrayLeetcode
//
//  Created by 宋开开 on 2023/8/1.
//

import Foundation

// 904. 水果成篮
// [1,2,3,2,2], [], [1]
class FruitIntoBaskets904 {
    func totalFruit(_ fruits: [Int]) -> Int {
        var ans = 0
        var headIndex = 0
        var bucket = [Int: Int]()
        if fruits.count > 0 {
            for tailIndex in 0 ..< fruits.count {
                // 遇见新水果
                if bucket.count == 2, bucket[fruits[tailIndex]] == nil {
                    // 清除旧水果
                    while headIndex < tailIndex, bucket.count == 2 {
                        bucket[fruits[headIndex], default: 0] -= 1
                        if bucket[fruits[headIndex]]! <= 0 {
                            bucket.removeValue(forKey: fruits[headIndex])
                        }
                        headIndex += 1
                    }
                }
                // 加入新水果
                bucket[fruits[tailIndex], default: 0] += 1
                ans = max(ans, tailIndex - headIndex + 1)
            }
        }
        return ans
    }
}
