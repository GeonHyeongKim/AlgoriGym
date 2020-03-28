/*
*  Matrix Block Sum.swift
*  Question Link: https: https://leetcode.com/problems/matrix-block-sum/
*  Primary idea:   <Dynamic Programming>
*                  1. dp
*                  2. 점화식 : dp[i][j] = dp[i-1][j] + dp[i][j-1] - dp[i-1][j-1] + mat[i-1][j-1]
*
*  Time Complexity : O(mn)
*  Space Complexity : O(mn)
*  Runtime: 80 ms
*  Memory Usage: 21.8 MB
*
*  Created by gunhyeong on 2020/03/21.
*/

import Foundation

class Solution {
    func matrixBlockSum(_ mat: [[Int]], _ K: Int) -> [[Int]] {
        var dp = [[Int]](repeating: [Int](repeating: 0, count: mat[0].count+1), count: mat.count+1) // dp
        var result = [[Int]](repeating: [Int](repeating: 0, count: mat[0].count), count: mat.count)
        
        for i in 1...mat.count {
            for j in 1...mat[0].count{
                dp[i][j] = dp[i-1][j] + dp[i][j-1] - dp[i-1][j-1] + mat[i-1][j-1]
            }
        }
                
        for i in 0..<mat.count {
            for j in 0..<mat[0].count{
                let upX = max(0, i-K)
                let upY = max(0, j-K)
                let downX = min(mat.count - 1, i+K) + 1
                let downY = min(mat[0].count - 1, j+K) + 1

                result[i][j] = dp[downX][downY] - dp[downX][upY] - dp[upX][downY] + dp[upX][upY]
            }
        }
        
        return result
    }
}
