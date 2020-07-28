//
//  DFS와 BFS(DFS).swift
//  Question Link: https://www.acmicpc.net/problem/1260
//  Primary idea:       <DFS & BFS>
//                      1.
//
//  Time Complexity : O(n^n)
//  Space Complexity : O(n^2)
//  Runtime:  ms
//  Memory Usage:  MB
//
//  Created by gunhyeong on 2020/07/26.
//

import Foundation

let input = readLine()!.split(separator: " ").map{Int($0)!}
let n = input[0]
let m = input[1]
let v = input[2]

var visited = [Bool](repeating: false, count: 100001)
var graph = [[Int]](repeating: [Int](repeating: 0, count: 1001), count: 1001)

for _ in 1...m {
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    let start = input[0]
    let end = input[1]
    graph[start][end] = 1
    graph[end][start] = 1
}

dfs(v)
print()
visited = [Bool](repeating: false, count: 100001)
bfs(v)

func dfs(_ start: Int) {
    visited[start] = true
    
    print(start, terminator: " ")
    
    for i in 1...m {
        if !visited[i] && graph[start][i] == 1 {
            dfs(i)
        }
    }
}


func bfs(_ start: Int) {
    var queue = [Int]()
    queue.append(start)
    visited[start] = true
    
    while !queue.isEmpty {
        let vertex = queue.removeFirst()
        print(vertex, terminator: " ")
        for i in 1...m {
            if !visited[i] && graph[start][i] == 1 {
                queue.append(i)
                visited[i] = true
            }
        }
    }
}
