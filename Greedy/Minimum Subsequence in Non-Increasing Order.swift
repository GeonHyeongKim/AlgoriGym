/*
*  Minimum Subsequence in Non-Increasing Order.swift
*  Question Link: https://leetcode.com/problems/minimum-subsequence-in-non-increasing-order/
*  Primary idea:   <Greedy>
*                  1. 조건 : 부분합(sum)이 전체의 2분의 1보다 작을때까지
*
*  Time Complexity : O(n)
*  Space Complexity : O(1)
*  Runtime: 84 ms
*  Memory Usage: 21.2 MB
*
*  Created by gunhyeong on 2020/04/14.
*/

import Foundation

class Solution {
    func minSubsequence(_ nums: [Int]) -> [Int] {
        var result = [Int]()
        let sortedNums = nums.sorted(by: >)
        var i = 0
        var sum = 0
        let totalSum = nums.reduce(0, +)
        
        while sum <= totalSum/2 { // 1. 조건
            sum += sortedNums[i]
            result.append(sortedNums[i])
            i += 1
        }
        
        return result
    }
}
