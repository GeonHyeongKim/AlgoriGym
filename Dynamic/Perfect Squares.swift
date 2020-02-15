//
//  Perfect Squares.swift
//  Question Link: https://leetcode.com/problems/perfect-squares/
//  Primary idea:   1. Lagrange's four-square theorem을 이용한다. (즉 8로 나누었을때, 나머지가 7인 수는 모두 4개) n = 4^k(8k+7)
//                  2. dp를 이용, 배열에 해당에 하는 Index를 대입한다.

//  Time Complexity :
//  Space Complexity :
//
//  Created by gunhyeong on 2020/02/14.
//

import Foundation

class Solution {
    func numSquares(_ n: Int) -> Int {
        var n = n
        var result: Int
//        result = LagrangeFourSquareTheorem(&n)
//        result = _DP(&n)
        
        return result
    }
    
    ///Mark. 4ms
    func LagrangeFourSquareTheorem(_ n: inout Int) -> Int {
        guard n >= 4 else {
            return n
        }
        
        var n = n
        while (n % 4 == 0) {
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
    
    /// Mark. Time Limit Exceeded
    func _DP(_ n: inout Int) -> Int {
        guard n >= 4 else {
            return n
        }
        
        var result = [Int](repeating: INTPTR_MAX, count: n+1)
        result[0] = 0
        
        for i in 1..<n+1{
            for j in 1..<i where j*j<=i {
                result[i] = min(result[i], result[i-j*j]+1)
            }
        }
        
        return result.last!
    }
}
