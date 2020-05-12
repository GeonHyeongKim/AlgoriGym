/*
*  동전 1.swift
*  Question Link: https://www.acmicpc.net/problem/2293
*  Primary idea:      <Dynamic Programming>
*                     1. DP 문제: 내가 정한 결과 값은 이미 더 작은 값(이전 값)에서 구해져 있다.
*                         * DFS(Search의 개념)이 아니다.
*                     2. dp[j] += dp[j-a[i]]
*
*  Time Complexity : O(n^k)
*  Space Complexity : O(n)
*  Runtime:  ms
*  Memory Usage:  MB
*
*  Created by gunhyeong on 2020/05/03.
*/

import Foundation

// 런타임 에러
var input = readLine()!.split(separator: " ")
var n = Int(input[0])!
var k = Int(input[1])!
var coins = [Int]()
var maxAmount_DP = [Int](repeating: 0, count: k+1)
maxAmount_DP[0] = 1

for _ in 0..<n {
    coins.append(Int(readLine()!)!)
}

for i in 0..<n {
    for coin in 0...k {
        if coin >= coins[i] {
            maxAmount_DP[coin] += maxAmount_DP[coin - coins[i]]
        }
    }
}

print(maxAmount_DP[k])

