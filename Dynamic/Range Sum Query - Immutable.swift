/*
*  Range Sum Query - Immutable.swift
*  Question Link: https://leetcode.com/problems/range-sum-query-immutable/

*  Created by gunhyeong on 2020/03/24.
*/

import Foundation

/*
*  Primary idea:   <Brute Force>
*                  1. init() : input(nums)을 저장
*                  2. sumRange(i, j) : i~j까지 누적
*
*  Time Complexity : O(n)
*  Space Complexity : O(1)
*  Runtime: 1500 ms
*  Memory Usage: 22.1 MB
*/
 
class NumArray {
    let nums: [Int]
    
    init(_ nums: [Int]) {
        self.nums = nums
    }
    
    func sumRange(_ i: Int, _ j: Int) -> Int {
        var sum = 0
        for x in i...j {
            sum += nums[x]
        }
        return sum
}

/*
*  Primary idea:   <Dynamic Programming>
*                  1. init() : dp 배열을 선언해 미리 구해 저장한다.
*                  2. sumRange(i, j) : j까지 더한 값에서 i까지 더한 값 빼준다
*
*  Time Complexity : O(1)
*  Space Complexity : O(n)
*  Runtime: 104 ms
*  Memory Usage: 21.8 MB
*/
 
class NumArray {
    var dp: [Int]
    
    init(_ nums: [Int]) {
        self.dp = [Int](repeating: 0, count: nums.count+1)
        
        for i in 0..<nums.count {
            dp[i+1] = dp[i] + nums[i]
        }
    }
    
    func sumRange(_ i: Int, _ j: Int) -> Int {
        
        return dp[j+1] - dp[i]
    }
}


/**
 * Your NumArray object will be instantiated and called as such:
 * let obj = NumArray(nums)
 * let ret_1: Int = obj.sumRange(i, j)
 */
