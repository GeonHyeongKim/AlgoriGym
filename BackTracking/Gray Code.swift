//
//  Gray Code.swift
//  Question Link: https://leetcode.com/problems/gray-code/
//  Primary idea:   <BackTracking>
//                  1. 공식 : 'https://johngrib.github.io/wiki/gray-code/'을 참고
//                      - 오른쪽으로 비트 쉬프트 한 다음, 본래 값과 논리합을 하면 끝난다는 것
//                  2. backTracking

//  Runtime:
//  Memory Usage:
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
        
        folmula(n, &result) //1. 공식
        
        return result
    }
    
    
    func folmula(_ n: Int, _ result: inout [Int]) { // 공식 사용
        let num = (1<<n)
        
        for bin in 0..<num {
            result.append(bin ^ (bin>>1))
        }
    }
}
