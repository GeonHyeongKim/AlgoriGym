//
//  정수 삼각형.swift
//  Question Link: https://www.acmicpc.net/problem/1932
//  Primary idea:       (DP)
//                      1. DP 2차원 문제
//                      2. dp[i][j] = max(dp[i-1][j-1], dp[i-1][j]) + arr[i][j]
//                         이떄, j(열의 범위)가 j > 0 이여야한다. 이를 방지하기 위해 최대 배열의 값을 501로 한다.
//
//  Time Complexity : O(n^2)
//  Space Complexity : O(1)
//  Runtime: 160 ms
//  Memory Usage: 68.524 MB
//
//  Created by gunhyeong on 2020/08/04.
//

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
