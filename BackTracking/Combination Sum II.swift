//
//  Combination Sum II.swift
//  Question Link: https://leetcode.com/problems/combination-sum-ii/
//  Primary idea:   <BackTracking>
//                  1. 중복 방지 - candidates을 미리 오름 차순으로 정렬후
//                      1) i != startIndex : 자기 자신을 다시 방문하는 것을 방지
//                      2) candidates[i] == candidates[i - 1] : 정렬되어 있기 때문에 입력한 것은 다시 쓰지 않기
//                  2. 결과를 저장할때, 저장된 합계가 target과 같은지와 정렬된 값을 비교한다. (x)
//                  -> 2. target을 줄이는 방식이기 떄문에 0이 되면 sum과 같은 효과를 얻을 수 있다.
//                  3. 탈출 조건 : target < 0 을 하지 않으면 무한 루프에 빠지게 된다.
//

//  Runtime: 48 ms
//  Memory Usage: 21 MB
//
//  Created by gunhyeong on 2020/03/09.
//

import Foundation

class Solution {
    var result = [[Int]]()
    var candidates = [Int]()
    
    func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
        guard candidates.count > 0 && target > 0 else {
            return result
        }
        
        self.candidates = candidates.sorted()
        var combinations = [Int]()
        
        backTracking(&combinations, 0, target)
        
        return result
    }
    
    func backTracking(_ combinations: inout [Int] , _ startIndex: Int, _ target: Int) {
        if target == 0 { // 2. 결과 저장
            result.append(combinations)
            return
        }
        
        if target < 0 { // 3. 탈출 조건
            return
        }
        
        for i in startIndex..<candidates.count {
            if i != startIndex && candidates[i] == candidates[i - 1] { // 1. 중복 방지
                continue
            }
            
            combinations.append(candidates[i])
            backTracking(&combinations, i+1, target-candidates[i]) // 3-1. reduce를 없애기
            combinations.removeLast()
        }
    }
}
