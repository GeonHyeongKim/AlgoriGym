/*
*  Split a String in Balanced Strings.swift
*  Question Link: https://leetcode.com/problems/split-a-string-in-balanced-strings/
*  Primary idea:   <String&Array>
*                  1. check : "R"일때 1증가, "L"일떄 1감소
*                  2. count : check 변수가 0일때 증가
*
*  Time Complexity :
*  Space Complexity :
*  Runtime:  ms
*  Memory Usage:  MB
*
*  Created by gunhyeong on 2020/04/01.
*/

import Foundation

class Solution {
    func balancedStringSplit(_ s: String) -> Int {
        var checkBalance = 0 // 1. check
        var countBalance = 0 // 2. count
        
        for c in s {
            switch c {
            case "R":
                checkBalance += 1
            case "L":
                checkBalance -= 1
            default:
                print("error")
            }
            
            if checkBalance == 0 {
                countBalance += 1
            }
        }
        
        return countBalance
    }
}
