//
//  파이프 옮기기 1.swift
//  Question Link: https://www.acmicpc.net/problem/17070
//  Primary idea:       (BFS)
//                      1. BFS로 queue와 while을 활용한다.
//                      2. 위치 정보와 가로(0)/세로(1)/대각선(2)을 표시하는 방향 정보를 queue에 저장한다.
//                      3. queue의 앞에서 하나씩 불러오며 3가지의 방향을 진행한다.
//                      4. 가로(0) -> 세로(1), 세로(1) -> 가로(0)는 갈 수 없으므로 합이 1일 때는 제외한다.
//                      5. 대각선(2)일 때는 걸치는 부분이 모두 1이 아닌지를 체크한다.
//                      6. 모두 만족하면 queue에 저장한다.
//
//  Time Complexity : O(n^n)
//  Space Complexity : O(n^2)
//  Runtime:  ms
//  Memory Usage:  MB
//
//  Created by gunhyeong on 2020/08/07.
//

import Foundation

let size = Int(readLine()!)!
var map = [[Int]]()

for _ in 0..<size {
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    map.append(input)
}

let dirs = [[0, 1], [1, 0], [1, 1]]
var answer = 0
var queue = [(Int, Int, Int)]()
queue.append((0, 1, 0))

while !queue.isEmpty {
    let cur = queue.removeFirst()
    let x = cur.0
    let y = cur.1
    let direction = cur.2
    
    if x == size - 1 && y == size - 1 {
        answer += 1
        continue
    }
    
    for (i, dir) in dirs.enumerated() {
        let x = x + dir.first!
        let y = y + dir.last!
        
        if (direction + i) == 1 { continue } // (row -> col) or (col -> row)
        
        if x >= size || y >= size || map[x][y] == 1 { continue }
        
        if i == 2 { // cross
            if map[x-1][y] == 0 && map[x][y-1] == 0 {
                queue.append((x, y, i))
            }
        } else {
            queue.append((x, y, i))
        }
    }
}

print(answer)
