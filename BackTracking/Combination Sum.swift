/*
*  Combination Sum.swift
*  Question Link: https://leetcode.com/problems/combination-sum/
*  Primary idea:   <BackTracking>
*                  1. 계산된 candidate
*                  2. 방금 포함된 candidate의 중복 허용 조건 - 반복문으로 startIndex가 i+1이 아닌 i이기 때문에 한계점을 정함
*                  3. 결과값 저장 - 계산된 candidate의 합이 target과 같을 때
*
*  Time Complexity : O(n^n)
*  Space Complexity : O(2^n - 1)
*  Runtime: 164 ms
*  Memory Usage: 21.2 MB
*
*  Created by gunhyeong on 2020/03/05.
*/

import Foundation

class Solution {
    var selectedCandidates = [[Int]]()
    var candidates = [Int]()
    var target = Int()
    
    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        guard candidates.count > 0 else {
            return selectedCandidates
        }
        
        self.candidates = candidates.sorted()
        self.target = target
        var candidate = [Int]() // 1. 계산된 candidate
        
        backTracking(&candidate, 0, 0)
        
        return selectedCandidates
    }
    
    func backTracking(_ candidate: inout [Int], _ sum: Int, _ startIndex: Int){
        if sum > target { // 2. 방금 포함된 candidate의 중복 허용 조건
            return
        }
        
        if sum == target { // 2. 결과값 저장
            selectedCandidates.append(candidate.sorted())
            return
        }
        
        for i in startIndex..<candidates.count {
            candidate.append(candidates[i])
            backTracking(&candidate, sum + candidates[i], i)
            candidate.removeLast()
        }
    }
}
