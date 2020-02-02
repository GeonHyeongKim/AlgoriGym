//
//  PlusOne.swift
//  Question Link: https://leetcode.com/problems/plus-one/
//  Primary idea:   1. 뒷자리부터 9가 있는지 체크
//                  2. input[0], input[1], input[2]
//                  3. input[2] = 0
//                  4. 새로운 int[]의 크기를 증가
//                  5. 새로운 배열 res[0] = 1
//                  6. 9가 아닌경우, 해당자리수 값을 +1
//  Created by gunhyeong on 2020/02/02.
//

import Cocoa

class PlusOne {
    func plusOne(digits: [Int]) -> [Int] {
        var digits = digits
        var index = digits.count - 1
        
        while index >= 0 {
            if digits[index] != 9 {
                digits[index] += 1
                return digits
            }
            
            digits[index] = 0
            index -= 1
        }
        
        digits.insert(1, at: 0)
        return digits
    }
}
