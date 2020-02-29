//
//  Path with Maximum Gold .swift
//  Question Link: https://leetcode.com/problems/path-with-maximum-gold/
//  Primary idea:   <BackTracking>
//                  1. guard를 통해 grid의 기본적인 nil 체크 및 dfs로 grid의 크기를 벗어났는지를 check


//  Runtime :
//  Memory :
//
//  Created by gunhyeong on 2020/02/29.
//

import Foundation

class Solution {
    
    let dir = [[-1,0], [1,0], [0,1], [0,-1]]
    var row: Int = 0
    var col: Int = 0
    
    func getMaximumGold(_ grid: [[Int]]) -> Int {
        guard grid.count > 0 || grid[0].count > 0 else { // input value에 예외처리
            return 0
        }
        
        var result = 0 // 결과를 닶을 변수
        row = grid.count
        col = grid[0].count

        for i in 0..<row {
            for j in 0..<col {
                if grid[i][j] != 0{ // 0이 아닌곳을 start로 지정
                    let sum = dfs(grid, i, j, 0)
                    result = max(result, sum)
                }
            }
        }
        
        return result
    }
    
    func dfs(_ grid: [[Int]], _ i: Int, _ j: Int, _ sum: Int) -> Int{
        guard i > 0  && i < row && j > 0 && j < col else { // grid의 크기를 벗어날 경우
            return sum // 지금까지의 합을 반환한다.
        }
        
        
        
        return 0
    }
}
