/*
*  Divisor Game.swift
*  Question Link: https://leetcode.com/problems/divisor-game/
*  Primary idea:   <Dynamic Proramming>
*                  1. dp - index 0을 접근하지 않기 위해 N+1로 문제를 풀이 (top-down)
*                  2. 범위
*                      1) n의 범위 : 1 <= N <= 1000, 즉 2부터 n을 포함한 자연수
*                      2) x의 범위 : 0 < x < N
*                  3. 조건 - n % x == 0이면서 n - x의 값이 false인 경우,
*
*  Time Complexity : O(n^2)
*  Space Complexity : O(n)
*  Runtime: 24 ms
*  Memory Usage: 20.9 MB
*
*  Created by gunhyeong on 2020/03/23.
*/

import Foundation

class Solution {
    func divisorGame(_ N: Int) -> Bool {
        var dp = [Bool](repeating: false, count: N+1) // 1. dp
        for n in 2..<(N+1) { // 2-1. n의 범위
            for x in 1..<n { // 2-2. x의 범위
                if n%x == 0 && !dp[n-x]{ // 3. 조건
                    dp[n] = true
                    break
                }
            }
        }
        
        return dp[N]
    }
}
