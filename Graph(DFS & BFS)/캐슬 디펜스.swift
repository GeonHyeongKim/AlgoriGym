//
//  캐슬 디펜스.swift
//  Question Link: https://www.acmicpc.net/problem/17135
//  Primary idea:       (DFS & BFS)
//                      1.
//
//  Time Complexity :
//  Space Complexity :
//  Runtime:  ms
//  Memory Usage:  MB
//
//  Created by gunhyeong on 2020/08/08.
//

import Foundation

let info = readLine()!.split(separator: " ").map{Int($0)!}
let row = info[0]
let col = info[1]
let maxDist = info[2]
var visited = [Bool](repeating: false, count: col)
var artherPosList = [[Int]]()
var board = [[Int]]()

for _ in 0..<row {
    let cols = readLine()!.split(separator: " ").map{Int($0)!}
    board.append(cols)
}

dfs(0, [])
print(artherPosList)

// 거리 계산
func dist(_ x: Int, _ y: Int, _ xx: Int, _ yy: Int ) -> Int {
    return abs(x - xx) + abs(y - yy)
}

// 궁수의 모든 위치 구하기 - 호합
func dfs(_ startIndex: Int, _ cur: [Int]) {
    if cur.count == 3 {
        artherPosList.append(cur)
        return
    }
    
    for i in startIndex..<col {
        if !visited[i] {
            visited[i] = true
            dfs(i, cur + [i])
            visited[i] = false
        }
    }
}
