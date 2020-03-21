/*
*  CoinChange.swift
*  Question Link: https://leetcode.com/problems/coin-change/
*  Primary idea:   1. dp[1] = min(dp[1], dp[1 - coins[j]] + 1)
*                      1-1 = dp[0] = 0
*                      1-2 (x)
*                      1-5 (x)
*                  2. dp[i] = min(dp[i], dp[i - coins[j]] + 1)
*
*  Time Complexity : O(n^n)
*  Space Complexity : O(N)
*  Runtime: 768 ms
*  Memory Usage: 21.3 MB
*
*  Created by gunhyeong on 2020/02/08.
*/

import Foundation

class Solution {
    func coinChange(_ coins: [Int], _ amount: Int) -> Int {
        guard amount > 0 else {
            return 0
        }
        
        var coins = coins.sorted()
        var minAmount_DP = Array(repeating: -1, count: amount + 1)
        minAmount_DP[0] = 0

        for i in 1...amount {
            for coin in coins {
                if coin > i {
                    break;
                }

                if minAmount_DP[i-coin] == -1 {
                    continue
                }

                minAmount_DP[i] = minAmount_DP[i] == -1 ? minAmount_DP[i - coin] + 1 : min(minAmount_DP[i - coin] + 1, minAmount_DP[i])
            }
        }

        return (minAmount_DP[amount])
    }
}
