//
//  숨바꼭질.swift
//  Question Link: https://www.acmicpc.net/problem/1697
//  Primary idea:       (BFS)
//                      1. BFS를 통해 한 점 x에서 x-1, x+1, x*2로 나아간다.
//                      2. 한번 퍼져나갈 때 1초가 걸리므로 동시에 이를 나타내는 A배열 값을 + 1씩 해준다
//                      3. visited배열과 A배열의 런타임에러가 발생하지 않도록 점의 범위인 ( 0<= N <= 100,000)에 들어오는지도 if조건문으로 확인
//
//  Time Complexity : O(V+E)
//  Space Complexity : O(V)
//  Runtime: 940 ms
//  Memory Usage: 82.232 MB
//
//  Created by gunhyeong on 2020/08/09.
//

import Foundation

let input = readLine()!.split(separator: " ").map{Int($0)!}
let N = input.first!
let K = input.last!
let INF = 100001
var visited = [Bool](repeating: false, count: INF)
var queue = [(Int, Int)]()
var answer = 0

queue.append((N, 0))

while !queue.isEmpty {
    let cur = queue.first!
    let pos = cur.0
    let depth = cur.1
    
    if pos == K { break }
    
    queue.removeFirst()
    
    if (pos - 1 >= 0) && !visited[pos - 1] {
        queue.append((pos - 1, depth + 1 ))
        visited[pos - 1] = true
    }
    if (pos + 1 <= 100000) && !visited[pos + 1] {
        queue.append((pos + 1, depth + 1 ))
        visited[pos + 1] = true
    }
    if (pos * 2 <= 100000) && !visited[pos * 2] {
        queue.append((pos * 2, depth + 1 ))
        visited[pos * 2] = true
    }
}

solution -> 5 17 -> 4
