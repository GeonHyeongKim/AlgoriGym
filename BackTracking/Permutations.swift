//
//  Permutations.swift
//  Question Link: https://leetcode.com/problems/permutations/
//  Primary idea:   <BackTracking>
//                  1. 우선 모든 경우에 수를 찍어 본다.
//                  2. result에 담는 조건과 for문을 탈출하는 조건을 생각한다.

//  Runtime : 32 ms
//  Memory : 21.1 MB    
//
//  Created by gunhyeong on 2020/03/01.
//

import Foundation

class Solution {
    func permute(_ nums: [Int]) -> [[Int]] {
        var nums = nums
        var result = [[Int]]()
        var curList = [Int]()
        
        guard nums.count > 0 else { // 반환 조건
            return result
        }
        
        dfs(&nums, &result, &curList) // 계산
        
        return result
    }

    func dfs(_ nums: inout [Int], _ result: inout [[Int]], _ curList: inout [Int]){
        // 1. 담는거
        if curList.count == nums.count {
            let list = curList
            result.append(list)
        }
        
        // 2. for 저장, 탈출
        for i in 0..<nums.count { // 탈출 조건
//            if curList.count == nums.count {
//                continue
//            }
            
            if curList.contains(nums[i]){
                continue
            }
            curList.append(nums[i])
            dfs(&nums, &result, &curList)
            curList.removeLast()
        }
    }
}
