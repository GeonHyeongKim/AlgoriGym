/*
*  Permutations II.swift
*  Question Link: https://leetcode.com/problems/permutations-ii/
*  Primary idea:   <BackTracking>
*                  1. DFS로 문제를 해결한다
*                  2. 중복제거
*                      1) 정렬(오름차순)을 통해 중복을 제거한다. (2-2에서 nums[i] == nums[i-1]로 인해 중복 제거)
*                      2) isVisited[i] : 지금 탐색할곳(nums의 i번쨰)가 방문한적이 있는지 확인
*                         i > 0 && nums[i] == nums[i-1] && isVisited[i-1] : i을 기준으로 i-1이 방문된적이 있는지 확인 및 같은 숫자인지 확인, i>0이 조건이 되어야 첫번째 index에서 error를 방지)
*
*  Time Complexity : O(n^n)
*  Space Complexity : O(n)
*  Runtime: 52 ms
*  Memory Usage: 21.3 MB
*
*  Created by gunhyeong on 2020/03/19.
*/

import Foundation

class Solution {
    func permuteUnique(_ nums: [Int]) -> [[Int]] {
        var result = [[Int]]()
        var permutations = [Int]()
        var isVisited = [Bool](repeating: false, count: nums.count)
        let nums = nums.sorted() // 2-1. 중복제거 - 정렬(오름차순)
        
        backTracking(nums, &result, &permutations, &isVisited)
        
        return result
    }
    
    func backTracking(_ nums: [Int], _ result: inout [[Int]], _ permutations: inout [Int], _ isVisited: inout [Bool]){
        if nums.count == permutations.count {
            result.append(permutations)
            return
        }
        
        for i in 0..<nums.count{
            if isVisited[i] || (i > 0 && nums[i] == nums[i-1] && isVisited[i-1]){ // 2-2. 중복제거
                continue
            }
            
            permutations.append(nums[i])
            isVisited[i] = true
            backTracking(nums, &result, &permutations, &isVisited) // 1. DFS
            isVisited[i] = false
            permutations.removeLast()
        }
    }
}
