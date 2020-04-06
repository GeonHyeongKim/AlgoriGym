/*
*  Decrypt String from Alphabet to Integer Mapping.swift
*  Question Link: https://leetcode.com/problems/decrypt-string-from-alphabet-to-integer-mapping/
*  Primary idea:   <String & Array>
*                  0. String(s)를 뒤에서 부터 읽는다.
*                  1. #일 경우 : 현재 index(i)에서 왼쪽에서 2번째와 1번째를 value값으로 식별 후 index를 -2 감소
*                  2. #이 아닐 경우 : 현재 index에 해당하는 배열값을 value값으로 식별
*
*  Time Complexity :
*  Space Complexity :
*  Runtime:  ms
*  Memory Usage:  MB
*
*  Created by gunhyeong on 2020/04/06.
*/

import Foundation

class Solution {
    func freqAlphabets(_ s: String) -> String {
        let alphabet = Array("abcdefghijklmnopqrstuvwxyz")
        var result = ""
        let s = Array(s)
        
        var i = s.count - 1 // 0. 뒤부터
        
        while i >= 0 {
            if s[i] == "#" { // 1. #일 경우
                let value = Int(String(s[i-2...i-1]))
                result += String(alphabet[value!-1])
                i -= 2
            } else { // 2/ #이 아닐 경우
                let value = Int(String(s[i]))
                result += String(alphabet[value!-1])
            }
            
            i -= 1
        }
        
        return String(result.reversed())
    }
}
