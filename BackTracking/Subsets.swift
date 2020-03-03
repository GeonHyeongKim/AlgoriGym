//
//  Subsets.swift
//  Question Link: https://leetcode.com/problems/subsets/
//  Primary idea:   <BackTracking>
//                  1. 결과를 담기
//                  2. for 저장, 탈출
//                      1) for에서 시작하는 index의 시작값은 parameter로 들어온 index 변수값으로 시작한다.

//  Runtime : 12 ms
//  Memory : 21.3 MB
//
//  Created by gunhyeong on 2020/03/03.
//

import Foundation

class Solution {
    var result = [[Int]]()
    var nums = [Int]()
    
    func subsets(_ nums: [Int]) -> [[Int]] {
        guard nums.count > 0 else {
            return result
        }
        
        self.nums = nums.sorted(by : <)
        var num = [Int]()
        
        backTracking(&num, 0)
        
        return result
    }
    
    func backTracking(_ num: inout [Int], _ index: Int) {
        result.append(num) // 1. 결과 담기
        
        for i in index..<nums.count { // 2. for 저장, 탈출
            num.append(nums[i])
            backTracking(&num, i+1)
            num.removeLast()
        }
    }
}
