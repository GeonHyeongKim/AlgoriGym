//
//  바이러스.swift
//  Question Link: https://www.acmicpc.net/problem/2606
//  Primary idea:       (DFS & BFS)
//                      1. DFS로 문제를 풀어본다.
//                      2. 인접행렬로 그래프를 만든다.
//                      3. 방문한 장소를 구별하기 위해 visited라는 Bool 배열을 만든다.
//                      4. 1번과 연결된 컴퓨터의 숫자만 count하면 되기 때문에 dfs를 활용
//
//
//  Time Complexity :
//  Space Complexity :
//  Runtime: ms
//  Memory Usage:  MB
//
//  Created by gunhyeong on 2020/07/29.
//

import Foundation

let cntComputer = Int(readLine()!)!
let cntNetwork = Int(readLine()!)!
var visited = [Bool](repeating: false, count: cntComputer+1)
var network = [[Int]](repeating: [Int](repeating: 0, count: cntComputer+1), count: cntComputer+1)
var answer = 0

for _ in 0..<cntNetwork {
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    let start = input.first!
    let end = input.last!
    
    network[start][end] = 1
    network[end][start] = 1
}

dfs(1)
print(answer)

func dfs(_ start: Int) {
    visited[start] = true
    
    for i in 2...cntComputer {
        if !visited[i] && network[start][i] == 1 {
            answer += 1
            dfs(i)
        }
    }
}
