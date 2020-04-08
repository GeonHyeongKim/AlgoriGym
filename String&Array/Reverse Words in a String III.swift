/*
*  Reverse Words in a String III.swift
*  Question Link: https://leetcode.com/problems/reverse-words-in-a-string-iii/
*  Primary idea:   <String & Array>
*                  1. 분리 : Split()으로 " "를 인식하면 분리
*                  2. 마지막 문자열 제거 : dropLast()를 이용해 마지막 문자열(" ") 제거
*
*  Time Complexity : O(n)
*  Space Complexity : O(n)
*  Runtime: 196 ms
*  Memory Usage: 22 MB
*
*  Created by gunhyeong on 2020/04/08.
*/

import Foundation

class Solution {
    func reverseWords(_ s: String) -> String {
        var result = ""
        let words = s.split(separator: " ") // 1. 분리
        
        for word in words {
            result += word.reversed()
            result += " "
        }
        
        return String(result.dropLast()) // 2. 마지막 제거
    }
}
