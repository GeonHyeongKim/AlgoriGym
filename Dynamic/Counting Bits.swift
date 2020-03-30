/*
*  Counting Bits.swift
*  Question Link: https://leetcode.com/problems/counting-bits/
*  Primary idea:   <Dynamic programming>
*                  1.
*
*  Time Complexity : O()
*  Space Complexity : O()
*  Runtime:  ms
*  Memory Usage:  MB
*
*  Created by gunhyeong on 2020/03/30.
*/

import Foundation


/*
*  Primary idea:   <Brute force>
*  Time Complexity : O(n^2)
*  Space Complexity : O(n)
*  Runtime:  ms
*  Memory Usage:  MB
*/
class Solution {
    func countBits(_ num: Int) -> [Int] {
        var dp = [Int](repeating: 0, count: num+1)
        
        for binary in 0...num {
            for bit in String(binary, radix: 2) { // binary 표현 후, 1개의 bit씩을 개산
                if bit == "1"{
                    dp[binary] += 1
                }
            }
        }
        
        return dp
    }
}
