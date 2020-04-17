/*
*  Minimum Add to Make Parentheses Valid .swift
*  Question Link: https://leetcode.com/problems/minimum-add-to-make-parentheses-valid/
*  Primary idea:   <Greedy>
*                  1. "(" : 왼족 소괄호가 나올때, count를 1 증가 시키고 ")"일때 1 감소 시킨다.
*                  2. count = 0 : "( )" 짝을 이룰때 0이다.
*
*  Time Complexity : O(n)
*  Space Complexity : O(1)
*  Runtime: 8 ms
*  Memory Usage: 20.6 MB
*
*  Created by gunhyeong on 2020/04/17.
*/

import Foundation

class Solution {
    func minAddToMakeValid(_ S: String) -> Int {
        var result = 0
        var count = 0
        
        for char in S {
            if char == "(" { // 1. "("
                count += 1
                continue
            }
            
            if count == 0 { // 2. count = 0
                result += 1 // 2-1. 결과값 증가
            } else {
                count -= 1 // 2-2. count 감소
            }
        }
        
        return result + count
    }
}
