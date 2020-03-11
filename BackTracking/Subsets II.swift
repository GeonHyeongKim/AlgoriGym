//
//  Subsets II.swift
//  Question Link: https://leetcode.com/problems/subsets-ii/
//  Primary idea:   <BackTracking>
//                  1. Subset 문제 응용 - 차이점은 2-2) 처럼 contains에 포함되어 있는지만 check
//                  2. 중복 피하기
//                      1) append하는 값을 미리 정렬해서
//                      2) contains를 통해 포함되어 있는지를 check
//


//  Time Complexity: O(n^n)
//  Space Complexity: O(n)
//  Runtime: 112 ms
//  Memory Usage: 21.4 MB
//
//  Created by gunhyeong on 2020/03/11.
//

import Foundation

class Solution {
    var subsets = [[Int]]()
    var nums = [Int]()
    
    func subsetsWithDup(_ nums: [Int]) -> [[Int]] {
        self.nums = nums.sorted() // 2-1. 중복 피하기
        var subset = [Int]()
        
        backTracking(&subset, 0)
        
        return subsets
    }
    
    func backTracking(_ subset: inout [Int], _ startIndex: Int){
        if !subsets.contains(subset) { // 2-2. 중복 피하기
            subsets.append(subset)
        }
        
        for i in startIndex..<nums.count {
            subset.append(nums[i])
            backTracking(&subset, i+1)
            subset.removeLast()
        }
    }
}
