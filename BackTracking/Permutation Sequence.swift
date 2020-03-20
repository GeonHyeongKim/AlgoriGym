/*
*  Permutation Sequence.swift
*  Question Link: https://leetcode.com/problems/permutation-sequence/
*  Primary idea:   <BackTracking>
*                  1. DFS로 문제 풀이
*                  2. 중복 방지 - 방문했던 곳이면 방문하지 않음
*                  3. 결과 저장 - 계산하고 있는 permutation의 길이가 n과 같을때
*
*  Time Complexity : O( )
*  Space Complexity : O( )
*  Runtime:  ms
*  Memory Usage:  MB
*
*  Created by gunhyeong on 2020/03/20.
*/

import Foundation

class Solution {
    func getPermutation(_ n: Int, _ k: Int) -> String {
        var result = [String]()
        var permutation = [Character]() // 임시
        var isVisited = [Bool](repeating: false, count: n) // 방문했는지 파악
        
        backTracking(n, &result, &permutation, &isVisited)

        return result[k-1]
    }
    
    func backTracking(_ n: Int, _ result: inout [String], _ permutation: inout [Character], _ isVisited: inout [Bool]){
        if permutation.count == n { // 3. 결과 저장
            result.append(String(permutation))
            return
        }
        
        for i in 1...n { // 1. DFS
            if isVisited[i-1] { // 2. 중복 방지
                continue
            }
            
            permutation.append(Character("\(i)"))
            isVisited[i-1] = true
            backTracking(n, &result, &permutation, &isVisited) // 1. DFS
            isVisited[i-1] = false
            permutation.removeLast()
        }
    }
}
