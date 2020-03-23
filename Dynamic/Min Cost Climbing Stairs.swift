/*
*  Min Cost Climbing Stairs.swift
*  Question Link: https://leetcode.com/problems/min-cost-climbing-stairs/
*  Primary idea:   <Dynamic Programming>
*                  1. dp : d[i] = min(d[i-1], d[i-2])
*                  2. 계산 하려는 현재 값
*
*  Time Complexity : O()
*  Space Complexity : O()
*  Runtime:  ms
*  Memory Usage:  MB
*
*  Created by gunhyeong on 2020/03/23.
*/

import Foundation

class Solution {
    func minCostClimbingStairs(_ cost: [Int]) -> Int {
        var minCost_dp = [Int](repeating: 0, count: cost.count + 1)
        minCost_dp[0] = cost[0]
        minCost_dp[1] = cost[1]
        
        for i in 2..<cost.count+1 {
            let currentCost = ( i == cost.count ) ? 0 : cost[i] // 2. 계산 하려는 현재 값
            minCost_dp[i] = currentCost + min(minCost_dp[i-1], minCost_dp[i-2]) // 1. dp
        }
        
        return minCost_dp[cost.count]
    }
}
