/*
*  JewelsAndStones.swift
*  Question Link: https://leetcode.com/problems/jewels-and-stones/
*  Primary idea:   1. 보석은 대소문자를 구분해서 갖고 있어야 한다.
*                  2. aA -> 2개
*                  3. 스톤에 가서 aA가 개별적으로 몇개 있는지 파악
*
*  Time Complexity : O(J+S)
*  Space Complexity : O(1)
*  Runtime: 8 ms
*  Memory Usage: 20.7 MB
*
*  Created by gunhyeong on 2020/02/04.
*/

import Foundation

class JewelsAndStones {
    func numJewelsInStones(_ J: String, _ S: String) -> Int {
        var dict = [Character: Bool]() // set 속성
        
        for j in J {
            dict[j] = true
        }
        
        var result = 0
        
        for s in S {
            if let _ = dict[s] {
                result += 1
            }
        }
        
        return result
    }
}
