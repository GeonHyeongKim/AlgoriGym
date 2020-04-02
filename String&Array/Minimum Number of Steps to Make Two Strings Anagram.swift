/*
*  Minimum Number of Steps to Make Two Strings Anagram.swift
*  Question Link: https://leetcode.com/problems/minimum-number-of-steps-to-make-two-strings-anagram/
*  Primary idea:   <String & Array>
*                  1. 아나그램(Anagram) : 일종의 말장난으로 어떠한 단어의 문자를 재배열하여 다른 뜻을 가지는 다른 단어로 바꾸는 것을 말한다.
*                  2. s의 alphabet의 각 갯수
*                  3. t의 alphabet의 각 갯수가 0보다 클경우, 사용했으므로 한개씩 감소
*
*  Time Complexity :
*  Space Complexity :
*  Runtime:  ms
*  Memory Usage:  MB
*
*  Created by gunhyeong on 2020/04/02.
*/

import Foundation

class Solution {
    func minSteps(_ s: String, _ t: String) -> Int {
        var isUsed = [Int](repeating: 0, count: 26) // alphabet
        var count = 0
    
        for i in s.utf8 {
            isUsed[Int(i) - 97] += 1 // 2. s의 alphabet의 각 갯수
        }
                
        for i in t.utf8 {
            if isUsed[Int(i) - 97] > 0 { // 3. t의 alphabet의 각 갯수가 0보다 클경우,
                isUsed[Int(i) - 97] -= 1 // 사용했으므로 한개씩 감소
                count += 1
            }
        }
                
        return t.count - count
    }
}
