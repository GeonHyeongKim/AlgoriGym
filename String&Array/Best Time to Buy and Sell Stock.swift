/*
*  Best Time to Buy and Sell Stock.swift
*  Question Link: https://leetcode.com/problems/jewels-and-stones/
*  Primary idea:    <String & Array>
*                   1. 2중 for문을 통해 풀기 -> Time Complexity가 O(n^2) (x)
*                   2. 반복문 하나로 풀기 -> 배열의 최소값(minPrice)을 가지고 있기 -> max()를 통해 최소값이 발견된 시점 부터 최대값 저장하기
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
        if prices.isEmpty { // 빈 배열인지 확인
            return 0
        }
        
        var result = 0
        var minPrice = prices.max()!
        
        for price in prices {
            if price < minPrice {
                minPrice = price
            }
            
            result = max(result, price - minPrice)
        }
        
        return result
    }
}
