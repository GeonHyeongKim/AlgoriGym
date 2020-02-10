//
//  NumberOfIslands(BFS).swift
//  Primary idea:   1. 2중 반복문에서 BFS로 풀기
//                  2. queue 개념 이용하기
//                  3. if, guard를 통해 조건 비교하기
//                  4. String으로 변경 후 if문 비교하기

//  Time Complexity :
//  Space Complexity :
//
//  Created by gunhyeong on 2020/02/10.

import Foundation

class Solution {
    func numIsland_BFS(_ grid: [[Character]]) -> Int {
        guard grid.count >= 0 || grid[0].count >= 0 else {
            return 0
        }
        var grid = grid
        var count = 0

        for i in 0..<grid.count {
            for j in 0..<grid[0].count {
                if String(grid[i][j]) == "1" {
                    count += 1
                    bfs(grid: &grid, i, j)
                }
            }
        }

        return count
    }

    private func bfs(grid: inout [[Character]], _ i: Int, _ j: Int ){
        let dirs = [[-1,0], [1,0], [0,-1], [0,1]]
        var queue = [[Int]]()
        queue.append([i, j])
        
        while !queue.isEmpty {
            let size = queue.count
            let point = queue.first
            queue.remove(at: 0)

            for _ in 0..<size {
                for dir in dirs {
                    let x = dir[0] + point![0]
                    let y = dir[1] + point![1]
                    if x >= 0 && y >= 0 && x < grid.count && y < grid[0].count && String(grid[x][y]) == "1" {
                        grid[x][y] = "0"
                        queue.append([x, y])
                    }
                }
            }
        }
    }
}
