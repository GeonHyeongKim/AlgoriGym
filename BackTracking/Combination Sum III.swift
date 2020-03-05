//
//  Combination Sum III.swift
//  Question Link: https://leetcode.com/problems/beautiful-arrangement/
//  Primary idea:   <BackTracking>
//                  1. set으로 unique 보장
//                  2. 결과값 저장
//                      1) 계산한 Set 집합(combinationSet)의 갯수가 k개 인 경우
//                      2) 계산한 Set 집합(combinationSet)의 합(reduce 함수 이용)이 n일 경우
//                  3. 건너띄기 - Set 집합(combinationSet)에 contain되어 있으면 다음 숫자로 넘어가기

//  Runtime : 8 ms
//  Memory : 22.4 MB,
//
//  Created by gunhyeong on 2020/03/05.
//

import Foundation

class Solution {
    var result = [[Int]]()
    var k = Int(0)
    var n = Int(0)
    var endIndex = 10
    
    func combinationSum3(_ k: Int, _ n: Int) -> [[Int]] {
        guard k > 0 && k < 10 else {
            return result
        }
        
        self.k = k
        self.n = n
        
        var combinationSet = Set<Int>() // 1. set으로 unique 보장

        backTracking(&combinationSet, 1)
                
        return result
    }
    
    func backTracking(_ combinationSet: inout Set<Int>, _ startIndex: Int) {
        if combinationSet.count == k && combinationSet.reduce(0, +) == n { // 2. 결과값 저장
            result.append(Array(combinationSet).sorted()) // 오름차순 정렬
            return
        }
        
        for i in startIndex..<endIndex {
            if combinationSet.contains(i) { // 3. 건너띄기
                continue
            }
            
            combinationSet.insert(i)
            backTracking(&combinationSet, i + 1)
            combinationSet.remove(i)
        }
    }
}
