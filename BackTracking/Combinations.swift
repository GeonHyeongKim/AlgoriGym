//
//  Combinations.swift
//  Question Link: https://leetcode.com/problems/combinations/
//  Primary idea:   <BackTracking>
//                  1. 계산된 combination
//                  2. 저장 조건
//                  3. 반복문에서 upperIndex > lowerIndex를 방지

//  Runtime: 244 ms
//  Memory Usage: 22.9 MB
//
//  Created by gunhyeong on 2020/03/06.
//

import Foundation

class Solution {
    var result = [[Int]]()
    var n = Int()
    var k = Int()
    var permutation = [Int]()
    
    func combine(_ n: Int, _ k: Int) -> [[Int]] {
        self.n = n
        self.k = k
        
        var combination = [Int]() // 1. 계산된 combination
        backTracking(&combination, 1)
        return result
    }
    
    func backTracking(_ combination: inout [Int], _ startIndex: Int){
        if combination.count == k { // 2. 저장 조건
            result.append(combination.sorted())
            return
        }
        
        if startIndex > n { // 3. 반복문에서 upperIndex > lowerIndex를 방지
            return
        }
        
        for i in startIndex...n {
            combination.append(i)
            backTracking(&combination, i+1)
            combination.removeLast()
        }
    }
}
