//
//  n하0-2.swift
//  
//  Created by gunhyeong on 2020/12/04.
//

import Foundation

func solution(_ blocks: [[Int]]) -> [Int] {
    let size = blocks.count
    var board = [[Int]](repeating: [Int](repeating: 0, count: size), count: size)
    var answer = [Int]()
    
    
    // init
    for (i, row) in blocks.enumerated() {
        board[i][row.first!] = row.last!
    }
    
    for i in 0..<size - 1 {
        // 왼쪽 -> 오른쪽
        for j in 0...i {
            if board[i+1][j] == 0 { continue }
            board[i+1][j+1] = board[i][j] - board[i+1][j]
        }
        
        // 오른쪽 -> 왼쪽
        for j in (0...i).reversed() {
            if board[i+1][j+1] == 0 { continue }
            board[i+1][j] = board[i][j] - board[i+1][j+1]
        }
    }
    
    for i in 0..<size {
        for j in 0..<i+1 {
            answer.append(board[i][j])
        }
    }
    
    return answer
}


print(solution([[0, 50], [0, 22], [2, 10], [1, 4], [4, -13]]) == [50, 22, 28, 4, 18, 10, 0, 4, 14, -4, 1, -1, 5, 9, -13] ? "맞음" : "틀림")
print(solution([[0, 92], [1, 20], [2, 11], [1, -81], [3, 98]]) == [92, 72, 20, 63, 9, 11, 144, -81, 90, -79, 217, -73, -8, 98, -177] ? "맞음" : "틀림")
