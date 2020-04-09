/*
*  Reverse Only Letters.swift
*  Question Link: https://leetcode.com/problems/reverse-only-letters/
*  Primary idea:   <String & Array>
*                  1. 반복 : left index가 right index보다 작을 떄까지 반복
*                  2. left index : 왼쪽 문자열이 문자인지 판별(isLetter) 후, 문자가 아니면 다음칸으로 이동
*                  3. right index : 오른쪽 문자열이 문자인지 판별(isLetter) 후, 문자가 아니면 다음칸으로 이동
*                  4. swap : 상대적로 같은 위치에 있는 문자만 서로 위치를 바꾼다.
*
*  Time Complexity : O(n)
*  Space Complexity : O(n)
*  Runtime: 8 ms
*  Memory Usage: 21.2 MB
*
*  Created by gunhyeong on 2020/04/10.
*/

import Foundation

class Solution {
    func reverseOnlyLetters(_ S: String) -> String {
        var strArr = Array(S)
        var left = 0
        var right = S.count - 1
        
        while left < right { // 1. 반복
            if !strArr[left].isLetter { // 2. left index
                left += 1
                continue
            }
            
            if !strArr[right].isLetter { // 3. right index
                right -= 1
                continue
             }
            
            strArr.swapAt(left, right) // 4 swap
            left += 1
            right -= 1
        }
        
        return String(strArr)
    }
}
