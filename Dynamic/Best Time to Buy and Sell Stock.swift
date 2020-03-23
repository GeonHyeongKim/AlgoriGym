/*
*  Best Time to Buy and Sell Stock.swift
*  Question Link: https://leetcode.com/problems/best-time-to-buy-and-sell-stock/
*  Primary idea:   <Dynamic Programming>
*                  1. dp
*                      1) 앞서 나왔던 가장 최소값을 기억
*                      2) 하고 그 값을 이용해 차를 계산하고, 만일, 최소 값보다 작은 값이 나온다면 최소 값을 update
*
*  Time Complexity : O(n)
*  Space Complexity : O(1)
*  Runtime: 36 ms
*  Memory Usage: 21.2 MB
*
*  Created by gunhyeong on 2020/03/23.
*/

import Foundation

class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        guard prices.count > 0 else {
            return 0
        }
        var min = prices[0]
        var max_diff = 0
        
        for i in 0..<prices.count {
            if prices[i] < min {
                min = prices[i] // 1-1. dp
            } else {
                let diff = prices[i] - min // 1-2. dp
                max_diff = max(max_diff, diff)
            }
        }
        
        return max_diff
    }
}
