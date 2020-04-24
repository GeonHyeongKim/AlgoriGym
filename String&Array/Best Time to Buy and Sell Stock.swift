/*
*  Best Time to Buy and Sell Stock.swift
*  Question Link: https://leetcode.com/problems/jewels-and-stones/
*  Primary idea:    <String & Array>
*                   1. 2중 for문을 통해 풀기 -> Time Complexity가 O(n^2)
*
*  Time Complexity :
*  Space Complexity :
*  Runtime:  ms
*  Memory Usage:  MB
*
*  Created by gunhyeong on 2020/04/24.
*/

import Foundation

class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        var result = 0
        
        for i in 0..<prices.count {
            for j in (i+1)..<prices.count {
                result = max(result, prices[j] - prices[i])
            }
        }
        
        return result
    }
}
