//
//  Minesweeper.swift
//  Question Link: https://leetcode.com/problems/minesweeper/
//  Primary idea:       (DFS & BFS)
//                      1.
//
//  Time Complexity : O(n^n)
//  Space Complexity : O(n^2)
//  Runtime: 180 ms
//  Memory Usage: 21.8 MB
//
//  Created by gunhyeong on 2020/12/23.
//

import Foundation

class Solution {
    func updateBoard(_ board: [[Character]], _ click: [Int]) -> [[Character]] {
        guard board.count > 0, board[0].count > 0 else { return board }
        
        let height = board.count
        let width = board[0].count
        let row = click.first!, col = click.last!
        var board = board
        
        if board[row][col] == "M" {
            board[row][col] = "X"
        } else {
            var count = 0
            for i in -1..<2 {
                for j in -1..<2 {
                    if i == 0 && j == 0 { continue }
                    let r = row + i, c = col + j
                    
                    if checkBoundary(r, height, c, width) { continue }
                    
                    if board[r][c] == "M" || board[r][c] == "X" {
                        count += 1
                    }
                }
            }
            
            if count > 0 {
                board[row][col] = (Character)("\(count)")
            } else {
                board[row][col] = "B"
                
                for i in -1..<2 {
                    for j in -1..<2 {
                        if i == 0 && j == 0 { continue }
                        let r = row + i, c = col + j
                        
                        if checkBoundary(r, height, c, width) { continue }
                        
                        if board[r][c] == "E" {
                            board = updateBoard(board, [r, c])
                        }
                    }
                }
            }
        }
        
        return board
    }
    
    func checkBoundary(_ r: Int, _ height: Int, _ c: Int, _ width: Int) -> Bool {
        return r < 0 || r >= height || c < 0 || c >= width
    }
}
