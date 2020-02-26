//
//  Letter Case Permutation.swift
//  Question Link: https://leetcode.com/problems/letter-case-permutation/
//  Primary idea:   <BackTracking>
//                  1. 문자한개를 추출하여 숫자인지 문자인지 isNumber를 통해 판단
//                  2. 다음 문자를 upper와 lower를 통해 재귀함수로 돌림
//                  3. 조건에 맞을 때까지 계속 전진
//                  4. 더이상 나아갈 길이 없으면 한칸 후퇴
//                  5. 계속 반복

//  Time Complexity :
//  Space Complexity :
//
//  Created by gunhyeong on 2020/02/25.
//

class Solution {
    func letterCasePermutation(_ S: String) -> [String] {
        var inputString = Array(S)
        guard inputString.count >= 0 else {
            return []
        }
        
        var result = [String]()
    
        dfsSolution(&inputString, &result, 0)
        
        return result
    }
    
    private func dfsSolution(_ input: inout [Character], _ result: inout [String], _ currentIndex: Int) {
        if input.count == currentIndex { // end 조건
            result.append(String(input))
            return
        }
        
        let character = input[currentIndex]
        
        if character.isNumber { // 숫자인지 아닌지 판별 -> guard
            dfsSolution(&input, &result, currentIndex+1)
            return
        }
        
        input[currentIndex] = Character(input[currentIndex].uppercased())
        dfsSolution(&input, &result, currentIndex+1) // 다음 upper 문자 판단
        input[currentIndex] = Character(input[currentIndex].lowercased())
        dfsSolution(&input, &result, currentIndex+1) // 다음 lower 문자 판단
    }
}
