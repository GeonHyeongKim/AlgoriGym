//
//  NumberOfIslands.swift
//  Question Link: https://leetcode.com/problems/number-of-islands/
//  Primary idea:   1. 2중 반복문에서 dfs로 풀기
//                  2. grid[0][0]이 1인지 확인하기
//                  3. String으로 if문 비교하기
//
//  Time Complexity:
//  Space Complexity ://
//  Created by gunhyeong on 2020/02/09.
//

import Foundation

class Solution {
    func numIslands(_ grid: [[Character]]) -> Int {
        guard grid.count > 0 || grid[0].count > 0 else {
            return 0
        }
        var grid = grid
        var count = 0

        for i in 0..<grid.count {
            for j in 0..<grid[0].count {
                if String(grid[i][j]) == "1" {
                    count += 1
                    dfs(grid: &grid, i, j)
                }
            }
        }

        return count
    }

    private func dfs(grid: inout [[Character]], _ i: Int, _ j: Int ){
        let m = grid.count
        let n = grid[0].count

        if i < 0 || j < 0 || i >= m || j >= n || String(grid[i][j]) != "1" {
            return
        }

        grid[i][j] = Character("X")

        dfs(grid: &grid, i-1, j)
        dfs(grid: &grid, i+1, j)
        dfs(grid: &grid, i, j-1)
        dfs(grid: &grid, i, j+1)
    }
}
