/*
*  Maximum Subarray.swift
*  Question Link: https://leetcode.com/problems/maximum-subarray/
*  Primary idea:   <Dynamic Programming>
*                  1. dp : Dp로 한단계씩 최대 누적값을 구하기
*                  2. 점화식 : dp배열에 (이전에 값에 현재 값을 더한 값) vs (다 버리고 현재 값) 의 max 값을 비교한다.
*                            이때, 이전값과 비교하기 위해 index 1부터 시작하며, 1에 해당하는 dp[0]은 초기에 넣어둔다.
*
*  Time Complexity : O(n)
*  Space Complexity : O(n)
*  Runtime: 44 ms
*  Memory Usage: 21.4 MB
*
*  Created by gunhyeong on 2020/03/24.
*/

import Foundation

class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        var dp = [Int](repeating: 0, count: nums.count) // 1. dp
        dp[0] = nums[0] // 초기값
        
        for i in 1..<nums.count {
            dp[i] = max(dp[i-1]+nums[i], nums[i]) // 2. 점화식
        }
        
        return dp.max()!
    }
}

/* MARK. Improve Space Complexity
*  Time Complexity : O(n)
*  Space Complexity : O(1)
*  Runtime: 36 ms
*  Memory Usage: 21.4 MB
*/

class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        var maxCurrent = nums[0]
        var maxGrobal = nums[0]
        
        for i in 1..<nums.count {
            maxCurrent = max(maxCurrent+nums[i], nums[i])
            maxGrobal = max(maxCurrent, maxGrobal)
        }
        
        return maxGrobal
    }
}
