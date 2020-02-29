//
//  Path with Maximum Gold .swift
//  Question Link: https://leetcode.com/problems/path-with-maximum-gold/
//  Primary idea:   <BackTracking>
//                  1. guard를 통해 grid의 기본적인 nil 체크 및 dfs로 grid의 크기를 벗어났는지를 check
//                  2. 현재 grid[i][j]를 sum 변수에 누적해서 더하고 dfs로 다시 재귀

//  Runtime : 844 ms
//  Memory : 21 MB
//
//  Created by gunhyeong on 2020/02/29.
//

import Foundation

class Solution {
    
    let dirs = [[-1,0], [1,0], [0,1], [0,-1]]
    var row: Int = 0
    var col: Int = 0
    
    func getMaximumGold(_ grid: [[Int]]) -> Int {
        guard grid.count > 0 || grid[0].count > 0 else { // input value에 예외처리
            return 0
        }
        
        var grid = grid
        var result = 0 // 결과를 닶을 변수
        row = grid.count
        col = grid[0].count

        for i in 0..<row {
            for j in 0..<col {
                if grid[i][j] != 0{ // 0이 아닌곳을 start로 지정\
                    let sum = dfs(&grid, i, j, 0)
                    result = max(result, sum)
                }
            }
        }
        
        return result
    }
    
    func dfs(_ grid: inout [[Int]], _ i: Int, _ j: Int, _ sum: Int) -> Int{
        guard i >= 0 && i < row && j >= 0 && j < col && grid[i][j] != 0 else { // grid의 크기를 벗어날 경우
            return sum // 지금까지의 합을 반환한다.
        }
        
        var sum = sum
        sum += grid[i][j] // 현재 grid[i][j] 값을 sum에 누적
        
        let temp = grid[i][j] // 다시 갔던곳을 다시 다시 않음
        grid[i][j] = 0
        
        var maxValue = 0
        for dir in dirs {
            let dx = i + dir[0]
            let dy = j + dir[1]
            
            maxValue = max(maxValue, dfs(&grid, dx, dy, sum))
        }
        
        grid[i][j] = temp
        return maxValue
    }
}
