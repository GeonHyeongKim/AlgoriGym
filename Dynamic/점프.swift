//
//  점프.swift
//  Question Link: https://www.acmicpc.net/problem/1890
//  Primary idea:       (Dynamic Programming)
//                      1. 2차원 배열을 사용하여 DP를 만든다. dp[i][j] 배열의 값의 의미는 (i,j)까지 올때까지 걸린 갯수를 말한다.
//                      2. dp값이 0일 경우와 size를 넘길경우 continue
//                      3. 값의 변경은 해당값이 size보다 작을 경우 누적값으로 저장해놓는다.
//                      4. 정답은 dp[size-1][size-1]에 저장되게 된다.
//
//  Time Complexity : O(n^2)
//  Space Complexity : O(n^2)
//  Runtime: 16 ms
//  Memory Usage: 81.336 MB
//
//  Created by gunhyeong on 2020/08/20.
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

for i in 0..<size {
    for j in 0..<size {
        if dp[i][j] == 0 || (i == size - 1 && j == size - 1) { continue }
        let value = board[i][j]
        let dx = value + i
        let dy = value + j
        
        if dx < size { dp[dx][j] = dp[dx][j] + dp[i][j] }
        if dy < size { dp[i][dy] = dp[i][dy] + dp[i][j] }
    }
}

print(dp[size-1][size-1])


4
2 3 3 1
1 2 1 3
1 2 3 1
3 1 1 0
3
