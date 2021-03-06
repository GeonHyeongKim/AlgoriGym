/*
*  UniquePaths.swift
*  Question Link: https://leetcode.com/problems/unique-paths/
*  Primary idea:   1. result이 1로 다 초기화 되어 있음
*                  2. 2행 2열 부터 result[i][j] = result[i-1][j] + result[i][j-1]
*
*  Time Complexity : O(n^2)
*  Space Complexity : O(n)
*  Runtime: 4 ms
*  Memory Usage: 20.6 MB
*
*  Created by gunhyeong on 2020/02/07.
*/

import Foundation

class Solution {
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        if m < 0 || n < 0 {
            return 0
        }
        if m == 0 || n == 0 {
            return 1
        }
        
        var result = Array(repeating: Array(repeating: 1, count: n), count: m)

        for i in 1..<m {
            for j in 1..<n {
                result[i][j] = result[i-1][j] + result[i][j-1]
            }
        }
        
        return result[m-1][n-1]
    }
}
