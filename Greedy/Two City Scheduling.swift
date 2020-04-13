/*
*  Two City Scheduling.swift
*  Question Link: https://leetcode.com/problems/two-city-scheduling/
*  Primary idea:   <Greedy>
*                  1. 정렬 : B city보다 저렴한 A city로 정렬
*                  2. City 별 계산
*
*  Time Complexity :
*  Space Complexity :
*  Runtime:  ms
*  Memory Usage:  MB
*
*  Created by gunhyeong on 2020/04/13.
*/

import Foundation

class Solution {
    func twoCitySchedCost(_ costs: [[Int]]) -> Int {
        let half = costs.count/2
        
        // 1. 정렬
        let sortedCosts = costs.sorted{
            ($0[0] - $0[1]) < ($1[0] - $1[1])
        }
        var total = 0
        
        for i in 0..<sortedCosts.count {
            if i < half { // 2-2. City A
                total += sortedCosts[i][0]
            } else { // 2-1. City B
                total += sortedCosts[i][1]
            }
        }
        
        return total
    }
}
