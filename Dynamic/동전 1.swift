/*
*  동전 1.swift
*  Question Link: https://www.acmicpc.net/problem/2293
*  Primary idea:    <Dynamic Programming>
*                   1. dp[1] = min(dp[1], dp[1 - coins[j]] + 1)
*                      1-1 = dp[0] = 0
*                      1-2 (x)
*                      1-5 (x)
*                   2. dp[i] = min(dp[i], dp[i - coins[j]] + 1)
*
*  Time Complexity :
*  Space Complexity :
*  Runtime:  ms
*  Memory Usage:  MB
*
*  Created by gunhyeong on 2020/05/03.
*/

import Foundation

var input = readLine()!.split(separator: " ")
var n = Int(input[0])!
var k = Int(input[1])!
var coins = [Int]()
var count = 0
var maxAmount_DP = [Int](repeating: -1, count: k+1)
maxAmount_DP[0] = 0

for _ in 1...n {
    let coin = Int(readLine()!)!
    coins.append(coin)
}

coins = coins.sorted()


for i in 1...k {
    for coin in coins {
        if coin > i { // 현재 값(i)이 coin을
            break
        }
        
        if maxAmount_DP[i - coin] == -1 {
            continue
        }
        
        maxAmount_DP[i] = maxAmount_DP[i] == -1 ? maxAmount_DP[i - coin] + 1 : max(maxAmount_DP[i - coin] + 1, maxAmount_DP[i])
    }
}

print(maxAmount_DP[k])

