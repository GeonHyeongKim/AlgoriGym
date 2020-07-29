//
//  유기농 배추.swift
//  Question Link: https://www.acmicpc.net/problem/1012
//  Primary idea:       (DFS & BFS)
//                      0. 땅의 모습이 아니라 배추의 위치가 주어지는 문제
//                      1. DFS로 문제를 풀어본다.
//                      2. 인접행렬로 그래프를 만든다.
//                      3. 방문한 장소를 구별하기 위해 visited라는 Bool 배열을 만든다.
//                      4. 1번과 연결된 컴퓨터의 숫자만 count하면 되기 때문에 dfs를 활용
//
//  Time Complexity :
//  Space Complexity :
//  Runtime: ms
//  Memory Usage:  MB
//
//  Created by gunhyeong on 2020/07/29.
//

import Foundation

var testCase = Int(readLine()!)!
let dx = [-1, 0, 1, 0]
let dy = [0, 1, 0,-1]
var row = 0
var col = 0

while testCase > 0 {
    testCase -= 1
    
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    row = input[0]
    col = input[1]
    let position = input[2]
    var answer = 0
    
    var graph = [[Int]](repeating: [Int](repeating: 0, count: col), count: row)
    var visited = [[Bool]](repeating: [Bool](repeating: false, count: col), count: row)
    
    for _ in 0..<position {
        let input = readLine()!.split(separator: " ").map{Int($0)!}
        let x = input.first!
        let y = input.last!
        
        graph[x][y] = 1
    }
    
    for i in 0..<row {
        for j in 0..<col {
            if !visited[i][j] && graph[i][j] == 1 {
                dfs(&graph, &visited, i, j)
                answer += 1
            }
        }
    }
    
    print(answer)
}

func dfs(_ graph: inout [[Int]], _ visited: inout [[Bool]], _ i: Int, _ j: Int) {
    visited[i][j] = true
    
    for dir in 0..<4 {
        let x = i + dx[dir]
        let y = j + dy[dir]
        
        if x < 0 || x >= row || y < 0 || y >= col {
            continue
        }
        
        if !visited[x][y] && graph[x][y] == 1 {
            dfs(&graph, &visited, x, y)
        }
    }
}
