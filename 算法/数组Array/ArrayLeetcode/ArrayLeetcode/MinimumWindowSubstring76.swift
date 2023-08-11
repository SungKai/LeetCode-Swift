//
//  MinimumWindowSubstring76.swift
//  ArrayLeetcode
//
//  Created by 宋开开 on 2023/8/1.
//

import Foundation

// 76. 最小覆盖子串
// 用例: "ADOBECODEBANC" "ABC", "","a" "asd"

class MinimumWindowSubstring76 {
    func minWindow(_ s: String, _ t: String) -> String {
        
        let sArray = [Character](s)
        var matchDic = [Character: Int]()
        var winDic = [Character: Int]()
        var matchNum = 0
        var minLen = Int.max
        var left = 0
        var right = 0
        var start = 0
        var end = sArray.count - 1
        if (s.count != 0 || t.count != 0) && s.count >= t.count {
            t.forEach { s in
                matchDic[s, default: 0] += 1
            }
            while right < sArray.count {
                let rChar = sArray[right]
                right += 1
                if matchDic[rChar] == nil {
                    continue
                }
                winDic[rChar, default: 0] += 1
                if matchDic[rChar] == winDic[rChar] {
                    matchNum += 1
                }
                while matchNum == matchDic.count {
                    if right - left < minLen {
                        start = left
                        end = right
                        minLen = right - left
                    }
                    let lChar = sArray[left]
                    left += 1
                    if matchDic[lChar] == nil {
                        continue
                    }
                    if winDic[lChar] == matchDic[lChar] {
                        matchNum -= 1
                    }
                    winDic[lChar, default: 0] -= 1
                }
            }
        }
        return minLen == Int.max ? "" : String(sArray[start ..< end])
    }
}
