//
//  p-dev.swift
//  
//
//  Created by gunhyeong on 2020/06/06.
//

import Foundation

func solution(_ board:[[Int]]) -> Int
{
    let dirs: [[Int]] = [[-1,0], [-1,1], [0,1], [1,1], [1,0]] // 좌, 좌하, 하, 우하, 우

    for i in 0..<board.count {
        for j in 0..<board[0].count {
            if board[i][j] != 0 {
                for dir in dirs {
                    for k in 1..<5 {
                        let x = i + k * dir[0]
                        let y = j + k * dir[1]

                        if isOutOfSize(board.count, x, y) || board[i][j] != board[x][y]{
                            break
                        }

                        if k == 4 {
                            let preX = i - dir[0]
                            let preY = j - dir[1]
                            let nextX = x + dir[0]
                            let nextY = y + dir[1]

                            if isOutOfSize(board.count, preX, preY) || isOutOfSize(board.count, nextX, nextY) || board[i][j] == board[nextX][nextY] || board[i][j] == board[preX][preY]{
                                break
                            } else {
                                return board[i][j]
                            }
                        }
                    }
                }
            }
        }
    }

    return 0
}

func isOutOfSize(_ boardSize: Int, _ x: Int, _ y: Int) -> Bool{
    return x < 0 || x == boardSize || y < 0 || y == boardSize
}

print(solution([
[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
[0, 0, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
[0, 2, 1, 1, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0],
[0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
[0, 0, 2, 1, 1, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0],
[0, 0, 0, 1, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0],
[0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
[0, 2, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]]))
