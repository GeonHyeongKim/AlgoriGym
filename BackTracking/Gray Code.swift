//
//  Gray Code.swift
//  Question Link: https://leetcode.com/problems/gray-code/
//  Primary idea:   <BackTracking>
//                  1. 공식 : 'https://johngrib.github.io/wiki/gray-code/'을 참고
//                      - 오른쪽으로 비트 쉬프트 한 다음, 본래 값과 논리합을 하면 끝난다는 것
//                  2. backTracking
//                      - index : 계산하기 위한 조건
//                      - num : reference로 연결

//  Runtime: 1) 12 ms,
//  Memory Usage: 1) 20.5 MB,
//
//  Created by gunhyeong on 2020/03/08.
//

import Foundation

class Solution {
    func grayCode(_ n: Int) -> [Int] {
        guard n > 0 else {
            return [0]
        }
        var result = [Int]()
        var num = 0
        
//        folmula(n, &result) //1. 공식
        backTracking(n, &result, &num, n-1) //2. backTracking
        
        return result
    }
    
    
    func folmula(_ n: Int, _ result: inout [Int]) { // 공식 사용
        let num = (1<<n)
        
        for bin in 0..<num {
            result.append(bin ^ (bin>>1))
        }
    }
    
    func backTracking(_ n : Int, _ result: inout [Int], _ num: inout  Int, _ index: Int){ // backTracking
        if index == -1 {
            result.append(num)
            return
        }
        
        backTracking(n-1, &result, &num, index-1)
        num = num ^ (1 << index)
        backTracking(n-1, &result, &num, index-1)
    }
}
