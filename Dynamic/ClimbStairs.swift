/*
*  ClimbStairs.swift
*  Question Link: https://leetcode.com/problems/climbing-stairs/
*  Primary idea:   1. dp[3] = dp[2] + dp[1] --> dp[i] = dp[i-1] + dp[i-2]
*
*  Time Complexity : O(n)
*  Space Complexity : O(1)
*  Runtime: 4 ms
*  Memory Usage: 20.9 MB
*
*  Created by gunhyeong on 2020/02/06.
*/

import Foundation

class Solution {
    func climbStairs(_ n: Int) -> Int {
        var dp = Array(repeating: -1, count: n + 1)
        
        if n < 0 {
            return 0
        }
        
        if n == 0 || n == 1 {
            return 1
        }
        
        if n == 2{
            return 2
        }
        
        dp[0] = 0
        dp[1] = 1
        dp[2] = 2
    
        for i in 3..<dp.count {
            dp[i] = dp[i-1] + dp[i-2]
        }
        
        return dp[n]
    }
}
