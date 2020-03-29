/*
*  Count Square Submatrices with All Ones.swift
*  Question Link: https: https://leetcode.com/problems/count-square-submatrices-with-all-ones/
*  Primary idea:   <Dynamic Programming>
*                  1. dp
*                  2. 점화식
*                      1) 계산할 배열값을 기준으로, (왼쪽 위 대각선, 위, 왼쪽) 중 최소값을 구한 뒤 1을 더한값
*                      2) 누적해서 더해준다.
*
*  Time Complexity : O(mn)
*  Space Complexity : O(mn)
*  Runtime: 508 ms
*  Memory Usage: 21.3 MB
*
* Created by gunhyeong on 2020/03/29.
*/

import Foundation

class Solution {
    func countSquares(_ matrix: [[Int]]) -> Int {
        var dp = [[Int]](repeating: [Int](repeating: 0, count: matrix[0].count+1), count: matrix.count+1) // 1. dp
        var cnt = 0
        
        for i in 1...matrix.count {
            for j in 1...matrix[0].count {
                if matrix[i-1][j-1] == 1 {
                    dp[i][j] = min(dp[i-1][j-1], dp[i-1][j], dp[i][j-1]) + 1 // 2-1. 계산할 배열값을 기준으로, (왼쪽 위 대각선, 위, 왼쪽) 중 최소값을 구한 뒤 1을 더한값
                    cnt += dp[i][j] // 2-2. 누적
                }
            }
        }
                
        return cnt
    }
}
