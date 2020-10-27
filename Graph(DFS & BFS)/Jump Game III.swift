//
//  Jump Game III.swift
//  Question Link: https://leetcode.com/problems/jump-game-iii/
//  Primary idea:       (Graph, dfs)
//                      1. index + arr[index], index - arr[index]의 두개의 index 값을 가지고 다음 위치를 계산
//                      2. index 위치로 간뒤, 1번을 반복
//                      3. 반복하면서 arr[index] 값이 0이면 종료
//
//  Time Complexity : O(n^n)
//  Space Complexity : O(n)
//  Runtime: 292 ms
//  Memory Usage: 15.8 MB
//
//  Created by gunhyeong on 2020/10/27.
//

import Foundation

class Solution {
    func canReach(_ arr: [Int], _ start: Int) -> Bool {
        var visited = [Bool](repeating: false, count: arr.count)
        visited[start] = true
        
        return dfs(arr, &visited, start)
    }
    
    func dfs(_ arr: [Int], _ visited: inout [Bool], _ position: Int) -> Bool {
        guard arr[position] != 0 else { return true }

        for pos in [position + arr[position], position - arr[position]] {
            if pos >= 0 && pos < arr.count && !visited[pos] {
                visited[pos] = true
                if dfs(arr, &visited, pos) {
                    return true
                }
                visited[pos] = false
            }
        }

        return false
    }
}
