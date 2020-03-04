//
//  Beautiful Arrangement.swift
//  Question Link: https://leetcode.com/problems/beautiful-arrangement/
//  Primary idea:   <BackTracking>
//                  1. 기존의 Backtracking 기법을 문제들을 응용함
//                  2. 종료조건 : 계산하는 배열과 입력한 N값이 같을때
//                  3. branch : 계산하는 배열(arrangement)에 동일한 값을 가지고 있을때
//                  4. N(input value)가 15일때, Time Limit Exceeded 발생
//                      1) 결과값을 append하지 않고 Int로 선언하여 값을 증가시키기

//  Runtime :
//  Memory :
//
//  Created by gunhyeong on 2020/03/04.
//

import Foundation

class Solution {
    var N: [Int] = []
    var beautifulArrangmentCnt: Int = 0
    
    func countArrangement(_ N: Int) -> Int {
        guard N > 0 && N < 16 else { // N is a positive integer and will not exceed 15.
            return 0
        }
        
        self.N = Array(1...N)
        var arrangement = [Int]()
        backTracking(&arrangement, 1) // 1. 기존의 방식
        return beautifulArrangmentCnt
    }
    
    func backTracking(_ arrangement: inout [Int], _ index: Int){
        if arrangement.count == N.count { // 2. 종료조건
            beautifulArrangmentCnt += 1
            return
        }
        
        for i in 0..<N.count {
            if arrangement.contains(N[i]) { // 3. 건너띄기! 동일한 값을 가지고 있으면 계산 하지 않기
                continue
            }
            
            if (index % N[i] == 0 || N[i] % index == 0) { // 4. 서로 나누어 떨어질때만
                arrangement.append(N[i])
                backTracking(&arrangement, index+1)
                arrangement.removeLast()
            }
        }
    }
}
