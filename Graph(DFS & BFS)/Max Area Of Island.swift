//
//  Max Area Of Island.swift
//  Question Link: https://leetcode.com/problems/max-area-of-island/
//  Primary idea:   1. number of island와 비슷하게 푼다.
//                  2. DFS방식으로 풀어낸다.
//                  3. dirs의 미리 정해진 방향의 배열을 선언한다. --> dirs = [[-1,0], [1,0], [0,-1], [0,1]]
//                  4. 지역의 개수를 담을 변수를 이용하여 max 변수와 max함수를 이용해 풀어낸다.

//  Time Complexity :
//  Space Complexity :
//
//  Created by gunhyeong on 2020/02/11.
//

import Foundation

class Solution {
    func maxAreaOfIsland(_ grid: [[Int]]) -> Int {
        guard grid.count >= 0 || grid[0].count >= 0 else {
            return 0
        }
        var grid = grid
        var maxCnt = 0

        for i in 0..<grid.count {
            for j in 0..<grid[0].count{
                if grid[i][j] == 1 {
                    let areaCnt = dfs(grid: &grid, i, j, areaCnt: 0) // 초기 개수 0
                    maxCnt = max(maxCnt, areaCnt)
                }
            }
        }
        
        return maxCnt
    }
    

    let dirs = [[-1,0], [1,0], [0,-1], [0,1]]
    
    private func dfs(grid: inout [[Int]], _ x: Int, _ y: Int, areaCnt: Int) -> Int {
        if x < 0 || x >= grid.count || y < 0 || y >= grid[0].count || grid[x][y] != 1 {
            return areaCnt
        }
        
        grid[x][y] = 0
        var areaCnt = areaCnt
        areaCnt += 1
        
        for dir in dirs {
            areaCnt = dfs(grid: &grid, x+dir[0], y+dir[1], areaCnt: areaCnt)
        }
        
        return areaCnt;
    }
}
