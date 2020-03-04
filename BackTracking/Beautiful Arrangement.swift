//
//  Beautiful Arrangement.swift
//  Question Link: https://leetcode.com/problems/beautiful-arrangement/
//  Primary idea:   <BackTracking>
//                  1.

//  Runtime : 12 ms
//  Memory : 21.3 MB
//
//  Created by gunhyeong on 2020/03/04.
//

import Foundation

class Solution {
    var beautifulArrangments: [[String]] = 0
    
    func countArrangement(_ N: Int) -> Int {
        guard N > 0 && N < 15 else { // N is a positive integer and will not exceed 15.
            return 0
        }
        
        return beautifulArrangments.count
    }
}
