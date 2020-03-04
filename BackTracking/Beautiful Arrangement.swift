//
//  Beautiful Arrangement.swift
//  Question Link: https://leetcode.com/problems/beautiful-arrangement/
//  Primary idea:   <BackTracking>
//                  1.

//  Runtime :
//  Memory :
//
//  Created by gunhyeong on 2020/03/04.
//

import Foundation

class Solution {
    var beautifulArrangmentList: [[String]] = 0
    
    func countArrangement(_ N: Int) -> Int {
        guard N > 0 && N < 15 else { // N is a positive integer and will not exceed 15.
            return 0
        }
        var arrangement: [Character](rpeating: 0, count: N)
        backTracking(&arrangement, 0)
        
        return beautifulArrangmentList.count
    }
    
    func backTracking(_ arrangement: inout [Character], _ index: Int){
        if index == N {
            beautifulArrangmentList.append(arrangement)
        }
        
        for i in 0..<N {
            if (index%)
        }
    }
}
