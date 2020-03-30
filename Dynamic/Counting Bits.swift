/*
*  Counting Bits.swift
*  Question Link: https://leetcode.com/problems/counting-bits/
*
*  Created by gunhyeong on 2020/03/30.
*/

import Foundation

/*
*  Primary idea:   <Brute force>
*  Time Complexity : O(n^2)
*  Space Complexity : O(n)
*  Runtime: 140 ms
*  Memory Usage: 24.3 MB
*/

class Solution {
    func countBits(_ num: Int) -> [Int] {
        var dp = [Int](repeating: 0, count: num+1)
        
        for binary in 0...num {
            for bit in String(binary, radix: 2) { // binary 표현 후, 1개의 bit씩을 계산
                if bit == "1"{
                    dp[binary] += 1
                }
            }
        }
        
        return dp
    }
}


/*
*  It is very easy to come up with a solution with run time O(n*sizeof(integer)).
*  But can you do it in linear time O(n) /possibly in a single pass?
*  Space complexity should be O(n).
*  Can you do it like a boss? Do it without using any builtin function like __builtin_popcount in c++ or in any other language.
*  Primary idea:   <Dynamic programming>
*                  1. dp
*                  2. bit의 성질
*                     1) 홀수 : (홀수 - 1)의 1의 갯수 + 1
*                     2) 짝수 : (짝수 / 2)의 갯수와 같음
*
*  Time Complexity : O(n)
*  Space Complexity : O(n)
*  Runtime: 68 ms
*  Memory Usage: 24.6 MB
*/

class Solution {
    func countBits(_ num: Int) -> [Int] {
        var dp = [Int](repeating: 0, count: num+1) // 1. dp
        
        for bit in 0...num {
            dp[bit] = dp[bit>>1] + (bit%2) // 2. bit의 성질
        }
        
        return dp
    }
}
