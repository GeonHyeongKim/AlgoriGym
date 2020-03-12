/*
*  Letter Combinations of a Phone Number.swift
*  Question Link: https://leetcode.com/problems/letter-combinations-of-a-phone-number/
*  Primary idea:   <BackTracking>
*                  1. DFS를 활용한 Backtracking 기법으로 풀이하기
*                  2. guard를 통해 2~9인 숫자만 가지고 있는지 check
*                  3. dictionary([Character:String])로 배열을 선언하여 #42에서 바로 index로 접근할 수 있도록 변경
*
*  Time Complexity: O(n^n)
*  Space Complexity: O(n)
*  Runtime: 4 ms
*  Memory Usage: 21.9 MB
*
*  Created by gunhyeong on 2020/03/12.
*/

import Foundation

class Solution {
    let numberToStr: [Character:String] = ["0":"", "1":"", "2":"abc", "3":"def", "4":"ghi", "5":"jkl", "6":"mno", "7":"pqrs", "8":"tuv", "9":"wxyz"] // 3. dictionary
    
    func letterCombinations(_ digits: String) -> [String] {
        guard !digits.contains("0") && !digits.contains("1") && !digits.isEmpty else { // 2. Constraints 2~9
            return []
        }
        
        var combinations = [String]() // result
        var combination = ""
        
        backTracking(&combinations, &combination, Array(digits), 0)
        
        return combinations
    }
    
    func backTracking(_ combinations: inout [String], _ combination: inout String, _ digits: [Character], _ nextDigit: Int){
        if combination.count == digits.count {
            combinations.append(combination)
            return
        }
        
        let digit = digits[nextDigit]
        let letters = numberToStr[digit]!
                        
        for letter in letters {
            combination.append(letter)
            backTracking(&combinations, &combination, digits, nextDigit+1)
            combination.removeLast()
        }
    }
}
