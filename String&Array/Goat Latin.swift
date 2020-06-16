/*
*  Goat Latin.swift
*  Question Link: https://leetcode.com/problems/goat-latin/
*  Primary idea:   <String & Array>
*                  1. vowel 배열 선언 : 모음의 대,소문자를 미리 선언
*                  2. 분리 : space를 기준으로 분리
*                  3. 첫번째 알파벳 : 첫번쨰 알파벳 추출
*                  4. contrains : vowel에 포함되어 있는지 확인
*                      4-1 : 포함되어 있을 경우, 첫번째 알파벳 + Latin
*                      4-2 : 포함되어 있지 않을 경우, Latin만
*                  5. Latin : 문자열에 "a" 추가
*
*  Time Complexity : O(n)
*  Space Complexity : O(n), n은 vowel의 수
*  Runtime: 8 ms
*  Memory Usage: 21.4 MB
*
*  Created by gunhyeong on 2020/04/09.
*/

import Foundation

class Solution {
    func toGoatLatin(_ S: String) -> String {
        let vowel = ["a", "e", "i", "o", "u", "A", "E", "I", "O", "U"]
        var result = ""
        let words = S.split(separator: " ")
        var latin = "maa"

        for word in words {
            var newWord = word
            let first = String(newWord.first!)
            if vowel.contains(first) {
                newWord += latin
            } else {
                newWord = newWord.dropFirst()
                newWord += first + latin
            }
            
            latin += "a"
            result += newWord + " "
        }
        
        return String(result.dropLast())
    }
}
