//
//  SpiralMatrix54.swift
//  ArrayLeetcode
//
//  Created by 宋开开 on 2023/8/1.
//

import Foundation

// 54. 螺旋矩阵
/*
    1 2 3
    4 5 6
    7 8 9
    [[]]
 */
class SpiralMatrix54 {
    func spiralOrder(_ matrix: [[Int]]) -> [Int] {
        var res = [Int]()
        var startRow = 0
        var endRow = matrix.count - 1
        var startColumn = 0
        var endColumn = matrix[0].count - 1
        if matrix.count == 0 {
            return res
        }
        while startRow <= endRow, startColumn <= endColumn {
            // 上行，从左到右
            for i in startColumn ... endColumn {
                res.append(matrix[startRow][i])
            }
            startRow += 1
            if startRow > endRow {
                break
            }
            // 右列，从上到下
            for i in startRow ... endRow {
                res.append(matrix[i][endColumn])
            }
            endColumn -= 1
            if endColumn < startColumn {
                break
            }
            // 下行，从右到左
            for i in stride(from: endColumn, through: startColumn, by: -1) {
                res.append(matrix[endRow][i])
            }
            endRow -= 1
            if endRow < startRow {
                break
            }
            // 左列，从下到上
            for i in stride(from: endRow, through: startRow, by: -1) {
                res.append(matrix[i][startColumn])
            }
            startColumn += 1
            if startColumn > endColumn {
                break
            }
        }
        return res
    }
}
