//
//  Sequential Digits.swift
//  Question Link: https://leetcode.com/problems/sequential-digits/
//  Primary idea:   <BackTracking>
//                  1 종료 - 계산된 숫자(next)가 최대치 자릿수(high)보다 크면 계산하지 않음
//                  2. 저장 - 계산된 숫자(next)가 시작 자릿수(low) <= next <= high일 경우
//                  3. 계산 - next%10+1 은 다음 자릿수를 고려하여 9가 넘지 않을 경우.

//  Runtime:
//  Memory Usage:
//
//  Created by gunhyeong on 2020/03/07.
//

import Foundation

class Solution {
    var result = [Int]()
    
    func sequentialDigits(_ low: Int, _ high: Int) -> [Int] {
        guard 10 <= low && low <= high && high <= Int(pow(10.0, 9.0)) else {
            return result
        }
        
        for next in 1...9 {
            backTracking(low, high, next, 1)
        }
        
        return result.sorted()
    }
    
    func backTracking(_ low: Int, _ high: Int, _ next: Int, _ count: Int) {
        if next > high { // 1. 종료
            return
        }
        
        if (next >= low) && (next <= high) { // 2. 저장
            result.append(next)
        }
        
        if (next%10+1) <= 9 { // 3. 계산
            backTracking(low, high, (next*10)+(next%10+1), count+1)
        }
    }
}
