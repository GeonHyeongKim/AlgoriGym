//
//  Binary Watch.swift
//  Question Link: https://leetcode.com/problems/binary-watch/
//  Primary idea:   <BackTracking>
//                  1. 기본적으로 시간과 분을 함수로 파라미터로 보낸 뒤 계수를 반환한다.
//                  2. String(Int, radix: 진수) 함수를 이용해 각 숫자(시 분)의 계수를 구한다.
//                  3. Array의 filter를 이용하여 1인 것만 다시 배열에 집어 넣는다.

//  Time Complexity :
//  Space Complexity :
//
//  Created by gunhyeong on 2020/02/26.
//

import Foundation

class Solution {
    func readBinaryWatch(_ num: Int) -> [String] {
        guard num >= 0 else {
            return ["00:00"]
        }
        
        var result = [String]()
        
        for hour in 0...11 { // 시
            for minute in 0...59 { // 분
                if find(hour, minute) == num {
                    result.append(String(format: "%02d:02%d", hour, minute))
                }
            }
        }
        
        return result
    }
    
    private func find(_ hour: Int, _ minute: Int) -> Int {
        let hourCnt = Array(String(hour, radix: 2)).filter {$0 == "1"}.count
        let minuteCnt = Array(String(minute, radix: 2)).filter {$0 == "1"}.count
        return hourCnt + minuteCnt
    }
}
