/*
*  Reverse Vowels of a String.swift
*  Question Link: https://leetcode.com/problems/reverse-vowels-of-a-string/
*  Primary idea:   <String & Array>
*                  1. vowel 배열 선언 : 모음의 대,소문자를 미리 선언
*                  2. 반복 : left index가 right index보다 작을 떄까지 반복
*                  3. left index : 왼쪽 문자열이 문자인지 판별(isLetter) 후, 문자가 아니면 다음칸으로 이동
*                  4. right index : 오른쪽 문자열이 문자인지 판별(isLetter) 후, 문자가 아니면 다음칸으로 이동
*                  5. swap : 상대적로 같은 위치에 있는 문자만 서로 위치를 바꾼다.
*
*  Time Complexity : O(n)
*  Space Complexity : O(n)
*  Runtime: 196 ms
*  Memory Usage: 21.9 MB
*
*  Created by gunhyeong on 2020/04/11.
*/

import Foundation

class Solution {
    func reverseVowels(_ s: String) -> String {
        let vowel = ["a", "e", "i", "o", "u", "A", "E", "I", "O", "U"] // 1. vawel
        var strArr = Array(s)
        var left = 0
        var right = s.count - 1
        
        while left < right { // 2. 반복
            if !vowel.contains(String(strArr[left])) { // 3. left index
                left += 1
                continue
            }
            
            if !vowel.contains(String(strArr[right])) { // 4. right index
                right -= 1
                continue
            }
            
            strArr.swapAt(left, right) // 5. swap
            left += 1
            right -= 1
        }
        
        return String(strArr)
    }
}
