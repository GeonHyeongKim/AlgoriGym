/*
*  Is Subsequence.swift
*  Question Link: https://leetcode.com/problems/is-subsequence/
*  Primary idea:   <String & Array>
*                  1. 순차적으로 비교 : 순차적으로 subString(s)의 값과 비교했을때, target(t)의 값과 같을때
*                  2. 종료 : s의 길이와 다음으로 비교할 index(cur)의 값이 같을때
*
*  Time Complexity : O(n), n: t
*  Space Complexity : O(n), n: s
*  Runtime:  ms
*  Memory Usage:  MB
*
* Created by gunhyeong on 2020/03/23.
*/

import Foundation

class Solution {
    func isSubsequence(_ s: String, _ t: String) -> Bool {
        if s.isEmpty { // Exception : ""
            return true
        }
        
        let sArray = Array(s)
        var cur = 0
        
        for char in t {
            if sArray[cur] == char { // 1. 순차적으로 비교
                cur += 1
                if s.count == cur { // 2. 종료
                    return true
                }
            }
        }
        
        return false
    }
}
