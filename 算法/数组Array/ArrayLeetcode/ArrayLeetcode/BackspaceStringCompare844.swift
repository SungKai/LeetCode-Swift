//
//  BackspaceStringCompare844.swift
//  ArrayLeetcode
//
//  Created by 宋开开 on 2023/8/1.
//

import Foundation

// 844. 比较含退格的字符串
// 用例:"ab#c" "ad#c", "", "a##c" "#a#c"
class BackspaceStringCompare844 {
    func backspaceCompare(_ s: String, _ t: String) -> Bool {
        backSpace(s) == backSpace(t)
    }
    func backSpace(_ s: String) -> String {
        var stack = [Character]()
        s.forEach { string in
            if string == "#" {
                if !stack.isEmpty {
                    stack.removeLast()
                }
            } else {
                stack.append(string)
            }
        }
        return String(stack)
    }
}
