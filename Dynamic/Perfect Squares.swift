//
//  Perfect Squares.swift
//  Question Link: https://leetcode.com/problems/perfect-squares/
//  Primary idea:   1. Lagrange's four-square theorem을 이용한다. (즉 8로 나누었을때, 나머지가 7인 수는 모두 4개) n = 4^k(8k+7)
//
//  Time Complexity :
//  Space Complexity :
//
//  Created by gunhyeong on 2020/02/14.
//

import Foundation

class Solution {
    func numSquares(_ n: Int) -> Int {
        guard n >= 4 else {
            return n
        }
        
        var n = n
        while (n % 4 == 0) { // Lagrange's four-square theorem
            n = n/4
        }
        
        guard n%8 != 7 else { // Lagrange's four-square theorem
            return 4
        }
                
        for square in 0..<n where (square * square <= n) {
            var minSqrt = Int(sqrt(Double(n-square*square)))
            if (minSqrt*minSqrt + square*square) == n {
                return (square == 0) ? 1 : 2
            }
        }
        return 3
    }
}
