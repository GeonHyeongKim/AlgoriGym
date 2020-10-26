//
//  Sort Integers by The Power Value.swift
//  Question Link: https://leetcode.com/problems/sort-integers-by-the-power-value/
//  Primary idea:       (Graph, DP)
//                      1. 홀수인경우 kx3 + 1 , 짝수인경우 k/2를 해서 1이 될때까지 만드는 문제
//
//  Time Complexity : O(n^2)
//  Space Complexity : O(n^2)
//  Runtime: 644 ms
//  Memory Usage: 14.1 MB
//
//  Created by gunhyeong on 2020/10/25.
//

import Foundation

class Solution {
    func getKth(_ lo: Int, _ hi: Int, _ k: Int) -> Int {
        var arr = [[Int]]()
        
        for num in lo...hi {
            arr.append([num, steps(num)])
        }
        
        arr.sort(by: {
            if $0.last! == $1.last! {
                return $0.first! < $0.first!
            }
            return $0.last! < $1.last!
        })
        
        return arr[k-1][0]
    }
    
    func steps(_ num:Int) -> {
        var num = num
        var count = 1
        
        while num != 1 {
            num = num % 2 == 0 ? num / 2 : num * 3 + 1
            count += 1
        }
        
        return count
    }
}
