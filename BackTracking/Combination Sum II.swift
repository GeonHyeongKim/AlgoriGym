//
//  Combination Sum II.swift
//  Question Link: https://leetcode.com/problems/combination-sum-ii/
//  Primary idea:   <BackTracking>
//                  1. 중복 방지를 위해 Combination을 정렬한뒤
//                  2. 결과를 저장할때, 저장된 합계가 target과 같은지와 정렬된 값을 비교한다.

//  Runtime:
//  Memory Usage:
//
//  Created by gunhyeong on 2020/03/09.
//

import Foundation

class Solution {
    var result = [[Int]]()
    var candidates = [Int]()
    var target = Int(0)
    
    func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
        guard candidates.count > 0 && target > 0 else {
            return result
        }
        
        self.candidates = candidates
        self.target = target
        var combinations = [Int]()
        
        backTracking(&combinations, 0)
        
        return result
    }
    
    func backTracking(_ combinations: inout [Int] ,_ startIndex: Int) {
        let sortedCombinations = combinations.sorted() // 1. 중복 방지를 위한 정렬된 Combination
        if combinations.reduce(0, +) == target && !result.contains(sortedCombinations) { // 2. 결과 저장
            result.append(sortedCombinations)
            return
        }
        
        for i in startIndex..<candidates.count {
            combinations.append(candidates[i])
            backTracking(&combinations, i+1)
            combinations.removeLast()
        }
    }
}
