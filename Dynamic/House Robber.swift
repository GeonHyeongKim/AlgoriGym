/*
*  House Robber.swift
*  Question Link: https://leetcode.com/problems/house-robber/
*  Primary idea:   <Dynamic Programming>
*                  1. dp
*                  2. 점화식 : 3개 이상일 경우부터 dp[i] = max(dp[i-2] + nums[i], dp[i-1]) 규칙
*
*  Time Complexity : O(n)
*  Space Complexity : O(n)
*  Runtime: 8 ms
*  Memory Usage: 21 MB
*
*  Created by gunhyeong on 2020/03/26.
*/

import Foundation

class Solution {
    func rob(_ nums: [Int]) -> Int {
        guard nums.count > 0 else { 
            return 0
        }
        
        if nums.count == 1 {
            return nums[0]
        }
        
        var dp = [Int](repeating: 0, count: nums.count) // 1. dp
        dp[0] = nums[0];
        dp[1] = max(nums[0], nums[1])
        
        for i in 2..<nums.count {
            dp[i] = max(dp[i-2] + nums[i], dp[i-1]) // 2. 점화식
        }
        return dp[nums.count-1]
    }
}
