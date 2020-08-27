//
//  안전 영역.swift
//  Question Link: https://www.acmicpc.net/problem/1932
//  Primary idea:       (DP)
//                      1.
//
//  Time Complexity :
//  Space Complexity :
//  Runtime:  ms
//  Memory Usage:  MB
//
//  Created by gunhyeong on 2020/08/27.
//

import Foundation

let row = Int(readLine()!)!
var arr = [[Int]](repeating: [Int](repeating: 0, count: 501), count: 501)
var dp = [[Int]](repeating: [Int](repeating: 0, count: 501), count: 501)

for i in 1...row {
    let col = readLine()!.split(separator: " ").map{Int($0)!}
    
    for (j, value) in col.enumerated() {
        arr[i][j+1] = value
    }
}

dp[1][1] = arr[1][1] // 초기화

for i in 2...row {
    for j in 1...i {
        dp[i][j] = max(dp[i-1][j-1], dp[i-1][j]) + arr[i][j]
    }
}

print(dp[row].max()!)
