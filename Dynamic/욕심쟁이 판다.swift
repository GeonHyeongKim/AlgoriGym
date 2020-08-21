//
//  욕심쟁이 판다.swift
//  Question Link: https://www.acmicpc.net/problem/1937
//  Primary idea:       (Dynamic Programming)
//                      1. 시작지점에서 동, 서, 남, 북 4방향을 살펴 봅니다.
//                      2. 4방향 중 숫자가 큰 y, x 를 재귀함수로 call한 후 +1 해줍니다.
//                      3. 더 큰 숫자가 나타나지 않을 때까지 재귀함수를 call한 후 가장 큰 숫자를 저장하여 출력합니다.
//
//  Time Complexity : O(n^n)
//  Space Complexity : O(n^2)
//  Runtime:  ms
//  Memory Usage:  MB
//
//  Created by gunhyeong on 2020/08/21.
//

import Foundation

let size = Int(readLine()!)!
var board = [[Int]]()

for _ in 0..<size {
    let cols = readLine()!.split(separator: " ").map{Int($0)!}
    board.append(cols)
}

let dx = [-1, 0, 1, 0]
let dy = [0, -1, 0 ,1]
var dp = [[Int]](repeating: [Int](repeating: 0, count: size), count: size)

dp[0][0] = 1

var answer = 0

for i in 0..<size {
    for j in 0..<size {
        answer = max(answer, dfs(i, j))
    }
}

print(answer)

func dfs(_ i: Int, _ j: Int) -> Int {
    if dp[i][j] != 0 { return dp[i][j] }
    
    dp[i][j] = 1
    
    for v in 0..<4 {
        let x = i + dx[v]
        let y = j + dy[v]
        
        if x < 0 || x >= size || y < 0 || y >= size || board[i][j] >= board[x][y] { continue }
        
        dp[i][j] = max(dp[i][j], dfs(x, y) + 1)
    }
    return dp[i][j]
}
